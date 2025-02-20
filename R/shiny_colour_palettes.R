brary(wesanderson)
library(viridis)
library(scales)

celltype_colours_final = c(
                     "Epiblast" = "#635547",
                     "Primitive Streak" = "#DABE99",
                     "Caudal epiblast" = "#9e6762",
                     
                     "PGC" = "#FACB12",
                     
                     "Anterior Primitive Streak" = "#c19f70",
                     "Node"="#153b3d",
                     "Notochord" = "#0F4A9C",

                     "Gut tube" = "#EF5A9D",
                     "Hindgut" = "#F397C0",
                     "Midgut"  = "#ff00b2",
                     "Foregut" = "#ffb7ff",  
                     "Pharyngeal endoderm"="#95e1ff",
                     "Thyroid primordium"="#97bad3",
                                          
                     "Nascent mesoderm" = "#C594BF",
                     "Intermediate mesoderm" = "#139992",
                     "Caudal mesoderm" = "#3F84AA",
                     "Lateral plate mesoderm" = "#F9DFE6",
                     "Limb mesoderm" = "#e35f82",
                     "Forelimb" = "#d02d75",
                     "Kidney primordium" = "#e85639",
                     "Presomitic mesoderm"="#5581ca",#"#0000ff",#blue
                     "Somitic mesoderm" = "#005579",
                     "Posterior somitic tissues" = "#5adbe4",#"#40e0d0",#turquoise

                     "Paraxial mesoderm" = "#8DB5CE",
                     "Cranial mesoderm" = "#456722",#"#006400",#darkgreen
                     "Anterior somitic tissues"= "#d5e839",
                     "Sclerotome" = "#e3cb3a",#"#ffff00",#yellow
                     "Endotome" = "#7b742f",
                     "Dermomyotome" = "#00BFC4",#"#a52a2a",#brown

                     "Pharyngeal mesoderm" = "#C9EBFB",
                     "Cardiopharyngeal progenitors" = "#556789",
                     "Anterior cardiopharyngeal progenitors"="#683ed8",

                     "Allantois" = "#532C8A",
                     "Mesenchyme" = "#cc7818",
                     "YS mesothelium" = "#ff7f9c",
                     "Epicardium"="#f79083",
                     "Embryo proper mesothelium" = "#ff487d",                     

                     "Cardiopharyngeal progenitors FHF"="#d780b0",
                     "Cardiomyocytes FHF 1"="#a64d7e",
                     "Cardiomyocytes FHF 2"="#B51D8D",

                     "Cardiopharyngeal progenitors SHF"="#4b7193",
                     "Cardiomyocytes SHF 1"="#5d70dc",
                     "Cardiomyocytes SHF 2"="#332c6c",

                     "Haematoendothelial progenitors" = "#FBBE92",
                     "Blood progenitors" = "#6c4b4c",
                     "Erythroid" = "#C72228",
"Chorioallantoic-derived erythroid progenitors"="#E50000",
                     "Megakaryocyte progenitors"="#e3cb3a",
                     "MEP"="#EF4E22",
                     "EMP"="#7c2a47",

                     "YS endothelium"="#ff891c",
"YS mesothelium-derived endothelial progenitors"="#AE3F3F",
                     "Allantois endothelium"="#2f4a60",
                     "Embryo proper endothelium"="#90e3bf",
                     "Venous endothelium"="#bd3400",
                     "Endocardium"="#9d0049",                     
  
                     "NMPs/Mesoderm-biased" = "#89c1f5",
                     "NMPs" = "#8EC792",
                     
                     "Ectoderm" = "#ff675c",

                     "Optic vesicle" = "#bd7300",
 
                     "Ventral forebrain progenitors"="#a0b689",
                     "Early dorsal forebrain progenitors"="#0f8073",
                     "Late dorsal forebrain progenitors"="#7a9941",
                     "Midbrain/Hindbrain boundary"="#8ab3b5",
                     "Midbrain progenitors"="#9bf981",
                     "Dorsal midbrain neurons"="#12ed4c",
                     "Ventral hindbrain progenitors"="#7e907a",
                     "Dorsal hindbrain progenitors"="#2c6521",
                     "Hindbrain floor plate"="#bf9da8",
                     "Hindbrain neural progenitors"="#59b545",

                     "Neural tube"="#233629",

                     "Migratory neural crest"="#4a6798",
                     "Branchial arch neural crest"="#bd84b0",
                     "Frontonasal mesenchyme"="#d3b1b1",

                     "Spinal cord progenitors"="#6b2035",
                     "Dorsal spinal cord progenitors"="#e273d6",
                     
                     "Non-neural ectoderm" = "#f7f79e",
                     "Surface ectoderm" = "#fcff00",
                     "Epidermis" = "#fff335",
                     "Limb ectoderm" = "#ffd731",
                     "Amniotic ectoderm" = "#dbb400",

                     "Placodal ectoderm" = "#ff5c00",

                     "Otic placode"="#f1a262",                     
                     "Otic neural progenitors"="#00b000",
                     
                     "Visceral endoderm" = "#F6BFCB",
                     "ExE endoderm" = "#7F6874",
                     "ExE ectoderm" = "#989898",
                     "Parietal endoderm" = "#1A1A1A"
                     
)

