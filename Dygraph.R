

# Example data
#data <- data.frame(
 # Date = seq.Date(from = as.Date("2023-01-01"), by = "day", length.out = 100),
  #Price = cumsum(runif(100, -1, 1))
)

# Convert to xts object for dygraph
#library(xts)
#price_xts <- xts(data$Price, order.by = data$Date)

# Create dygraph with custom options
#dygraph(price_xts, main = "TSLA Stock Price Analysis") %>%
 # dyOptions(colors = RColorBrewer::brewer.pal(4, "Dark2"))
# Load necessary libraries
library(dygraphs)
library(RColorBrewer)
library(xts)
library(TTR)
TSLA <- tail(TSLA, n=30) 
graph <- dygraph(OHLC(TSLA)) 
dyCandlestick(graph)
