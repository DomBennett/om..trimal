#' @name trimal
#' @title trimal
#' @description Run trimal
#' @param arglist Arguments for trimal
#' @param outdir Filepath to output files are placed
#' @example /examples/trimal.R
#' @export
trimal <- function(arglist = arglist_get(...), outdir = getwd()) {
  files_to_send <- filestosend_get(arglist = arglist)
  arglist <- arglist_parse(arglist = arglist)
  otsdr <- outsider_init(pkgnm = 'om..trimal', cmd = 'trimal',
                         arglist = arglist, files_to_send = files_to_send,
                         wd = outdir)
  res <- run(otsdr)
  invisible(res)
}

#' @name readal
#' @title readal
#' @description Run readal
#' @param arglist Arguments for readal
#' @param outdir Filepath to output files are placed
#' @example /examples/readal.R
#' @export
readal <- function(arglist = arglist_get(...), outdir = getwd()) {
  files_to_send <- filestosend_get(arglist = arglist)
  arglist <- arglist_parse(arglist = arglist)
  otsdr <- outsider_init(pkgnm = 'om..trimal', cmd = 'readal',
                         arglist = arglist, files_to_send = files_to_send,
                         wd = outdir)
  res <- run(otsdr)
  invisible(res)
}