celltype_colours = c("Epiblast" = "#635547",
                     "Primitive Streak" = "#DABE99",
                     "Caudal epiblast" = "#9e6762",
                     
                     "PGC" = "#FACB12",
                     
                     "Anterior Primitive Streak" = "#c19f70",
                     "Notochord" = "#0F4A9C",
                     "Def. endoderm" = "#F397C0",
                     "Gut" = "#EF5A9D",
                     
                     "Nascent mesoderm" = "#C594BF",
                     "Mixed mesoderm" = "#DFCDE4",
                     "Intermediate mesoderm" = "#139992",
                     "Caudal Mesoderm" = "#3F84AA",
                     "Paraxial mesoderm" = "#8DB5CE",
                     "Somitic mesoderm" = "#005579",
                     "Pharyngeal mesoderm" = "#C9EBFB",
                     "Cardiomyocytes" = "#B51D8D",
                     "Allantois" = "#532C8A",
                     "ExE mesoderm" = "#8870ad",
                     "Mesenchyme" = "#cc7818",
                     
                     "Haematoendothelial progenitors" = "#FBBE92",
                     "Endothelium" = "#ff891c",
                     "Blood progenitors 1" = "#f9decf",
                     "Blood progenitors 2" = "#c9a997",
                     "Erythroid1" = "#C72228",
                     "Erythroid2" = "#f79083",
                     "Erythroid3" = "#EF4E22",
                     
                     "NMP" = "#8EC792",
                     
                     "Rostral neurectoderm" = "#65A83E",
                     "Caudal neurectoderm" = "#354E23",
                     "Neural crest" = "#C3C388",
                     "Forebrain/Midbrain/Hindbrain" = "#647a4f",
                     "Spinal cord" = "#CDE088",
                     
                     "Surface ectoderm" = "#f7f79e",
                     
                     "Visceral endoderm" = "#F6BFCB",
                     "ExE endoderm" = "#7F6874",
                     "ExE ectoderm" = "#989898",
                     "Parietal endoderm" = "#1A1A1A",
                     
                     "New cells" = "#D3D3D3"
                     
)


