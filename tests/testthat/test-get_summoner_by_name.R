test_that("get_summoner_by_name() works", {
    out <- get_summoner_by_name()
    expect_named(out, c("id", "accountId", "puuid", "name", "profileIconId", "revisionDate",  "summonerLevel"))
})
