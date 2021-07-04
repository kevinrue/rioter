test_that("db_dir_create() works", {
    unlink(rioter::db_dir(), recursive = TRUE)

    out <- rioter::db_dir_create()
    expect_true(out)
})
