test_that(".db_summoner_name_exists throws error when the database does not exist yet", {
    unlink(rioter::db_path())

    # database does not exist yet
    expect_error(rioter:::.db_summoner_name_exists())
})

test_that(".db_summoner_name_exists detects an existing user", {
    # create database and add user
    rioter::db_add_or_update_summoner()
    out <- rioter:::.db_summoner_name_exists()
    expect_true(out)

    # cleanup
    unlink(rioter::db_path())
})
