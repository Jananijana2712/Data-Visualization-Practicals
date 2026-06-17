install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)
library(dplyr)
library(tidytext)

# Define the paragraph
paragraph <- "The Paris 2024 Olympics marks a monumental occasion in the history of the Games, as it symbolizes the return of the Summer Olympics to France, a century after Paris last hosted them in 1924. Scheduled to take place from July 26 to August 11, 2024, the Games are set to feature 32 sports and 329 events, bringing together athletes from across the globe in a celebration of excellence, unity, and perseverance. The Paris 2024 Olympics promises to be a blend of tradition and modernity, as the host city aims to deliver an inclusive, sustainable, and innovative event that resonates with the values of the Olympic movement. One of the standout aspects of Paris 2024 is its emphasis on sustainability. In line with the global focus on combating climate change, the organizers have committed to reducing the carbon footprint of the Games. Many of the competition venues are existing structures, reducing the need for new construction, and the Olympic Village, located in Seine-Saint-Denis, is being designed to become a model of sustainable urban development. Paris 2024 also plans to be the first Olympic Games aligned with the Paris Climate Agreement, aiming for a 50% reduction in carbon emissions compared to previous editions. Another defining feature of Paris 2024 is its focus on inclusion. Gender equality will be a central theme, with an equal number of male and female athletes participating for the first time in Olympic history. The Games will also include a greater focus on youth-oriented sports such as skateboarding, surfing, sport climbing, and breakdancing, appealing to a younger audience while expanding the diversity of athletic talent on display. The iconic locations of Paris will play a significant role in enhancing the spectacle of the Games. Events will be held at historic and picturesque sites, including the Eiffel Tower, Champs-Élysées, and the River Seine. The Opening Ceremony will be a remarkable departure from tradition, taking place not in a stadium but along the River Seine, where athletes will sail down the river on boats, allowing more than 600,000 spectators to witness the spectacle for free. This bold innovation reflects Paris’ commitment to making the Games more accessible and engaging for the public. Paris 2024 is also leveraging technological advancements to enhance the experience for athletes, fans, and viewers. Innovations in virtual reality, augmented reality, and immersive media will provide new ways for people to experience the Games, whether they are attending in person or following the events remotely. The use of data analytics and artificial intelligence will also enhance performance analysis, training, and fan engagement. As the world looks forward to the Paris 2024 Olympics, the event stands as a testament to the enduring spirit of the Olympic Games, which continue to evolve with the times while staying true to the values of excellence, respect, and friendship. Paris 2024 is set to be a Games that celebrates athletic achievement, environmental responsibility, and global unity, leaving a lasting legacy for future generations."

# Convert the paragraph to a tibble
text_df <- tibble(line = 1, text = paragraph)

# Tokenize the words and calculate word frequency
word_counts <- text_df %>%
  unnest_tokens(word, text) %>%
  count(word, sort = TRUE)

# Set color palette
colors <- brewer.pal(8, "Dark2")

# Create the word cloud
wordcloud(words = word_counts$word, 
          freq = word_counts$n, 
          min.freq = 1,           # Minimum frequency for words to be included
          max.words = 100,        # Maximum number of words to display
          random.order = FALSE,   # Display more frequent words at the center
          rot.per = 0.35,         # Percentage of words to rotate
          colors = colors)
