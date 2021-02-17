.onLoad <- function(libname, pkgname){
    .db_dir <- db_dir()
    if (!dir.exists(.db_dir)) {
        dir.create(.db_dir)
        packageStartupMessage("Created directory ", .db_dir)
    }
}
