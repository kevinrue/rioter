#' Database Configuration
#'
#' @return Path to the SQLite database.
#' @export
#'
#' @importFrom fs path_home
#'
#' @examples
#' db_dir()
#' db_path()
db_path <- function() {
    db_file <- file.path(db_dir(), "db.sqlite")
    db_file
}

#' @rdname db_path
#' @aliases db_dir
#' @export
#'
#' @importFrom utils packageName
db_dir <- function() {
    file.path(fs::path_home(), paste0(".", packageName()))
}

#' Database Checks
#'
#' @return A logical scalar indicating whether the database exists.
#' @export
#'
#' @examples
#' db_exists()
#' db_table_exists("summoners")
db_exists <- function() {
    file.exists(db_path())
}

#' @param table Name of a database table.
#'
#' @rdname db_exists
#' @aliases db_table_exists
#' @export
#'
#' @importFrom RSQLite SQLite dbConnect dbListTables dbDisconnect
db_table_exists <- function(table) {
    if (db_exists()) {
        conn <- dbConnect(SQLite(), dbname = db_path())
        tables_name <- dbListTables(conn)
        table_exists <- table %in% tables_name
        dbDisconnect(conn)
        return(table_exists)
    } else {
        return(FALSE)
    }
}

.table_summoner <- "summoners"
