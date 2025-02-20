# Set up your own workding directory (basically to read the colour codes and gene list choices)
#setwd('/Users/iimaz/Dropbox/Embryo/embryo2020/sharing_plots/Shiny_preliminary')

library(data.table)
library(gridExtra)
library(rintrojs)
library(ggplot2)
library(cowplot)
library(ggrepel)
library(shiny)
library(grid)
library(jsonlite)
library(httr)

source('shiny_colour_palettes.R')

big_plot_width  = "600px"
big_plot_height = "600px"

# This is the list of gene choices to plot expression values, probably can also be extracted directly from scarf
#gene_map <- read.table("shared_gene_map.tab", header = TRUE)
#genes    <- unique(c(as.character(gene_map$symbol),
#                     as.character(gene_map$ensembl)))
#writeLines(genes, "gene_list_choices")
genes <- readLines("gene_list_choices.txt") # you can query both, ensembl and symbol

# Same function twice below, just to highlight if we are extracting genes or cell metadata
get_gene_from_scarf <- function(gene_id) {
  print ("Making an gene call")
  url <- paste0('http://127.0.0.1:19751/get_genedata/', gene_id)
  resp <- content(GET(url, encode = "json"))
  if (resp$msg == 'OK'){
    print ("Successful gene call")
    return(unlist(resp$values))
  }
  else {
    print ("Request failed")
    print(resp$msg)
    return(FALSE)
  }
}

get_cell_metadata_from_scarf <- function(cell_meta) {
  print ("Making an API call")
  url <- paste0('http://127.0.0.1:19751/get_celldata/', cell_meta)
  resp <- content(GET(url))
  if (resp$msg == 'OK'){
    print ("Successful call")
    return(unlist(resp$values))
  }
  else {
    print ("Request failed")
    print(resp$msg)
    return(FALSE)
  }
}

# To subsample the plot and make much faster rendering - taken from iSEE
subsetPointsByGrid <- function(X, Y, resolution=200, seed = 42) {
  set.seed(seed)
  # Avoid integer overflow when computing ids.
  resolution <- max(resolution, 1L)
  resolution <- min(resolution, sqrt(.Machine$integer.max))
  resolution <- as.integer(resolution)
  
  # X and Y MUST be numeric.
  rangeX <- range(X)
  rangeY <- range(Y)
  
  binX <- (rangeX[2] - rangeX[1])/resolution
  xid <- (X - rangeX[1])/binX
  xid <- as.integer(xid)
  
  binY <- (rangeY[2] - rangeY[1])/resolution
  yid <- (Y - rangeY[1])/binY
  yid <- as.integer(yid)
  
  # Getting unique IDs, provided resolution^2 < .Machine$integer.max
  # We use fromLast=TRUE as the last points get plotted on top.
  id <- xid + yid * resolution 
  !duplicated(id, fromLast=TRUE)
}