celltype_colours_ectoderm = c("Epiblast" = "#635547",
                              "Primitive Streak" = "#DABE99",
                              "Caudal epiblast" = "#9e6762",
                              
                              "Anterior Primitive Streak" = "#c19f70",
                              "Notochord" = "#0F4A9C",
                              "Def. endoderm" = "#F397C0",
                              "Gut" = "#EF5A9D",
                              
                              "NMP" = "#8EC792",
                              
                              "Rostral neurectoderm" = "#65A83E",
                              "Caudal neurectoderm" = "#354E23",
                              "Neural crest" = "#C3C388",
                              "Forebrain/Midbrain/Hindbrain" = "#647a4f",
                              "Spinal cord" = "#CDE088",
                              
                              "Surface ectoderm" = "#f7f79e",
                              
                              "Visceral endoderm" = "#F6BFCB",
                              "ExE endoderm" = "#7F6874"      
                              #"ExE ectoderm" = "#989898",
                              #"Parietal endoderm" = "#1A1A1A"
                              
)

celltype_colours_mesoderm <- c(
  "Epiblast" = "#635547",
  "Primitive Streak" = "#DABE99",
  "Caudal epiblast" = "#9e6762",
  
  "Anterior Primitive Streak" = "#c19f70",
  
  "Nascent mesoderm" = "#C594BF",
  "Mixed mesoderm" = "#DFCDE4",
  "Intermediate mesoderm" = "#139992",
  "Caudal Mesoderm" = "#3F84AA",
  "Paraxial mesoderm" = "#8DB5CE",
  "Somitic mesoderm" = "#005579",
  "Pharyngeal mesoderm" = "#C9EBFB",
  "Cardiomyocytes" = "#B51D8D",
  "Allantois" = "#532C8A",
  "ExE mesoderm" = "#8870ad",
  "Mesenchyme" = "#cc7818",
  
  "Haematoendothelial progenitors" = "#FBBE92",
  "Endothelium" = "#ff891c",
  "Blood progenitors 1" = "#f9decf",
  "Blood progenitors 2" = "#c9a997",
  "Erythroid1" = "#C72228",
  "Erythroid2" = "#f79083",
  "Erythroid3" = "#EF4E22"
)

celltype_colours_somites_mesoderm <- c(
  "Epiblast" = "#635547",
  "Primitive Streak" = "#DABE99",
  "Caudal epiblast" = "#9e6762",
  
  "Anterior Primitive Streak" = "#c19f70",
  
  "Nascent mesoderm" = "#C594BF",
  "Mixed mesoderm" = "#DFCDE4",
  "Intermediate mesoderm" = "#139992",
  "Caudal Mesoderm" = "#3F84AA",
  "Paraxial mesoderm" = "#8DB5CE",
  "Somitic mesoderm" = "#005579",
  "Cranial mesoderm" = "#006400",#darkgreen
  "Anterior Somitic Tissues"= "#ff0000",#red
  "Sclerotome" = "#ffff00",#yellow
  "Dermomyotome" = "#a52a2a",#brown
  "Posterior Somitic Tissues" = "#40e0d0",#turquoise
  "Presomitic mesoderm"="#0000ff",#blue
  
  "Pharyngeal mesoderm" = "#C9EBFB",
  "Cardiomyocytes" = "#B51D8D",
  "Allantois" = "#532C8A",
  "ExE mesoderm" = "#8870ad",
  "Mesenchyme" = "#cc7818",
  
  "Haematoendothelial progenitors" = "#FBBE92",
  "Endothelium" = "#ff891c",
  "Blood progenitors 1" = "#f9decf",
  "Blood progenitors 2" = "#c9a997",
  "Erythroid1" = "#C72228",
  "Erythroid2" = "#f79083",
  "Erythroid3" = "#EF4E22"
)

celltype_colours_mesoderm_extended <- c(
  "Epiblast" = "#635547",
  "Primitive Streak" = "#DABE99",
  "Caudal epiblast" = "#9e6762",
  
  "Anterior Primitive Streak" = "#c19f70",
  
  "Nascent mesoderm" = "#C594BF",
  "Mixed mesoderm" = "#DFCDE4",
  "Intermediate mesoderm" = "#139992",
  "Caudal Mesoderm" = "#3F84AA",
  "Paraxial mesoderm" = "#8DB5CE",
  "Somitic mesoderm" = "#005579",
  "Pharyngeal mesoderm" = "#C9EBFB",
  "Cardiomyocytes" = "#B51D8D",
  "Allantois" = "#532C8A",
  "ExE mesoderm" = "#8870ad",
  "Mesenchyme" = "#cc7818",
  
  "Haematoendothelial progenitors" = "#FBBE92",
  "Endothelium" = "#ff891c",
  "Blood progenitors 1" = "#f9decf",
  "Blood progenitors 2" = "#c9a997",
  "Erythroid1" = "#C72228",
  "Erythroid2" = "#f79083",
  "Erythroid3" = "#EF4E22",
  "Undetermined" = "gray"
)


