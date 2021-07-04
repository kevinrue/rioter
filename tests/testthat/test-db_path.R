test_that("db_path() works", {
    out <- db_path()
    expect_match(out, tempdir())
})
