bug.report <- function(subject="", ccaddress=getenv("USER"),
                       method=.Options$mailer, file = "R.bug.report",
                       address="r-bugs@biostat.ku.dk")
{
    body <- paste("\\n<<insert bug report here>>\\n\\n\\n\\n",
		  "--please do not edit the information below--\\n\\n",
		  "Version:\\n ",
		  paste(names(version), version, sep=" = ", collapse="\\n "),
		  "\\n\\n",
		  "Search Path:\\n ",
		  paste(search(), collapse=", "),
		  "\\n", sep="", collapse="")

    if(missing(subject)) stop("Subject missing")

    disclaimer <-
        paste("# Your mailer is set to \"none\" (default on Windows),\n",
              "# hence we cannot send the bug report directly from R.\n",
              "# Please copy the bug report (after finishing it) to\n",
              "# your favorite email program and send it to\n#\n",
              "#       ", address, "\n#\n",
              "######################################################\n",
              "\n\n", sep = "")

    cat(disclaimer, file=file)
    body <- gsub("\\\\n", "\n", body)
    cat(body, file=file, append=TRUE)
    system(paste(.Options$editor, file))
    cat("The unsent bug report can be found in file", file, "\n")
    invisible()
}

