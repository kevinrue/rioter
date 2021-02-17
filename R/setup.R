
#' Database Configuration
#'
#' @return Path to the SQLite database.
#' @export
#'
#' @examples
#' db_path()
db_path <- function() {
    file.path(fs::path_home(), ".rioter", "db.sqlite")
}
