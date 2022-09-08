
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {


  observeEvent(input$file_up, {
    file_upload <- input$file_up
    if (is.null(file_upload))
      return()
    file.copy(file_upload$datapath, overwrite = TRUE, file.path("img/", 'temp.jpg'))
  })
  
  
  run_detector <- function(){
    if(!input$run_detect){
      return(isolate({output$obj_detect_results}))
    }else{
      return(output$obj_detect_results)
    }
  }
  
  return_img <- eventReactive(input$run_detect, {
    im <- list(
      src = "img/image_result.jpg",
      contentType = "image/jpg",
      alt = "file uploaded"
    )
    return (im)
    })
  
  run_det <- eventReactive(input$run_detect, {
    input$run_detect
    ob_d <- py_run_file("functions/obj_det.py")
    return (ob_d)
    })

  # run_plot <- eventReactive(input$run_detect, {
  #   input$run_detect
  #   print(getwd())
  #   data <- read_csv("functions/results.csv", col_types = cols(`..2` = col_double()))
  #   data <- data[2:nrow(data)-1,]
  #   bar_p <- barplot()
  #   return (bar_p)
  #   })

  # output$barchart <- renderPlot({
  #   input$run_detect
  #   run_plot()
  #   
  # })
  
      
  output$obj_detect_results <- renderImage({
    input$run_detect
    
    ##########################
    # Create a Progress object
    progress <- shiny::Progress$new()
    # Make sure it closes when we exit this reactive, even if there's an error
    on.exit(progress$close())
    progress$set(message = "Running application", value = 0)

    # Number of steps
    n <- 3

      # Increment the progress bar, and update the detail text.
    progress$inc(1/n, detail = paste("Step ", 1, " of ", n))
    run_det()

    progress$inc(1/n, detail = paste("Step ", 2, " of ", n))
    return_img()

    progress$inc(1/n, detail = paste("Step ", 3, " of ", n))
    # run_plot()

    ##########################
    
  }, deleteFile = TRUE)
  

})
