#' Title
#'
#' @param summoner Summoner name.
#'
#' @return A logical value indicating whether the operation succeeded.
#' @export
#'
#' @importFrom RSQLite dbConnect SQLite dbWriteTable dbDisconnect
#' @importFrom tibble as_tibble
#'
#' @examples
#' if (interactive()) {
#'   db_add_new_summoner_by_name()
#' }
db_add_new_summoner_by_name <- function(summoner = "Kewizard FR") {
    summoner_data <- get_summoner_by_name(summoner)
    summoner_data <- as_tibble(summoner_data)
    if (!db_table_exists(.table_summoner)) {
        conn <- dbConnect(SQLite(), dbname = db_path())
        dbWriteTable(conn, .table_summoner, summoner_data)
        dbDisconnect(conn)
        return(TRUE)
    }
    if (.db_summoner_name_exists()) {
        warning("TODO: update summoner information")
    } else {
        warning("TODO: insert summoner information")
    }
    return(FALSE)
}

#' Check Local Database
#'
#' @param summoner Summoner name.
#'
#' @importFrom RSQLite dbConnect dbGetQuery dbDisconnect
#'
#' @return A logical scalar indicating whether the summoner name is present in the local database.
.db_summoner_name_exists <- function(summoner = "Kewizard FR") {
    statement <- sprintf(
        "SELECT %s.name FROM %s WHERE %s.name = '%s' LIMIT 1;",
        .table_summoner,
        .table_summoner,
        .table_summoner,
        summoner
    )
    conn <- dbConnect(SQLite(), dbname = db_path())
    db_query <- dbGetQuery(conn, statement)
    dbDisconnect(conn)
    summoner_name_exists <- nrow(db_query) > 0
    return(summoner_name_exists)
}
