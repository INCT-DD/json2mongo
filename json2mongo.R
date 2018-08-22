# LOAD LIBRARIES

library("jsonlite")
library("mongolite")

# MONGODB AUTH DATA

mongoUser <- ""  
mongoPasswd <- ""
mongoHost <- ""
mongoPort <- ""

# APP PERSISTENCE DATA

dbName <- ""
dbCollection <- ""

# FILE TO IMPORT

dataPath <- ""

# DATASTREAM LOADING

dataStream <- stream_in(file(dataPath))

# DATABASE CONNECTION

mongoUrl <- URLencode(paste0("mongodb://",
                             mongoUser, ":", mongoPasswd,
                             "@", mongoHost, ":", mongoPort)
)

mongoConnection <- mongo(db = dbName,
                         collection = dbCollection,
                         url = mongoUrl)

# DATA PERSISTENCE TO DATABASE

mongoConnection$insert(dataStream)
