test_that("db_dir_create() works", {
    unlink(rioter::db_dir(), recursive = TRUE)

    out <- rioter::db_dir_create()
    expect_true(out)
})

test_that("db_dir_create() returns FALSE if it already exists", {
    out <- rioter::db_dir_create()
    expect_false(out)
})
