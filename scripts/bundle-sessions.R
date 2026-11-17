# Rebuild deterministic participant ZIPs from the editable session sources.
script <- sub("^--file=", "", grep("^--file=", commandArgs(), value = TRUE))
root <- dirname(dirname(normalizePath(script)))

bundle_session <- function(session) {
  files <- sort(list.files(session, recursive = TRUE, all.files = TRUE,
                           no.. = TRUE))
  excluded <- "(^|/)(build|library|\\.Rproj\\.user)(/|$)|(^|/)(profile\\.out|\\.Rhistory|\\.RData)$"
  files <- files[!grepl(excluded, files)]
  staging <- tempfile("session-bundle-")
  dir.create(staging)
  on.exit(unlink(staging, recursive = TRUE), add = TRUE)
  entries <- file.path(basename(session), files)
  targets <- file.path(staging, entries)
  for (i in seq_along(files)) {
    dir.create(dirname(targets[i]), recursive = TRUE, showWarnings = FALSE)
    if (!file.copy(file.path(session, files[i]), targets[i])) {
      stop("Could not stage ", files[i])
    }
  }
  Sys.chmod(targets, "0644")
  Sys.setFileTime(targets, as.POSIXct("2026-11-17 00:00:00", tz = "UTC"))
  output <- file.path(root, "slides", "download", paste0(basename(session), ".zip"))
  dir.create(dirname(output), recursive = TRUE, showWarnings = FALSE)
  zip::zipr(output, entries, root = staging, mode = "mirror",
            include_directories = FALSE)
  message("slides/download/", basename(output))
}

sessions <- sort(Sys.glob(file.path(root, "sessions", "session-*")))
for (session in sessions[dir.exists(sessions)]) bundle_session(session)
