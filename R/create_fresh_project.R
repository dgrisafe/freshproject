#' Create folders for a new scientific data analysis project.
#'
#' @import bibtex
#' @import stringr
#'
#' @param proj_name What is the name of the project? This will be the name of the main folder for the project.
#' @param proj_dir A directory where you would like to set up the project.
#' @return A new project named \code{proj_name} is created in the project directory \code{proj_dir}.
#' @return Examples Include:
#' @return create_fresh_project(proj_name = "Fresh Project", proj_dir = "/Users/USC/Documents/GitHub/freshproject")
#' @return create_fresh_project(proj_name = "My Fresh Project", proj_dir = "/Users/USC/Desktop")
#' @return create_fresh_project(proj_name = "Even Fresher Project", proj_dir = "/Users/USC/Desktop")
#' @return create_fresh_project(proj_name = "The Freshest Project", proj_dir = "/Users/USC/Desktop")
#'
#' @export
create_fresh_project <- function(proj_name = "Fresh Project", proj_dir){

  # function to append paths of directories or files
  append_path <- function(path_first, path_add){paste(path_first, path_add, sep = "/")}

  # create the main folder of the project
  proj_dir_path <- append_path(proj_dir, proj_name)
  dir.create(proj_dir_path)

  # function to create subfolders in the project directory
  create_subfolder <- function(dir_name){
    dir.create(
      append_path(proj_dir_path, dir_name)
    )}
  create_subfolder("0 Data")
  create_subfolder("1 Programs")
  create_subfolder("2 Media")
  create_subfolder("3 Reports")
  create_subfolder("4 Discussions")
  create_subfolder("5 Drafts")
  create_subfolder("6 Talks")

  # create snake_case name of the project name
  proj_name_snake <- gsub("\\s", "_", str_to_lower(proj_name))

  # create a blank bibliography file
  write.bib(
    entry = "bibtex",
    append = TRUE,
    file = append_path(proj_dir_path, paste0(proj_name_snake, ".bib"))
    )
}
