
#' Get summoner data
#'
#' @param summoner Summoner name.
#' @param host API host.
#' @param token API token.
#'
#' @return Content of the reply.
#' @export
#'
#' @importFrom utils URLencode
#' @importFrom httr GET add_headers content
#'
#' @examples
#' get_summoner_by_name()
get_summoner_by_name <- function(summoner = "Kewizard FR", host = "euw1.api.riotgames.com", token = Sys.getenv("RIOT_API_KEY")) {
    url <- URLencode(sprintf("https://%s/lol/summoner/v4/summoners/by-name/%s", host, summoner))
    query <- GET(url, add_headers(`X-Riot-Token` = token))
    query_data <- content(query)
    query_data
}