server <- function(input, output, session) {

  # Select layout
  selectedLayout <- reactive({
    layout <- data.frame(
      Dim1 = get_cell_metadata_from_scarf(paste0(input$coord_type,"1")),
      Dim2 = get_cell_metadata_from_scarf(paste0(input$coord_type,"2"))
    )
    layout
  })
  
  
  # Select Gene 
  selectedGeneCounts <- reactive({
    df <- selectedLayout()
    df$logcounts <- get_gene_from_scarf(input$Gene)
    df
  })
  
  # Colour layout by metadata
  pt_overview <- reactive({
    df <- selectedLayout()
    df$obs  = get_cell_metadata_from_scarf(input$colourby)
    colnames(df)[3] <- input$colourby
    #browser()
    
    point.size = 0.1
 
    category = switch(input$colourby,
                        "celltype_PijuanSala2019"= "Cell type - Pijuan Sala et al., 2019",
                        "celltype_extended_atlas"= "Cell type extended",
#                        "celltype"               = "Cell type",
#                        "celltype.extended"      = "Cell type extended",
#                        "celltype.descendant"    = "Cell type + descendant",
                        "stage"                  = "Time-point",
                        "somite_count"           = "Somite count",
                        "phase"                  = "Cell cycle phase",
                        "leiden"                 = "Louvain clusters",
                        "louvain"                = "Leiden clusters",
                        "embryo_version"         = "Project version",
                        "anatomy"                = "Anatomy")
    
    plot.index = switch(input$colourby,
                     "celltype_PijuanSala2019"= rev(1:nrow(df)),
                     "celltype_extended_atlas"= sample(nrow(df)),
#                    "celltype"               = rev(1:nrow(df)),
#                    "celltype.extended"      = rev(1:nrow(df)),
#                    "celltype.descendant"    = rev(1:nrow(df)),
                     "stage"                  = rev(1:nrow(df)),
                     "somite_count"           = 1:nrow(df),
                     "phase"                  = sample(nrow(df)),
                     "leiden"                 = sample(nrow(df)),
                     "louvain"                = sample(nrow(df)),
                     "embryo_version"         = rev(1:nrow(df)),
                     "anatomy"                = c(1:116312, sample((116312+1):nrow(df))))
    
    palette = switch(input$colourby,
                     "celltype_PijuanSala2019"= celltype_palette,
                     "celltype_extended_atlas"= celltype_extended_palette,
#                    "celltype"               = celltype_palette,
#                    "celltype.extended"      = celltype_palette,
#                    "celltype.descendant"    = celltype_palette,
                     "stage"                  = stage_palette,
                     "somite_count"           = somites_palette,  
                     "phase"                  = phase_palette,
                     "leiden"                 = leiden_palette,
                     "louvain"                = louvain_palette,
                     "embryo_version"         = version_palette,
                     "anatomy"                = tube_name_palette)
    
    level_order = switch(input$colourby,
                         "celltype_PijuanSala2019"= factor(df$celltype_PijuanSala2019, levels=names(celltype_colours)),
                         "celltype_extended_atlas"= factor(df$celltype_extended_atlas, levels=names(celltype_colours_final)),
 #                        "celltype"               = factor(df$celltype, levels=names(celltype_colours_extended)),
 #                        "celltype.extended"      = factor(df$celltype.extended, levels=names(celltype_colours_extended)),
 #                        "celltype.descendant"    = factor(df$celltype.descendant, levels=names(celltype_colours_extended)),
                         "stage"                  = factor(df$stage, levels=names(stage_colours_extension)),
                         "somite_count"           = factor(df$somite_count, levels=names(somite_count_colours)),
                         "phase"                  = factor(df$phase, levels=names(phase_colours)),
                         "leiden"                 = factor(df$leiden, levels=names(leiden_colours)),
                         "louvain"                = factor(df$louvain, levels=names(louvain_colours)),
                         "embryo_version"         = factor(df$embryo_version, levels=names(version_colours)),
                         "anatomy"                = factor(df$anatomy, levels=names(tube_colours_corrected)))

    #browser()
    if(!is.null(palette)){
      df[, 3] <- level_order
      df      <- df[plot.index,]
    }
    #browser()
    if(input$numbers){
      cluster <- df[,3]
      centroids    <- data.frame(X = sapply(unique(cluster), 
                                 function(x) median(df[cluster == x, 1])),
                      Y = sapply(unique(cluster), 
                                 function(x) median(df[cluster == x, 2])),
                      num = unique(cluster))
      centroids$num <- gsub(" ", "\n", centroids$num)
    }
    
    if(input$subset){
      subset <- subsetPointsByGrid(df[,1], df[,2], 100)
      df     <- df[subset,]
      point.size <- 2
      plot.index <- plot.index[subset]
    }
    if(input$colourby != "celltype_extended_atlas"){                                        
      p <- ggplot(df, aes_string(x = "Dim1", y = "Dim2", col = input$colourby)) +
        geom_point(size = point.size, shape = 16) +
        labs(x = "Dim 1", y = "Dim 2") +
        theme_minimal() + theme(legend.position = "none") +
        labs(caption=paste0(input$coord_type, " layout of mouse development."," Cells are coloured by ",category,".")) + 
        theme(plot.caption = element_text(hjust=0.5, size=rel(1))) +
        theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) +
        theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
        guides(colour = guide_legend(override.aes = list(size=7),nrow=16))
    }else{
      p <- ggplot(df, aes_string(x = "Dim1", y = "Dim2", col = input$colourby)) +
        geom_point(size = point.size, shape = 16) +
        labs(x = "Dim 1", y = "Dim 2") +
        theme_minimal() + theme(legend.position = "none") +
        labs(caption=paste0(input$coord_type, " layout of mouse development."," Cells are coloured by ",category,".")) + 
        theme(plot.caption = element_text(hjust=0.5, size=rel(1))) +
        theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) +
        theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank()) +
        guides(colour = guide_legend(override.aes = list(size=7),nrow=28))
    }    
    if(input$numbers){
      p + palette + geom_label_repel(
        data = centroids, 
        mapping = aes(x = X, 
                      y = Y, 
                      label = num), 
        col = "black", 
        alpha = 0.8, 
        size = 4
      )
    }else{
      p + palette
    }
  })

  output$plot_overview = renderPlot({
    plot_grid(pt_overview(), get_legend(pt_overview() + theme(legend.position = "top")), rel_widths = c(1, 1))    
  })
  
  output$expression <- renderPlot({
    df <- selectedGeneCounts()
    plot.index <- order(df$logcounts)
    ggplot(df[plot.index,], aes(x = Dim1, y = Dim2, colour = logcounts)) + 
      geom_point(size = .5) +
      scale_color_gradient(low="gray", high="darkgreen") +
      labs(color = paste0(input$Gene,"\nlog(counts)")) +
      theme_minimal() + 
      xlab("Dimension 1") + ylab("Dimension 2")
  })
  
  
}