celltype_colours_somites = c("Epiblast" = "#635547",
                             "Primitive Streak" = "#DABE99",
                             "Caudal epiblast" = "#9e6762",
                             
                             "PGC" = "#FACB12",
                             
                             "Anterior Primitive Streak" = "#c19f70",
                             "Notochord" = "#0F4A9C",
                             "Def. endoderm" = "#F397C0",
                             "Gut" = "#EF5A9D",
                             
                             "Nascent mesoderm" = "#C594BF",
                             "Mixed mesoderm" = "#DFCDE4",
                             "Intermediate mesoderm" = "#139992",
                             "Caudal Mesoderm" = "#3F84AA",
                             "Paraxial mesoderm" = "#8DB5CE",
                             "Somitic mesoderm" = "#005579",
                             "Cranial mesoderm" = "#006400",#darkgreen
                             "Anterior Somitic Tissues"= "#ff0000",#red
                             "Sclerotome" = "#ffff00",#yellow
                             "Dermomyotome" = "#a52a2a",#brown
                             "Posterior Somitic Tissues" = "#40e0d0",#turquoise
                             "Presomitic mesoderm"="#0000ff",#blue
                             "Pharyngeal mesoderm" = "#C9EBFB",
                             "Cardiomyocytes" = "#B51D8D",
                             "Allantois" = "#532C8A",
                             "ExE mesoderm" = "#8870ad",
                             "Mesenchyme" = "#cc7818",
                             
                             "Haematoendothelial progenitors" = "#FBBE92",
                             "Endothelium" = "#ff891c",
                             "Blood progenitors 1" = "#f9decf",
                             "Blood progenitors 2" = "#c9a997",
                             "Erythroid1" = "#C72228",
                             "Erythroid2" = "#f79083",
                             "Erythroid3" = "#EF4E22",
                             
                             "NMP" = "#8EC792",
                             
                             "Rostral neurectoderm" = "#65A83E",
                             "Caudal neurectoderm" = "#354E23",
                             "Neural crest" = "#C3C388",
                             "Forebrain/Midbrain/Hindbrain" = "#647a4f",
                             "Spinal cord" = "#CDE088",
                             
                             "Surface ectoderm" = "#f7f79e",
                             
                             "Visceral endoderm" = "#F6BFCB",
                             "ExE endoderm" = "#7F6874",
                             "ExE ectoderm" = "#989898",
                             "Parietal endoderm" = "#1A1A1A"
                             
)

