
<!--
The README should be used to describe the program. It acts like the homepage of
your module.

Edit README.Rmd not README.md. The .Rmd file can be knitted to parse real-code
examples and show their output in the .md file.

To knit, use devtools::build_readme() or outsider.devtools::build()

Edit the template to describe your program: how to install, import and run;
run exemplary, small demonstrations; present key arguments; provide links and
references to the program that the module wraps.

Learn more about markdown and Rmarkdown:
https://daringfireball.net/projects/markdown/syntax
https://rmarkdown.rstudio.com/
-->

# Run [`trimal`](http://trimal.cgenomics.org/) with `outsider` in R

[![Build
Status](https://travis-ci.org/dombennett/om..trimal.svg?branch=master)](https://travis-ci.org/dombennett/om..trimal)

> TRIMAL: Automated removal of spurious sequences or poorly aligned
> regions from a multiple sequence alignment

<!-- Install information -->

## Install and look up help

``` r
library(outsider)
#> ----------------
#> outsider v 0.1.0
#> ----------------
#> - Security notice: be sure of which modules you install
module_install(repo = "dombennett/om..trimal")
#> -----------------------------------------------------
#> Warning: You are about to install an outsider module!
#> -----------------------------------------------------
#> Outsider modules install and run external programs
#> via Docker <https://www.docker.com>. These external
#> programs may communicate with the internet and could
#> potentially be malicious.
#> 
#> Be sure to know the module you are about to install:
#> Is it from a trusted developer? Are colleagues using
#> it? Is it supposed to download lots of data? Is it
#> well used (e.g. check number of stars on GitHub)?
#> -----------------------------------------------------
#>  Module information
#> -----------------------------------------------------
#> program: trimal
#> details: A tool for automated alignment trimming in large-scale phylogenetic analyses.
#> docker: dombennett
#> github: dombennett
#> url: https://github.com/DomBennett/om..trimal
#> image: dombennett/om_trimal
#> container: om_trimal
#> package: om..trimal
#> Travis CI: Passing
#> -----------------------------------------------------
#> Enter any key to continue or press Esc to quit
#module_help(repo = "dombennett/om..trimal")
```

The module provides two functions `trimal`, the main program for
trimming alignments, and `readal`, a convenience tool for converting
alignments into different file formats.

## Examples

Both functions have two arguments:

  - `arglist`: character vector of arguments to be passed to the program
  - `outdir`: File location where all resulting files will be returned

The `arglist` function must be a character vector. For example, a call
to a command-line program, like …

``` bash
command -xarg file --yarg --zarg=p1
```

Would be in R …

``` r
command(arglist=c('-xarg', file, '--yarg', '--zarg=p1'))
```

All the arguments indicated with the `-h` flag for both `trimal` and
`readal` can be specified in the above way.

### `trimal`

``` r
library(outsider)
# import
trimal <- module_import('trimal', repo = 'dombennett/om..trimal')
# help
trimal('-h')
#> 
#> trimAl v1.4.rev22 build[2015-05-21]. 2009-2015. Salvador Capella-Gutierrez and Toni Gabaldón.
#> 
#> trimAl webpage: http://trimal.cgenomics.org
#> 
#> This program is free software: you can redistribute it and/or modify 
#> it under the terms of the GNU General Public License as published by 
#> the Free Software Foundation, the last available version.
#> 
#> Please cite:
#>      trimAl: a tool for automated alignment trimming in large-scale phylogenetic analyses.
#>      Salvador Capella-Gutierrez; Jose M. Silla-Martinez; Toni Gabaldon.
#>      Bioinformatics 2009, 25:1972-1973.
#> 
#> Basic usage
#>  trimal -in <inputfile> -out <outputfile> -(other options).
#> 
#> Common options (for a complete list please see the User Guide or visit http://trimal.cgenomics.org):
#> 
#>     -h                          Print this information and show some examples.
#>     --version                   Print the trimAl version.
#> 
#>     -in <inputfile>             Input file in several formats (clustal, fasta, NBRF/PIR, nexus, phylip3.2, phylip).
#> 
#>     -compareset <inputfile>     Input list of paths for the files containing the alignments to compare.
#>     -forceselect <inputfile>    Force selection of the given input file in the files comparison method.
#> 
#>     -backtrans <inputfile>      Use a Coding Sequences file to get a backtranslation for a given AA alignment
#>     -ignorestopcodon            Ignore stop codons in the input coding sequences
#>     -splitbystopcodon           Split input coding sequences up to first stop codon appearance
#> 
#>     -matrix <inpufile>          Input file for user-defined similarity matrix (default is Blosum62).
#>     --alternative_matrix <name> Select an alternative similarity matrix already loaded. 
#>                                 Only available 'degenerated_nt_identity'
#> 
#>     -out <outputfile>           Output alignment in the same input format (default stdout). (default input format)
#>     -htmlout <outputfile>       Get a summary of trimal's work in an HTML file.
#> 
#>     -keepheader                 Keep original sequence header including non-alphanumeric characters.
#>                                 Only available for input FASTA format files. (future versions will extend this feature)
#> 
#>     -nbrf                       Output file in NBRF/PIR format
#>     -mega                       Output file in MEGA format
#>     -nexus                      Output file in NEXUS format
#>     -clustal                    Output file in CLUSTAL format
#> 
#>     -fasta                      Output file in FASTA format
#>     -fasta_m10                  Output file in FASTA format. Sequences name length up to 10 characters.
#> 
#>     -phylip                     Output file in PHYLIP/PHYLIP4 format
#>     -phylip_m10                 Output file in PHYLIP/PHYLIP4 format. Sequences name length up to 10 characters.
#>     -phylip_paml                Output file in PHYLIP format compatible with PAML
#>     -phylip_paml_m10            Output file in PHYLIP format compatible with PAML. Sequences name length up to 10 characters.
#>     -phylip3.2                  Output file in PHYLIP3.2 format
#>     -phylip3.2_m10              Output file in PHYLIP3.2 format. Sequences name length up to 10 characters.
#> 
#>     -complementary              Get the complementary alignment.
#>     -colnumbering               Get the relationship between the columns in the old and new alignment.
#> 
#>     -selectcols { n,l,m-k }     Selection of columns to be removed from the alignment. Range: [0 - (Number of Columns - 1)]. (see User Guide).
#>     -selectseqs { n,l,m-k }     Selection of sequences to be removed from the alignment. Range: [0 - (Number of Sequences - 1)]. (see User Guide).
#> 
#>     -gt -gapthreshold <n>       1 - (fraction of sequences with a gap allowed). Range: [0 - 1]
#>     -st -simthreshold <n>       Minimum average similarity allowed. Range: [0 - 1]
#>     -ct -conthreshold <n>       Minimum consistency value allowed.Range: [0 - 1]
#>     -cons <n>                   Minimum percentage of the positions in the original alignment to conserve. Range: [0 - 100]
#> 
#>     -nogaps                     Remove all positions with gaps in the alignment.
#>     -noallgaps                  Remove columns composed only by gaps.
#>     -keepseqs                   Keep sequences even if they are composed only by gaps.
#> 
#>     -gappyout                   Use automated selection on "gappyout" mode. This method only uses information based on gaps' distribution. (see User Guide).
#>     -strict                     Use automated selection on "strict" mode. (see User Guide).
#>     -strictplus                 Use automated selection on "strictplus" mode. (see User Guide).
#>                                (Optimized for Neighbour Joining phylogenetic tree reconstruction).
#> 
#>     -automated1                 Use a heuristic selection of the automatic method based on similarity statistics. (see User Guide). (Optimized for Maximum Likelihood phylogenetic tree reconstruction).
#> 
#>     -terminalonly               Only columns out of internal boundaries (first and last column without gaps) are 
#>                                 candidates to be trimmed depending on the selected method
#>     --set_boundaries { l,r }    Set manually left (l) and right (r) boundaries - only columns out of these boundaries are 
#>                                 candidates to be trimmed depending on the selected method. Range: [0 - (Number of Columns - 1)]
#>     -block <n>                  Minimum column block size to be kept in the trimmed alignment. Available with manual and automatic (gappyout) methods
#> 
#>     -resoverlap                 Minimum overlap of a positions with other positions in the column to be considered a "good position". Range: [0 - 1]. (see User Guide).
#>     -seqoverlap                 Minimum percentage of "good positions" that a sequence must have in order to be conserved. Range: [0 - 100](see User Guide).
#> 
#>     -clusters <n>               Get the most Nth representatives sequences from a given alignment. Range: [1 - (Number of sequences)]
#>     -maxidentity <n>            Get the representatives sequences for a given identity threshold. Range: [0 - 1].
#> 
#>     -w <n>                      (half) Window size, score of position i is the average of the window (i - n) to (i + n).
#>     -gw <n>                     (half) Window size only applies to statistics/methods based on Gaps.
#>     -sw <n>                     (half) Window size only applies to statistics/methods based on Similarity.
#>     -cw <n>                     (half) Window size only applies to statistics/methods based on Consistency.
#> 
#>     -sgc                        Print gap scores for each column in the input alignment.
#>     -sgt                        Print accumulated gap scores for the input alignment.
#>     -ssc                        Print similarity scores for each column in the input alignment.
#>     -sst                        Print accumulated similarity scores for the input alignment.
#>     -sfc                        Print sum-of-pairs scores for each column from the selected alignment
#>     -sft                        Print accumulated sum-of-pairs scores for the selected alignment
#>     -sident                     Print identity scores matrix for all sequences in the input alignment. (see User Guide).
#>     -soverlap                   Print overlap scores matrix for all sequences in the input alignment. (see User Guide).
#> 
#> Some Examples:
#> 
#> 1) Removes all positions in the alignment with gaps in 10% or more of
#>    the sequences, unless this leaves less than 60% of original alignment. 
#>    In such case, print the 60% best (with less gaps) positions.
#> 
#>    trimal -in <inputfile> -out <outputfile> -gt 0.9 -cons 60
#> 
#> 2) As above but, the gap score is averaged over a window starting
#>    3 positions before and ending 3 positions after each column.
#> 
#>    trimal -in <inputfile> -out <outputfile> -gt 0.9 -cons 60 -w 3
#> 
#> 3) Use an automatic method to decide optimal thresholds, based in the gap scores
#>    from input alignment. (see User Guide for details).
#> 
#>    trimal -in <inputfile> -out <outputfile> -gappyout
#> 
#> 4) Use automatic methods to decide optimal thresholds, based on the combination 
#>    of gap and similarity scores. (see User Guide for details).
#> 
#>    trimal -in <inputfile> -out <outputfile> -strictplus
#> 
#> 5) Use an heuristic to decide the optimal method for trimming the alignment. 
#>    (see User Guide for details).
#> 
#>    trimal -in <inputfile> -out <outputfile> -automated1
#> 
#> 6) Use residues and sequences overlap thresholds to delete some sequences from the 
#>    alignemnt. (see User Guide for details).
#> 
#>    trimal -in <inputfile> -out <outputfile> -resoverlap 0.8 -seqoverlap 75
#> 
#> 7) Selection of columns to be deleted from the alignment. The selection can 
#>    be a column number or a column number interval. Start from 0
#> 
#>    trimal -in <inputfile> -out <outputfile> -selectcols { 0,2,3,10,45-60,68,70-78 }
#> 
#> 8) Get the complementary alignment from the alignment previously trimmed.
#> 
#>    trimal -in <inputfile> -out <outputfile> -selectcols { 0,2,3,10,45-60,68,70-78 } -complementary
#> 
#> 9) Selection of sequences to be deleted from the alignment. Start in 0
#> 
#>    trimal -in <inputfile> -out <outputfile> -selectseqs { 2,4,8-12 } 
#> 
#> 10) Select the 5 most representative sequences from the alignment
#> 
#>    trimal -in <inputfile> -out <outputfile> -clusters 5

# Real Example
# download
wd <- file.path(tempdir(), 'trimal_example')
if (!dir.exists(wd)) {
  dir.create(wd)
}
alignment_file <- file.path(wd, 'example_alignment.fasta')
url <- 'https://raw.githubusercontent.com/DomBennett/om..trimal/master/example_alignment.fasta'
download.file(url = url, destfile = alignment_file)
# run trimal with automated1 method
trimal(arglist = c('-in', alignment_file, '-out', 'trimal_results.fasta',
                   '-automated1', '-fasta'), outdir = wd)

# verify
list.files(wd)
#> [1] "example_alignment.fasta" "trimal_results.fasta"
```

### `readal`

``` r
library(outsider)
# import
readal <- module_import('readal', repo = 'dombennett/om..trimal')
# help
readal('-h')
#> 
#> readAl v1.4.rev22 build[2015-05-21]. 2009-2015. Salvador Capella-Gutierrez and Toni Gabaldón.
#> 
#> readAl webpage: http://trimal.cgenomics.org
#> 
#> This program is free software: you can redistribute it and/or modify 
#> it under the terms of the GNU General Public License as published by 
#> the Free Software Foundation, the last available version.
#> 
#> Basic usage
#>  readal -in <inputfile> -out <outputfile> [options].
#> 
#>  -h                   Show this information.
#>  --version            Show readAl version.
#> 
#>  -in <inputfile>      Input file in several formats.
#>  -out <outputfile>    Output file name (default STDOUT).
#> 
#>  -format              Print information about input file format and if sequences are aligned or not.
#>  -type                Print information about biological sequences datatype (e.g. nucleotides:dna, nucleotides:rna, aminoacids, etc)
#>  -info                Print information about sequences number, average sequence length, max & min sequence length
#> 
#>  -onlyseqs            Generate output with only residues from input file
#> 
#>  -html                Output residues colored according their physicochemical properties. HTML file.
#> 
#>  -reverse             Output the reverse of sequences in input file.
#> 
#>  -nbrf                Output file in NBRF/PIR format
#>  -mega                Output file in MEGA format
#>  -nexus               Output file in NEXUS format
#>  -clustal             Output file in CLUSTAL format
#> 
#>  -fasta               Output file in FASTA format
#>  -fasta_m10           Output file in FASTA format. Sequences name up to 10 characters.
#> 
#>  -phylip              Output file in PHYLIP/PHYLIP4 format
#>  -phylip_m10          Output file in PHYLIP/PHYLIP4 format. Sequences name up to 10 characters.
#>  -phylip_paml         Output file in PHYLIP format compatible with PAML
#>  -phylip_paml_m10     Output file in PHYLIP format compatible with PAML. Sequences name up to 10 characters.
#>  -phylip3.2           Output file in PHYLIP3.2 format
#>  -phylip3.2_m10       Output file in PHYLIP3.2 format. Sequences name up to 10 characters.

# Real Example
# download
wd <- file.path(tempdir(), 'readal_example')
if (!dir.exists(wd)) {
  dir.create(wd)
}
alignment_file <- file.path(wd, 'example_alignment.fasta')
url <- 'https://raw.githubusercontent.com/DomBennett/om..trimal/master/example_alignment.fasta'
download.file(url = url, destfile = alignment_file)
# get info
readal(arglist = c('-in', alignment_file, '-info'), outdir = wd)
#> ## Input filename    'example_alignment.fasta'
#> ## Total sequences   10
#> ## Alignment length  3161
#> ## Avg. sequence length  2943.8
#> ## Longest seq. name 'M64487_Thermococcus_celer'
#> ## Longest seq. length   3029
#> ## Shortest seq. name    'M32298_Thermoplasma_acidophilum'
#> ## Shortest seq. length  2908
# convert to phylip
readal(arglist = c('-in', alignment_file, '-out', 'example_alignment.phylip',
                   '-phylip_m10'), outdir = wd)

# verify
list.files(wd)
#> [1] "example_alignment.fasta"  "example_alignment.phylip"
```

## Links

Find out more by visiting the [trimAL
homepage](http://trimal.cgenomics.org/).

## Please cite

  - trimAl: a tool for automated alignment trimming in large-scale
    phylogenetic analyses. Salvador Capella-Gutierrez; Jose M.
    Silla-Martinez; Toni Gabaldon. Bioinformatics 2009 25: 1972-1973.
  - Bennett et al. (2020). outsider: Install and run programs, outside
    of R, inside of R. *Journal of Open Source Software*, In
review

## <!-- Footer -->

<img align="left" width="120" height="125" src="https://raw.githubusercontent.com/ropensci/outsider/master/logo.png">

**An `outsider` module**

Learn more at [outsider
website](https://docs.ropensci.org/outsider/). Want to build your
own module? Check out [`outsider.devtools`
website](https://docs.ropensci.org/outsider.devtools/).
