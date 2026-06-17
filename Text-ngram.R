library(tidytext)
library(dplyr)
library(ggplot2)

# Define the paragraph
paragraph <- "Once upon a time, four siblings—Peter, Susan, Edmund, and Lucy—were sent to the countryside during World War II to escape the dangers of London. They were housed in a large, old mansion owned by an eccentric professor. On a rainy day, as they explored the mansion, the youngest, Lucy, stumbled upon a peculiar wardrobe in a room filled with old furniture. Curiously, she stepped inside and, to her surprise, found herself in a snowy forest.

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

# Convert the paragraph to a tibble
text_df <- tibble(line = 1, text = paragraph)

# Create bigrams
bigrams <- text_df %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>%
  count(bigram, sort = TRUE)

# Print top bigrams
print(bigrams)

# Create trigrams
trigrams <- text_df %>%
  unnest_tokens(trigram, text, token = "ngrams", n = 3) %>%
  count(trigram, sort = TRUE)

# Print top trigrams
print(trigrams)

# Filter top bigrams (e.g., top 10)
top_bigrams <- bigrams %>%
  slice_max(n, n = 10)

# Create a bar plot for the top bigrams
ggplot(top_bigrams, aes(x = reorder(bigram, n), y = n)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme_minimal() +
  labs(title = "Top Bigrams in the Paragraph", x = "Bigrams", y = "Frequency") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Filter top trigrams (e.g., top 10)
top_trigrams <- trigrams %>%
  slice_max(n, n = 10)

# Create a bar plot for the top trigrams
ggplot(top_trigrams, aes(x = reorder(trigram, n), y = n)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  theme_minimal() +
  labs(title = "Top Trigrams in the Paragraph", x = "Trigrams", y = "Frequency") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


install.packages("ngram")
# Install and load necessary libraries
install.packages(c("tm", "igraph", "tidyverse", "ngram", "reshape2"))
library(tm)
library(igraph)
library(tidyverse)
library(ngram)
library(reshape2)

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

# Step 3: Generate N-grams (N = 2 for bigrams, N = 3 for trigrams, etc.)
n <- 3  # Change this value for different N-grams
ngram_data <- ngram(corpus[[1]]$content, n = n)

# Step 4: Create a data frame with N-gram counts
ngram_table <- as.data.frame(table(ngram::get.phrasetable(ngram_data)))

# Step 5: Create the co-occurrence matrix
co_occurrence_matrix <- as.matrix(ngram_table)

# Step 6: Create the graph object
g <- graph_from_data_frame(ngram_table, directed = FALSE)

# Step 7: Plot the N-gram network
plot(g, 
     vertex.size = 5,
     vertex.label.cex = 0.8,
     edge.width = E(g)$Freq,
     edge.color = "lightblue",
     main = paste("N-gram Network (N =", n, ") of Chronicles of Narnia"))


# Install and load necessary libraries
install.packages(c("tm", "igraph", "tidyverse", "reshape2"))
library(tm)
library(igraph)
library(tidyverse)
library(reshape2)

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

# Function to create N-grams
create_ngrams <- function(text, n) {
  words <- unlist(strsplit(tolower(text), "\\s+"))  # Split text into words
  ngrams <- sapply(1:(length(words) - n + 1), function(i) {
    paste(words[i:(i + n - 1)], collapse = " ")
  })
  return(ngrams)
}

# Step 1: Create N-grams (set n to desired N-gram size, e.g., 2 for bigrams)
n <- 2  # Change this value for different N-grams
ngrams <- create_ngrams(narnia_text, n)

# Step 2: Create a data frame with n-gram counts
ngram_table <- as.data.frame(table(ngrams))

# Step 3: Create the co-occurrence matrix
co_occurrence_matrix <- as.matrix(xtabs(Freq ~ ngrams, data = ngram_table))

# Step 4: Create the graph object
g <- graph_from_data_frame(ngram_table, directed = FALSE)

# Step 5: Plot the N-gram network
plot(g, 
     vertex.size = 5,
     vertex.label.cex = 0.8,
     edge.width = E(g)$Freq,
     edge.color = "lightblue",
     main = paste(n, "-gram Network of Chronicles of Narnia"))
