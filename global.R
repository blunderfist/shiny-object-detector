# checks and installs themes if missing
if (!require('shiny')) install.packages("shiny")
if (!require('shinythemes')) install.packages("shinythemes")
if (!require('reticulate')) install.packages("reticulate")
if (!require('tidyverse')) install.packages("tidyverse")
# if (!require('tools')) install.packages("tools")
# if (!require('stringr')) install.packages("stringr")
# import tensorflow as tf
# import tensorflow_hub as hub
# 
# import tempfile
# 
# # For drawing onto the image.
# import numpy as np
# from PIL import Image
# from PIL import ImageColor
# from PIL import ImageDraw
# from PIL import ImageFont
# from PIL import ImageOps
# 
# # For measuring the inference time.
# import time


# data source
# data <- read_csv(file = "results.csv", skip = 1)

# function scripts
# source_python("functions/obj_det.py")
source("functions/barplot.R")



# source("functions/all_barplot.R")

