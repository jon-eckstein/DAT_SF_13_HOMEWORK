#Project Summary   

###Problem Statement
I work for a music streaming provider called bop.fm and we do not have a feature for displaying similar artists based on a seed artist.  All the other players in the music streaming world have this feature.  I want to bring this feature to bop.fm using a recommender system.

###Data set
The data set was obtained through an data dump from our internal mongodb database.  I performed a straight export of our listens collection which consists simply of a user_id, song_id and timestamp.  One document in this collection represents a listen in the system.

###Preprocessing/data munging
I had to get the artist for the given song_id, I then had to aggregate the data such that I could get a count of listens by user for a given artist.  I also added a genre tag for each artists.  In addition, I had to bin the raw listens to mimic a rating system (i.e. if a user listened to a song 1-2 times it's a 1, 3-5 == 2, 6-8 == 3, and over that is a 4.)

###Learned from the data
My data is very unevenly distributed.  90% of the listens belong to only 4% of the aritsts. This is a problem (called the long-tail) that is common for any recommender system.

###Feature selection
Recommender systems dont give much flexibility in terms of feature selection.  The python-recsys library takes in a user_id, item_id and interations (i.e. rating).  It doesn't allow for any other features to be given.  Although that didn't stop me from trying!  I attempted to dummy up some listen records as well as coerce a clustering by utilizing the genre for each artist.  So I create dummy listen records for every genre/artist combination giving each record a high rating and added that to my raw data set.  It didn't work out well.

###Challenges and successes
####Success:
Not much in the way of success.  In the end the recommender system didn't work.  

####Challenges:
- Lack of data:  I didn't have wide enough breadth of listens data to make good recommendations for most of the artists
- Long tail: Most of the listens went only to a few of the artists.  Making it difficult to make recommendations for artists who are not as popular.
- Validation:  It is difficult to validate data from a recommender system.  I was able to use Last.fm data to get the similar artists.  But even this is not a good way of validating the system.
- 
###Possible extensions or business applications
The approach I have is sound however I need to wait until I have enough data to make good recommendations. I'll keep running the process periodically to check in on how I'm doing.

###Conclusions and key learnings
Data Science is fun!