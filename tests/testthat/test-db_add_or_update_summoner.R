test_that("db_add_or_update_summoner() works", {
    Sys.setenv(RIOTER_DB_DIR = tempdir())
    db_add_or_update_summoner()
})