celltype_colours_extended = c("Epiblast" = "#635547",
                              "Primitive Streak" = "#DABE99",
                              "Caudal epiblast" = "#9e6762",
                              
                              "PGC" = "#FACB12",
                              
                              "Anterior Primitive Streak" = "#c19f70",
                              "Notochord" = "#0F4A9C",
                              "Def. endoderm" = "#F397C0",
                              "Gut" = "#EF5A9D",
                              
                              "Nascent mesoderm" = "#C594BF",
                              "Mixed mesoderm" = "#DFCDE4",
                              "Intermediate mesoderm" = "#139992",
                              "Caudal Mesoderm" = "#3F84AA",
                              "Paraxial mesoderm" = "#8DB5CE",
                              "Somitic mesoderm" = "#005579",
                              "Pharyngeal mesoderm" = "#C9EBFB",
                              "Cardiomyocytes" = "#B51D8D",
                              "Allantois" = "#532C8A",
                              "ExE mesoderm" = "#8870ad",
                              "Mesenchyme" = "#cc7818",
                              
                              "Haematoendothelial progenitors" = "#FBBE92",
                              "Endothelium" = "#ff891c",
                              "Blood progenitors 1" = "#f9decf",
                              "Blood progenitors 2" = "#c9a997",
                              "Erythroid1" = "#C72228",
                              "Erythroid2" = "#f79083",
                              "Erythroid3" = "#EF4E22",
                              
                              "NMP" = "#8EC792",
                              
                              "Rostral neurectoderm" = "#65A83E",
                              "Caudal neurectoderm" = "#354E23",
                              "Neural crest" = "#C3C388",
                              "Forebrain/Midbrain/Hindbrain" = "#647a4f",
                              "Spinal cord" = "#CDE088",
                              
                              "Surface ectoderm" = "#f7f79e",
                              
                              "Visceral endoderm" = "#F6BFCB",
                              "ExE endoderm" = "#7F6874",
                              "ExE ectoderm" = "#989898",
                              "Parietal endoderm" = "#1A1A1A",
                              "-" = "gray"
                              
)

celltype_colours_ectoderm_extended = c(
  "Epiblast" = "#635547",
  "Primitive Streak" = "#DABE99",
  "Caudal epiblast" = "#9e6762",
  
  "Anterior Primitive Streak" = "#c19f70",
  "Notochord" = "#0F4A9C",
  "Def. endoderm" = "#F397C0",
  "Gut" = "#EF5A9D",
  
  "NMP" = "#8EC792",
  
  "Rostral neurectoderm" = "#65A83E",
  "Caudal neurectoderm" = "#354E23",
  "Neural crest" = "#C3C388",
  "Forebrain/Midbrain/Hindbrain" = "#647a4f",
  "Spinal cord" = "#CDE088",
  
  "Surface ectoderm" = "#f7f79e",
  
  "Visceral endoderm" = "#F6BFCB",
  "ExE endoderm" = "#7F6874",
  #"ExE ectoderm" = "#989898",
  #"Parietal endoderm" = "#1A1A1A"
  
  "Undetermined" = "gray"                     
)

haem_colours = c(
  "Mes1"= "#c4a6b2",
  "Mes2"= "#ca728c",
  
  "Cardiomyocytes" =  "#B51D8D",  
  
  "BP1" = "#6460c5",
  "BP2" = "#96b8e4",
  "Haem3"= "#02f9ff",
  "BP3" = "#07499f",
  "BP4" = "#036ef9",
  
  "Haem1"= "#bb22a7",
  "Haem2" = "#f695e9",
  "Haem4" = "#4c4a81",
  
  "EC1"= "#006737",
  
  "EC2" = "#5eba46",
  "EC3" = "#818068",
  "EC4"="#d6de22",
  "EC5"="#5f7238",
  "EC6"="#2ab572",
  "EC7"="#000000",
  "EC8"="#a0cb3b",
  
  "Ery1"="#f67a58",
  "Ery2" ="#a26724",
  "Ery3"="#cdaf7f",
  "Ery4"= "#625218",
  
  "My" = "#c62127",
  "Mk"= "#f6931d"
)

haem_colours_extended = c(
  
  "BP1" = "#6460c5",
  "BP2" = "#96b8e4",
  "Haem3"= "#02f9ff",
  "BP3" = "#07499f",
  "BP4" = "#036ef9",
  
  "Haem4" = "#4c4a81",
  
  "EC1"= "#006737",
  
  "EC2" = "#5eba46",
  "EC3" = "#818068",
  "EC4"="#d6de22",
  "EC5"="#5f7238",
  "EC6"="#2ab572",
  "EC7"="#000000",
  "EC8"="#a0cb3b",
  
  "Ery1"="#f67a58",
  "Ery2" ="#a26724",
  "Ery3"="#cdaf7f",
  "Ery4"= "#625218",
  
  "My" = "#c62127",
  "Mk"= "#f6931d",
  "Undetermined" = "gray"
)


