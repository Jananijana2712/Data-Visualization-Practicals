library(keras)
library(tensorflow)

install.packages("fs")
library(fs)

base_dir <- "jpg"
train_dir <- "train"
val_dir <- "validation"

dir_create(train_dir)
dir_create(val_dir)

all_images <- dir_ls(base_dir, glob = "*.jpg")

set.seed(123) # For reproducibility
train_indices <- sample(1:length(all_images), 0.8 * length(all_images))
train_images <- all_images[train_indices]
val_images <- all_images[-train_indices]

copy_images_to_class_folders <- function(image_list, dest_dir) {
  for (image_path in image_list) {
    file_name <- path_file(image_path)
    class_label <- strsplit(file_name, "_")[[1]][1] # Assuming 'rose_1.jpg' format
    
    # Create class folder if it doesn't exist
    class_dir <- path(dest_dir, class_label)
    if (!dir_exists(class_dir)) {
      dir_create(class_dir)
    }
    
    # Copy image to the appropriate class folder
    file_copy(image_path, path(class_dir, file_name))
  }
}

# Copy images to training and validation directories
copy_images_to_class_folders(train_images, train_dir)
copy_images_to_class_folders(val_images, val_dir)
