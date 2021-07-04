test_that("db_exists() returns FALSE if database does not exist", {
    unlink(rioter::db_path())

    out <- rioter::db_exists()
    expect_false(out)
})

test_that("db_exists() returns TRUE if database does exist", {
    file.create(rioter::db_path())

    out <- rioter::db_exists()
    expect_true(out)
})
