Annotated Bibliography
========================================================

This is an repo demonstrating the use of a data base to build reports.  Here I store information around various articles in [ann_bib.xlsx](ann_bib.xlsx).  This approach uses R + knitr to create reports from a data base.  In the README, the process is not fully automated, however, it is in the .Rnw file ([Annotated_Bibliography.Rnw](Annotated_Bibliography.Rnw)).  Other possible uses include CV/Resume generation.

The [converting.R](converting.R) demonstrates how to use Pandoc to convert between file types.  

## Output Files

- [Annotated_Bibliography.pdf](Annotated_Bibliography.pdf)    
- [Annotated_Bibliography.md](Annotated_Bibliography.md)
- [Annotated_Bibliography_TOC.md](Annotated_Bibliography_TOC.md)
- [Annotated_Bibliography.html](Annotated_Bibliography.html)   

## Code to Generate Report

```r
library(xlsx)

dat <- read.xlsx(file="ann_bib.xlsx", sheetIndex=1, colIndex=1:5)

dat <- dat[rowSums(t(apply(dat, 1, is.na))) == 0, ]

dat[, 1:4] <- lapply(1:4, function(i, type=c(rep("as.character", 4))) {
    FUN <- match.fun(type[i])
    x <- FUN(dat[, i])
    x
})

w <- "\\section{\\textcite{%s}}\n\n
\\negpar{\\textcolor{darkblue}{\\fullcite{%s}}}\n\n\n
\\regpar\n\n\n
\\subsection{Summary of Research Questions \\& Results/Conclusion} %% A short summary of the research question and results/conclusions (75-100 words)\n%s\n
\\subsection{Evaluation of Methods \\& Conclusions} %% An evaluation of methods and conclusions (25-75) words.\n%s\n
\\subsection{Significance to Topic} %% The contribution to your topic (why is this paper important?)\n%s\n
%%==========================================================================\n\n"

cat(sprintf(w, dat[, 1], dat[, 1], dat[, 2], dat[, 3], dat[, 4]))
@
```
```
