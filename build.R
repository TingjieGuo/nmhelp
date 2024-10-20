library(stringr)

# define the code to be added
html_code <- '
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="style.css" />
'

# define the function to insert the code
insert_html_and_div <- function(file_path, html_code) {
  content <- readLines(file_path, warn = FALSE)
  content <- paste(content, collapse = "\n")
  
  # insert to <head> tag, case-insensitive
  if (str_detect(content, regex("<head>", ignore_case = TRUE)) && str_detect(content, regex("</head>", ignore_case = TRUE))) {
    content <- str_replace(content, regex("<head>", ignore_case = TRUE), paste0("<head>", html_code))
  }
  
  # insert <div> to include everything within <body>, case-insensitive
  if (str_detect(content, regex("<body([^>]*)>", ignore_case = TRUE)) && str_detect(content, regex("</body>", ignore_case = TRUE))) {
    content <- str_replace(content, regex("<body([^>]*)>", ignore_case = TRUE), '<body\\1><div class="container">')
    content <- str_replace(content, regex("</body>", ignore_case = TRUE), "</div></body>")
  }
  
  writeLines(content, file_path)
}

# list all HTML files in the current directory
html_files <- list.files(path = ".", pattern = "\\.html$", recursive = TRUE, full.names = TRUE)

# apply the function to all HTML files
lapply(html_files, insert_html_and_div, html_code = html_code)