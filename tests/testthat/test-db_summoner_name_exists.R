test_that("multiplication works", {
    unlink(rioter::db_path())

    # database does not exist yet
    expect_error(rioter:::.db_summoner_name_exists())

    # create database and add user
    rioter::db_add_or_update_summoner()
    out <- rioter:::.db_summoner_name_exists()
    expect_true(out)
})
