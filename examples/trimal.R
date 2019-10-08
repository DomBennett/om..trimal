library(outsider)
# import
trimal <- module_import('trimal', repo = 'dombennett/om..trimal')
# help
trimal('-h')

# Real Example
# download
wd <- file.path(getwd(), 'example_job')
if (!dir.exists(wd)) {
  dir.create(wd)
}
alignment_file <- file.path(wd, 'example_alignment.fasta')
url <- 'https://raw.githubusercontent.com/DomBennett/om..trimal/master/example_alignment.fasta'
download.file(url = url, destfile = alignment_file)
# run trimal with automated1 method
trimal(arglist = c('-in', alignment_file, '-out', 'trimal_results.fasta',
                   '-automated1', '-fasta'), outdir = wd)
