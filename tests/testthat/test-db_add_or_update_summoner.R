test_that("db_add_or_update_summoner() adds a user", {
    unlink(rioter::db_dir(), recursive = TRUE)
    suppressWarnings(rioter::db_dir_create())

    out <- rioter::db_add_or_update_summoner()
    expect_true(out)
})

# TODO: call db_add_or_update_summoner() again to update summoner information
