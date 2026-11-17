# launch-app.R loads the helper and module before running this app.
ui <- shiny::fluidPage(shiny::titlePanel("Two-group simulation"), groupUI("groups"))
server <- function(input, output, session) groupServer("groups")
shiny::shinyApp(ui, server)
