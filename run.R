run_drugseqr <- function(app_name,
                         data_dir = '/srv/drugseqr',
                         app_dir = system.file('app', package = 'drugseqr', mustWork = TRUE),
                         pert_query_dir = file.path(data_dir, 'pert_query_dir'),
                         pert_signature_dir = file.path(data_dir, 'pert_signature_dir'),
                         indices_dir = file.path(data_dir, 'indices'),
                         tabs = c('Single Cell', 'Bulk Data', 'Drugs'),
                         host = '0.0.0.0',
                         port = 3838) {

  data_dir <- file.path(data_dir, app_name)
  if (!dir.exists(data_dir)) dir.create(data_dir)

  # pass arguments to app through options then run
  shiny::shinyOptions(data_dir = normalizePath(data_dir),
                      pert_query_dir = normalizePath(pert_query_dir),
                      pert_signature_dir = normalizePath(pert_signature_dir),
                      indices_dir = normalizePath(indices_dir),
                      tabs = tabs)


  shiny::runApp(app_dir, launch.browser = TRUE, host = host, port = port)
}
