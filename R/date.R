#' Format Dates
#'
#' @param date Date.
#'
#' @return Formatted date as string value.
.format_date_from_numeric <- function(date) {
    .POSIXct(date / 1000)
}
