library(outsider)
# import
readal <- module_import('readal', repo = 'dombennett/om..trimal')
# help
readal('-h')

# Real Example
# download
wd <- file.path(getwd(), 'example_job')
if (!dir.exists(wd)) {
  dir.create(wd)
}
alignment_file <- file.path(wd, 'example_alignment.fasta')
url <- 'https://raw.githubusercontent.com/DomBennett/om..trimal/master/example_alignment.fasta'
download.file(url = url, destfile = alignment_file)
# get info
readal(arglist = c('-in', alignment_file, '-info'), outdir = wd)
# convert to phylip
readal(arglist = c('-in', alignment_file, '-out', 'example_alignment.phylip',
                   '-phylip_m10'), outdir = wd)
