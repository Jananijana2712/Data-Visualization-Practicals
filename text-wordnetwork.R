library(dplyr)
library(tidytext)
library(igraph)
library(ggraph)
library(tidyr)

# Define the paragraph
paragraph <- "The Paris 2024 Olympics marks a monumental occasion in the history of the Games, as it symbolizes the return of the Summer Olympics to France, a century after Paris last hosted them in 1924. Scheduled to take place from July 26 to August 11, 2024, the Games are set to feature 32 sports and 329 events, bringing together athletes from across the globe in a celebration of excellence, unity, and perseverance. The Paris 2024 Olympics promises to be a blend of tradition and modernity, as the host city aims to deliver an inclusive, sustainable, and innovative event that resonates with the values of the Olympic movement. One of the standout aspects of Paris 2024 is its emphasis on sustainability. In line with the global focus on combating climate change, the organizers have committed to reducing the carbon footprint of the Games. Many of the competition venues are existing structures, reducing the need for new construction, and the Olympic Village, located in Seine-Saint-Denis, is being designed to become a model of sustainable urban development. Paris 2024 also plans to be the first Olympic Games aligned with the Paris Climate Agreement, aiming for a 50% reduction in carbon emissions compared to previous editions. Another defining feature of Paris 2024 is its focus on inclusion. Gender equality will be a central theme, with an equal number of male and female athletes participating for the first time in Olympic history. The Games will also include a greater focus on youth-oriented sports such as skateboarding, surfing, sport climbing, and breakdancing, appealing to a younger audience while expanding the diversity of athletic talent on display. The iconic locations of Paris will play a significant role in enhancing the spectacle of the Games. Events will be held at historic and picturesque sites, including the Eiffel Tower, Champs-Élysées, and the River Seine. The Opening Ceremony will be a remarkable departure from tradition, taking place not in a stadium but along the River Seine, where athletes will sail down the river on boats, allowing more than 600,000 spectators to witness the spectacle for free. This bold innovation reflects Paris’ commitment to making the Games more accessible and engaging for the public. Paris 2024 is also leveraging technological advancements to enhance the experience for athletes, fans, and viewers. Innovations in virtual reality, augmented reality, and immersive media will provide new ways for people to experience the Games, whether they are attending in person or following the events remotely. The use of data analytics and artificial intelligence will also enhance performance analysis, training, and fan engagement. As the world looks forward to the Paris 2024 Olympics, the event stands as a testament to the enduring spirit of the Olympic Games, which continue to evolve with the times while staying true to the values of excellence, respect, and friendship. Paris 2024 is set to be a Games that celebrates athletic achievement, environmental responsibility, and global unity, leaving a lasting legacy for future generations."

# Convert the paragraph to a tibble
text_df <- tibble(line = 1, text = paragraph)

# Tokenize the text into words and create bigrams
bigrams_df <- text_df %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

# Separate bigram into two words
bigrams_separated <- bigrams_df %>%
  separate(bigram, into = c("word1", "word2"), sep = " ")

# Create a graph object
bigram_graph <- bigrams_separated %>%
  count(word1, word2) %>%
  filter(n > 0) %>%
  graph_from_data_frame()

# Plot the graph
ggraph(bigram_graph, layout = "fr") +
  geom_edge_link(aes(edge_alpha = n), show.legend = FALSE) +
  geom_node_point(size = 5) +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_void() +
  labs(title = "Word Network Graph")


# Install and load necessary libraries
install.packages(c("tm", "tidyverse", "igraph", "ggraph"))
library(tm)
library(tidyverse)
library(igraph)
library(ggraph)

# Define the Chronicles of Narnia text
narnia_text <- "Once upon a time, four siblings—Peter, Susan, Edmund, and Lucy—were sent to the countryside during World War II to escape the dangers of London. They were housed in a large, old mansion owned by an eccentric professor. On a rainy day, as they explored the mansion, the youngest, Lucy, stumbled upon a peculiar wardrobe in a room filled with old furniture. Curiously, she stepped inside and, to her surprise, found herself in a snowy forest.

In the forest, Lucy encountered a faun named Mr. Tumnus, who explained that she was in Narnia, a magical land ruled by the White Witch. The Witch had cast a spell over Narnia, making it always winter but never Christmas. Mr. Tumnus invited Lucy to tea, and despite being instructed by the Witch to report any humans, he confessed his plan to betray her and instead helped Lucy return to the wardrobe.

