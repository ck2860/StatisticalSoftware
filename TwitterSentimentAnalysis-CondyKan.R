#Condy Kan
# R Project: Twitter Sentiment Analysis 
#Note: in my report, I cited a couple of resources that I used for sentiment analysis and packages.

install.packages('rtweet') 
install.packages('dplyr')
install.packages('tidyr')
install.packages('tidytext')
install.packages('ggplot')
library(rtweet)
library(dplyr)
library('tidytext')
library('tidyr')
library(ggplot2)


#Let's get some tweets
AAtweets <- get_timeline("AmericanAir", n=5000)%>%
  dplyr::filter(created_at > "2020-09-17" & created_at <="2020-10-01")

Deltatweets <-get_timeline("Delta", n=5000)%>%
  dplyr::filter(created_at > "2020-09-17" & created_at <="2020-10-01")

#Let's do tidy texting mining

#Extract AmericanAir tweets
tweets.AAtweets = AAtweets%>% select(screen_name,text)
tweets.AAtweets

#Extract Delta tweets
tweets.Deltatweets = Deltatweets %>% select(screen_name, text)
tweets.Deltatweets

#Let's do pre-processing cleaning such as removing http, etc... 
tweets.AAtweets$cleaned_text1 = gsub("htt.*",'',tweets.AAtweets$text)
#stemming words
tweets.AAtweets_stemming = tweets.AAtweets %>%
  select(cleaned_text1) %>%
  unnest_tokens(word, cleaned_text1)
# remove stop words 
cleaned_tweets.AAtweets = tweets.AAtweets_stemming %>%
  anti_join(stop_words)
head(cleaned_tweets.AAtweets)
#head(tweets.AAtweets$text)

#Let's do pre-processing cleaning such as removing http, etc... 
tweets.Deltatweets$cleaned_text2 = gsub("htt.*",'',tweets.Deltatweets$text)
#Stemming words
tweets.Deltatweets_stemming = tweets.Deltatweets %>%
  select(cleaned_text2) %>%
  unnest_tokens(word, cleaned_text2)
# remove stop words
cleaned_tweets.Deltatweets = tweets.Deltatweets_stemming %>%
  anti_join(stop_words)

#Let's make some visualizations to show Bing's positve and negative categories
#AmericanAir
bing_aa = cleaned_tweets.AAtweets %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE)
  ungroup()
bing_aa %>%
  group_by(sentiment) %>%
  top_n(10)%>%
  ungroup() %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word,n, fill=sentiment)) +
  geom_col(show.legend=FALSE)+
  facet_wrap(~sentiment, scales="free_y")+
  labs(title="American Air tweets", Y= "sentiment", x= NULL)+
  coord_flip() + theme_bw()

#Let's make some visualizations to show Bing's positve and negative categories
#Delta
bing_delta = cleaned_tweets.Deltatweets %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE)
  ungroup()
bing_delta %>%
  group_by(sentiment) %>%
  top_n(10)%>%
  ungroup() %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word,n, fill=sentiment)) +
  geom_col(show.legend=FALSE)+
  facet_wrap(~sentiment, scales="free_y")+
  labs(title="Delta tweets", Y= "Contribution to sentiment", x= NULL)+
  coord_flip() + theme_bw()

# let's add sentiment analysis, using AFINN lexicon, to dataset
install.packages('syuzhet')
library(syuzhet)
#afinn
AAsentAfinn <- get_sentiment(AAtweets$text,method="afinn")
DeltasentAfinn <- get_sentiment(Deltatweets$text,method="afinn")

#Putting the tweets and AFINN scores into data
AAdata <- cbind(AAtweets,AAsentAfinn)
Deltadata <- cbind(Deltatweets, DeltasentAfinn)

#rename dataframe
colnames(AAdata)[colnames(AAdata)=="AAsentAfinn"]<-"Sentiment Score-Afinn"
colnames(Deltadata)[colnames(Deltadata)=="DeltasentAfinn"]<-"Sentiment Score-Afinn"

#this just stacks one on top of the other.
airdata <-rbind(AAdata, Deltadata)

#let's write out to a file
write_as_csv(airdata, "Airlinesdata.csv")