### ui.r

ui <- fluidPage(introjsUI(),
                
  # Application title
  #titlePanel(""),
  
  sidebarLayout(
    
    # Sidebar with a slider input
    sidebarPanel(
      id="sidebar",
      # style = "position:fixed;width:15%;",
      width = 2,
      h3("Plot options"),
      selectInput(
        'coord_type',
        'Projection type',
        choices = c("UMAP"  = "UMAP",
                    "tSNE" = "tSNE",
                    "FA"  = "FA"),
        selected="UMAP"
      ),
      selectInput(
        "colourby",
        "Plot colour",
        choices = c(
          "Cell type - Pijuan Sala et al., 2019" = "celltype_PijuanSala2019",
          "Cell type extended" = "celltype_extended_atlas",
#          "Cell type" = "celltype",
#          "Cell type extended"   = "celltype.extended",
#          "Cell type + descendant" = "celltype.descendant",
          "Time-point" = "stage",
          "Somite count" = "somite_count",
          "Anatomy" = "anatomy",
          "Cell cycle phase" = "phase",
          "Louvain clusters" = "louvain",
          "Leiden clusters"  = "leiden",
          "Project version" = "embryo_version"
        ),
        selected = "celltype_PijuanSala2019"
      ),
      selectInput('Gene', 'Choose gene', choices=genes, selected="Tal1"
      ),
      checkboxInput("numbers", "Annotate clusters in plot", FALSE),
      checkboxInput("subset", "Subset cells (faster plots when many points present)", FALSE)
    ),
    # ...
    mainPanel(
      id = "main",
      #width = 10,
      titlePanel(
        "An extended single-cell molecular map of mouse gastrulation and early organogenesis."
      ),
      tabsetPanel(
        id = "tabs",
        tabPanel(
          "Dataset overview",
          id = "overview",
          plotOutput('plot_overview', width = "1250px", height ="700px")
           #plotOutput("stage_contribution", width = big_plot_width)
        ),
        tabPanel(
          "Gene interrogation",
          id = "expression",
          plotOutput('expression', width = "750px", height = big_plot_height)
          #plotOutput("gene_violin", width = big_plot_width)
        )
      )
    )
  )
)


# Run application
shinyApp(ui=ui,server=server)