stage_colours = c("E6.5" = "#D53E4F",
                  "E6.75" = "#F46D43",
                  "E7.0" = "#FDAE61",
                  "E7.25" = "#FEE08B",
                  "E7.5" = "#FFFFBF",
                  "E7.75" = "#E6F598",
                  "E8.0" = "#ABDDA4",
                  "E8.25" = "#66C2A5",
                  "E8.5" = "#3288BD",
                  "mixed_gastrulation" = "#A9A9A9")


tube_colours <- c("-"    = "gray",
                  "EP"        = "#000000",
                  "YS"        = "#5e4fa2",
                  
                  "anterior"  = "#f71616",
                  "posterior" = "#e2c207",
                  
                  "head"      = "#774611",
                  "torso"     = "#d95f02",
                  "tail"      = "#a2d630")

tube_labels  <- c("Pooled", 
                  "EP",
                  "YS",
                  "Anterior",
                  "Posterior",
                  "Head",
                  "Torso",
                  "Tail")

#Corrected tube names: anterior, medial, posterior (instead of head, torso and tail)
tube_colours_corrected <- c(
  "-"    = "gray",
  "YS"        = "#5e4fa2",
  "EP"        = "#000000",
  "Anterior"  = "#f71616",
  "Posterior" = "#e2c207",
  "Anterior_section"   = "#774611",
  "Medial_section"     = "#d95f02",
  "Posterior_section"  = "#a2d630")

tube_labels_corrected  <- c(
  "Pooled",
  "YS", 
  "EP",
  "Anterior",
  "Posterior",
  "Anterior section",
  "Medial section",
  "Posterior section")

somite_count_labels  <- c("0","6","7","8","10","12","13","14","15","16","18","20","21","22","23","24")
somite_count_colours <- c("#A9A9A9",colorRampPalette(c("red", "orange", "yellow", "green", "blue"), space = "Lab")(15))
names(somite_count_colours) <- somite_count_labels

names(somite_count_labels)  <- names(somite_count_colours)
somite_count_labels [1] <- "Pooled"

library(wesanderson)
# For original stage annotation
stage_colours_extension  <- c(rev(wes_palette("Zissou1", 13, type = "continuous")),"#A9A9A9")
stage_colours_extension[11:13] <- c("#3399FF", "#297ACC", "#2162A3")
#stage_colours_extension <- c(colorRampPalette(c("red", "orange", "yellow", "green", "blue"), space = "Lab")(13),"#A9A9A9")
names(stage_colours_extension) <- c("E6.5", "E6.75", "E7.0", "E7.25", "E7.5", "E7.75", "E8.0", "E8.25", "E8.5", "E8.75", "E9.0", "E9.25","E9.5","-")

stage_labels_extension        <- names(stage_colours_extension)
names(stage_labels_extension) <- names(stage_colours_extension)
stage_labels_extension[14] <- "Mixed"

# For stage.mapped.collapsed
stage_colours_extension.mc  <- rev(wes_palette("Zissou1", 12, type = "continuous"))
stage_colours_extension.mc[11:12] <- c("#3399FF", "#297ACC")

#stage_colours_extension.mc <- c(colorRampPalette(c("red", "orange", "yellow", "green", "blue"), space = "Lab")(12))
names(stage_colours_extension.mc) <- c("E6.5", "E6.75", "E7.0", "E7.25", "E7.5", "E7.75", "E8.0", "E8.25", "E8.5", "E8.75", "E9.0", "E9.25")
stage_labels_extension.mc <- stage_labels_extension[-12]

