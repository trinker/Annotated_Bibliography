x <- readLines("MASTER.bib")
head(x)

x <- x[-c(1:3, 2631:2641)]
keeps <- as.character(na.omit(dat[, 1]))


locs <- which(x == "") 

cat(paste(unlist(lapply(keeps, function(y){
    start <- grep(y, x)
    x[start:(locs[locs > start][1])]
})), collapse="\n"), file="refs.bib")