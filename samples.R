## nuke renv
if (requireNamespace("renv", quietly = TRUE)) renv::deactivate()
unlink("renv", recursive = TRUE, force = TRUE)
unlink("renv.lock", force = TRUE)
# rprofile
if (file.exists(".Rprofile")) {
  txt <- readLines(".Rprofile", warn = FALSE)
  writeLines(txt[!grepl("renv/activate\\.R", txt)], ".Rprofile")
}
# disconnect
q(save = "no")

# init
install.packages("renv")               
renv::init(bare = TRUE)  

# include
renv::install(c(
  "tidyverse",     
  "readxl",        
  "reticulate",    
  "knitr",         
  "rmarkdown"      
))

#lock
renv::snapshot()  