#see https://medialab.github.io/iwanthue/
cluster_colours <- c("violet","turquoise","pink","blue","paleturquoise","tan",
                     "darkturquoise","darkorange","black","cyan","saddlebrown","gold","purple","yellow","lightcyan",
                     "salmon","midnightblue","skyblue","yellowgreen","magenta","darkolivegreen","steelblue","red","royalblue",
                     "grey60","darkmagenta","orange","lightgreen","greenyellow","rosybrown","darkgreen","darkgrey","darkred","green")
#
leiden_colours <- c("#af005d",
                    "#33b837",
                    "#a84ed5",
                    "#00bb4e",
                    "#cc44c7",
                    "#61a500",
                    "#5b6ef9",
                    "#a2be00",
                    "#0075ed",
                    "#d4ca40",
                    "#b186ff",
                    "#00d17a",
                    "#ed52cf",
                    "#009642",
                    "#ff67c7",
                    "#007217",
                    "#ff5ea7",
                    "#57de97",
                    "#ce0064",
                    "#07dec6",
                    "#df0041",
                    "#49d8ea",
                    "#b10009",
                    "#01b8fc",
                    "#da8000",
                    "#0290f4",
                    "#ffb135",
                    "#0154a0",
                    "#abd459",
                    "#921c81",
                    "#3e7f00",
                    "#f2a6ff",
                    "#2a5e02",
                    "#ff3561",
                    "#00774a",
                    "#a50b40",
                    "#a0d57a",
                    "#7a3783",
                    "#d9c66b",
                    "#524893",
                    "#ff8e44",
                    "#82a8ff",
                    "#b24b00",
                    "#02adcf",
                    "#a50f2b",
                    "#4b6600",
                    "#d9b9ff",
                    "#876900",
                    "#ffa4d4",
                    "#585511",
                    "#ff86b3",
                    "#d5c782",
                    "#8c3062",
                    "#ffab61",
                    "#7e3e5d",
                    "#feb782",
                    "#c58fb9",
                    "#a85400",
                    "#ff789c",
                    "#804206",
                    "#b97387",
                    "#ff7a65",
                    "#833f2d")
names(leiden_colours) <- as.character(0:62)
leiden_labels <- names(leiden_colours)
names(leiden_labels) <- names(leiden_colours)

louvain_colours <- c("#70369d",
"#00861e",
"#907fff",
"#d1ca52",
"#d70061",
"#01a47e",
"#bc0047",
"#4fdad3",
"#ff6a73",
"#02a2d1",
"#764820",
"#ff95c9",
"#803968")
names(louvain_colours) <- as.character(0:12)
louvain_labels <- names(louvain_colours)
names(louvain_labels) <- names(louvain_colours)

phase_colours <- c("#963d00","#3343c0","#ddc200")
names(phase_colours) <- c("G2M","S","G1")
phase_labels         <- names(phase_colours)
names(phase_labels)  <- names(phase_colours)

version_colours <- c("#bf0024","#0169c1")
names(version_colours) <- c("Original","Extension")
version_labels         <- names(version_colours)
names(version_labels)  <- names(version_colours)

celltype_extended_palette = scale_color_manual(values = celltype_colours_final,
                                      name = "")

celltype_palette = scale_color_manual(values = celltype_colours,
                                      name = "")

stage_palette    = scale_color_manual(values = stage_colours_extension,
                                      labels = stage_labels_extension,
                                      name = "")

somites_palette    = scale_color_manual(values = somite_count_colours,
                                        labels = somite_count_labels,
                                        name = "")

tube_name_palette  = scale_color_manual(values = tube_colours_corrected,
                                        labels = tube_labels_corrected,
                                        name = "")

phase_palette      = scale_color_manual(values = phase_colours,
                                        labels = phase_labels,
                                        name = "")

leiden_palette      = scale_color_manual(values = leiden_colours,
                                         labels = leiden_labels,
                                         name = "")

version_palette     = scale_color_manual(values = version_colours,
                                         labels = version_labels,
                                         name = "")

louvain_palette     = scale_color_manual(values = louvain_colours,
                                         labels = louvain_labels,
                                         name = "")
                                         
