test_that("db_add_or_update_summoner() adds a user", {
    # skip("RIOT API issue?")
    unlink(rioter::db_path())

    out <- rioter::db_add_or_update_summoner()
    expect_true(out)
})

# TODO: call db_add_or_update_summoner() again to update summoner information
