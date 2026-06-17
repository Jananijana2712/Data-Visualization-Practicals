library(tm)
library(wordcloud)

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

# Step 2: Clean the text
corpus <- tm_map(corpus, content_transformer(tolower))  # Convert to lowercase
cat("Step 2: Converted text to lowercase.\n\n")

corpus <- tm_map(corpus, removePunctuation)  # Remove punctuation
cat("Step 3: Removed punctuation from the text.\n\n")

corpus <- tm_map(corpus, removeNumbers)  # Remove numbers
cat("Step 4: Removed numbers from the text.\n\n")

corpus <- tm_map(corpus, removeWords, stopwords("english"))  # Remove stopwords
cat("Step 5: Removed common stopwords like 'the', 'and', 'of', etc.\n\n")

# Step 6: Convert corpus into a document-term matrix (DTM)
dtm <- DocumentTermMatrix(corpus)
cat("Step 6: Converted the cleaned text into a Document-Term Matrix (DTM).\n\n")

# Step 7: Sum the word frequencies
word_freq <- colSums(as.matrix(dtm))

# Step 8: Sort word frequencies in descending order
word_freq <- sort(word_freq, decreasing = TRUE)
cat("Step 8: Calculated and sorted word frequencies in descending order.\n\n")

# Step 9: Print word frequencies alongside the words
cat("Step 9: Word frequencies (word and count side by side):\n\n")
for (word in names(word_freq)) {
  cat(sprintf("%-15s : %d\n", word, word_freq[word]))
}
# Optional: Create a word cloud for visualization
wordcloud(names(word_freq), freq = word_freq, min.freq = 1, scale = c(3, 0.5), colors = brewer.pal(8, "Dark2"))


# Install and load necessary libraries
install.packages("tm")   # For text mining
library(tm)

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

# Step 1: Create a text corpus (no preprocessing)
corpus <- Corpus(VectorSource(narnia_text))

# Step 2: Convert corpus into a document-term matrix (DTM)
dtm <- DocumentTermMatrix(corpus)

# Step 3: Sum the word frequencies (no preprocessing)
word_freq <- colSums(as.matrix(dtm))

# Step 4: Sort word frequencies in descending order
word_freq <- sort(word_freq, decreasing = TRUE)

# Step 5: Print word frequencies alongside the words
cat("Word frequencies (without preprocessing):\n\n")
for (word in names(word_freq)) {
  cat(sprintf("%-15s : %d\n", word, word_freq[word]))
}

# Optional: Create a word cloud for visualization
wordcloud(names(word_freq), freq = word_freq, min.freq = 1, scale = c(3, 0.5), colors = brewer.pal(8, "Dark2"))
