test_that("db_add_or_update_summoner() works", {
    unlink(rioter::db_path())

    out <- db_add_or_update_summoner()
    expect_true(out)

    # TODO: call db_add_or_update_summoner() again to update summoner information
})
