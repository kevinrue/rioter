test_that("db_dir() works", {
    out <- db_dir()
    expect_match(out, tempdir())
})
