#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  tags$head(
    tags$style(HTML("
        img {max-width: 90%;
          height: auto;}"
                    ) # html
    ) # tagstyle
    ), #tags head
  
  theme = shinytheme("spacelab"),
    # Application title
    titlePanel("Object Detection"),

  navbarPage("Navigation",
             
             # navbarMenu("Object Detection",
                        
    tabPanel(title = "Object Detection",
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          # Input: Select a file ----
          fileInput("file_up", "Choose an image",
                    multiple = FALSE,
                    accept = c("image/png",
                               "image",
                               ".png",".jpg",".jpeg")),

          # wait until clicked to process
          actionButton("run_detect",
                       "Run Object Detection"),
          p("Don't worry, it's not stuck. This takes several minutes, please be patient.")          
        ),

        # Show a plot of the generated distribution
        mainPanel(
            imageOutput("obj_detect_results"),
            br(),br(),
            plotOutput("barchart")
        ) # main panel
        ) # sidebar layout
                        ), # tab panel
    
    tabPanel(title = "About",
    fluidRow(
      h1("About this app"),
      p("This app uses a convolutional neural network to detect objects within images. It's using tensorflow and the whatever architecture."),
      p("The specific model being deployed is Inception ResNet V2."),
      p("More about"),
      p("Anything else.")
    ) # fluid row
    ) # tab panel
) # navbar page
))
