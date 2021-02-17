
#' Database Configuration
#'
#' @return Path to the SQLite database.
#' @export
#'
#' @importFrom fs path_home
#'
#' @examples
#' db_path()
db_path <- function() {
    file.path(fs::path_home(), ".rioter", "db.sqlite")
}
