test_that("db_table_exists() returns FALSE if database does not exist", {
    unlink(rioter::db_path())

    out <- rioter::db_table_exists(table = "table_name")
    expect_false(out)
})

test_that("db_table_exists() returns FALSE if database exists but not table", {
    file.create(db_path())

    out <- rioter::db_table_exists(table = "table_name")
    expect_false(out)
})

test_that("db_table_exists() returns TRUE if table exists", {
    conn <- RSQLite::dbConnect(RSQLite::SQLite(), db_path())
    RSQLite::dbWriteTable(conn, "table_name", data.frame(A = 1))

    out <- rioter::db_table_exists(table = "table_name")
    expect_true(out)
    RSQLite::dbDisconnect(conn)
})
