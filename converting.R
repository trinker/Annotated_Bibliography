library(reports)
source("extra_functions.R")

## convert md
tex_to("Annotated_Bibliography.tex", "Annotated_Bibliography.md", 
    bib.loc=QP("refs.bib"))
x <- readLines("Annotated_Bibliography.md")
cat(paste(gsub("<span> -1cm </span>", "", x), collapse="\n"), file="Annotated_Bibliography.md")

## convert md w/ TOC
tex_to("Annotated_Bibliography.tex", "Annotated_Bibliography_TOC.md", 
    bib.loc=QP("refs.bib"), add = "--toc ")
x <- readLines("Annotated_Bibliography_TOC.md")
cat(paste(gsub("<span> -1cm </span>", "", x), collapse="\n"), file="Annotated_Bibliography_TOC.md")

## convert html
tex_to("Annotated_Bibliography.tex",  bib.loc=QP("refs.bib"), add = "--toc ")
x <- readLines("Annotated_Bibliography.html")
cat(paste(gsub("<span> -1cm </span>", "", x), collapse="\n"), file="Annotated_Bibliography.html") 


