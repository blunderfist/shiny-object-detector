

barplot <- function (s){

  p <- ggplot(data, aes(x = unlist(data[2]), y = reorder(unlist(data[1]), unlist(data[2])))) +
    geom_bar(stat = 'identity',
             fill = "#7db4f1",
             color = "#358ef0",
             alpha = 0.5) +
      labs(title = "Results",
           y = "Object",
           x = "Confidence")

  return (p)
}


