#' @name trimal
#' @title trimal
#' @description Run trimal
#' @param args Arguments for trimal
#' @example /examples/trimal.R
#' @export
trimal <- function(args = arglist_get(...)) {
  files_to_send <- filestosend_get(arglist = args)
  arglist <- arglist_parse(arglist = args)
  otsdr <- outsider_init(pkgnm = 'om..trimal', cmd = 'trimal',
                         arglist = arglist, files_to_send = files_to_send,
                         wd = getwd())
  res <- run(otsdr)
  invisible(res)
}

#' @name readal
#' @title readal
#' @description Run readal
#' @param args Arguments for readal
#' @example /examples/readal.R
#' @export
readal <- function(args = arglist_get(...)) {
  files_to_send <- filestosend_get(arglist = args)
  arglist <- arglist_parse(arglist = args)
  otsdr <- outsider_init(pkgnm = 'om..readal', cmd = 'readal',
                         arglist = arglist, files_to_send = files_to_send,
                         wd = getwd())
  res <- run(otsdr)
  invisible(res)
}