Back in the real world, Lucy tried to tell her siblings about her adventure, but none of them believed her. A few days later, Edmund followed Lucy into the wardrobe and found himself in Narnia as well. However, instead of meeting Mr. Tumnus, Edmund encountered the White Witch herself. She tempted him with enchanted Turkish Delight and promised him power if he brought his siblings to her castle. Greedy for more sweets and the thought of becoming a prince, Edmund agreed.

When Lucy met up with Edmund back at the wardrobe, she thought he would confirm her story to the others. However, Edmund lied and denied the existence of Narnia, which made Lucy very upset. Eventually, all four children entered the wardrobe together and found themselves in the magical world. They met Mr. Beaver, who explained the truth about the White Witch and how she feared the return of Aslan, the true king of Narnia. According to an ancient prophecy, the Witch’s reign would end when two Sons of Adam and two Daughters of Eve sat on the thrones at Cair Paravel.

The children decided to seek Aslan’s help, but Edmund slipped away to betray them to the White Witch. The Witch was furious when she learned that Aslan had returned and was preparing to meet the children. She marched Edmund off to her castle as her prisoner.

Meanwhile, Peter, Susan, and Lucy were led by Mr. and Mrs. Beaver to the Stone Table, where they met Aslan, a magnificent lion and the true king of Narnia. Aslan promised to help rescue Edmund and defeat the White Witch. Soon after, a rescue party was sent to free Edmund from the Witch’s clutches.

However, the White Witch reminded Aslan of the deep magic that governed Narnia. According to the laws of Narnia, traitors belonged to her, and Edmund’s life was forfeit. Aslan made a secret deal with the Witch, offering himself in exchange for Edmund’s life. That night, Aslan quietly left his camp and went to the Stone Table, where the Witch and her followers bound and humiliated him before killing him in Edmund’s place.

The next morning, Lucy and Susan, who had followed Aslan, found his lifeless body on the Stone Table. Heartbroken, they sat with him until dawn. As the sun rose, they heard a great crack and saw that the Stone Table had broken. Miraculously, Aslan had returned to life. He explained that a deeper magic existed that the Witch did not know about: when a willing victim who had committed no treachery was sacrificed in a traitor’s stead, death itself would be reversed.

With renewed hope, Aslan led Lucy and Susan to the Witch’s castle, where they freed all the creatures she had turned to stone. Aslan then led the Narnian forces into battle against the White Witch and her army. Peter bravely fought the Witch, and with Aslan’s arrival, the tide turned. The Witch was defeated, and the Narnians celebrated their victory.

The four siblings were crowned as kings and queens of Narnia at Cair Paravel, fulfilling the prophecy. They ruled Narnia for many years in peace and prosperity. One day, while hunting a white stag, they came across a familiar lamppost in the woods. Suddenly, they found themselves tumbling back through the wardrobe and into the professor’s house.

To their surprise, no time had passed at all in the real world, and they were children once again. They shared their adventures with the professor, who encouraged them to keep their memories of Narnia alive, for they might return to the magical land one day."

# Step 1: Create a text corpus
corpus <- Corpus(VectorSource(narnia_text))

# Step 2: Preprocess the corpus (convert to lowercase, remove punctuation)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("en"))

# Step 3: Tokenize the text into words
words <- unlist(strsplit(as.character(corpus[[1]]), "\\s+"))

# Step 4: Create bigrams
bigrams <- data.frame(do.call(rbind, lapply(1:(length(words)-1), function(i) c(words[i], words[i+1]))))
)
colnames(bigrams) <- c("word1", "word2")

# Step 5: Create a co-occurrence table
co_occurrence <- bigrams %>%
  group_by(word1, word2) %>%
  summarise(Freq = n(), .groups = 'drop')

# Step 6: Create a graph object
g <- graph_from_data_frame(co_occurrence, directed = FALSE)

# Step 7: Plot the word network
ggraph(g, layout = "fr") +
  geom_edge_link(aes(edge_alpha = Freq), show.legend = FALSE) +
  geom_node_point(size = 3, color = "red") +
  geom_node_text(aes(label = name), repel = TRUE) +
  labs(title = "Word Network-Chronicles of Narnia") +
  theme_void()
