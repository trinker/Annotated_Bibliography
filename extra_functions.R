## Extra Functions


##Turn tex into...
tex_to <- 
function (in.file = NULL, out.file = NULL, path = QP(), 
    bib.loc = getOption("bib.loc"), add="") {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) == "tex"]
            in.file <- in.file[!in.file %in% "preamble.tex"][1]
        }
        if (is.null(out.file)) {
            out.file <- paste0(tools::file_path_sans_ext(in.file), ".html")
        }
    }
    action <- sprintf(paste0(reports:::wheresPandoc(), " -s %s", shQuote(in.file), 
        " -o ", shQuote(out.file)), add)
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    message(sprintf("%s file generated!", tools::file_ext(out.file)))
}