#d <- read.csv("rankings.csv",header=TRUE)

# Open SQLite data source
#install.packages("RSQLite")
library("DBI")
conn <- dbConnect(RSQLite::SQLite(), dbname="ratings.sqlite3")
d <- dbGetQuery(conn,"SELECT Banks.cannonicalName AS bankName, SourceData.periodEnding, Ratings.ratingScore, Issuers.cannonicalName AS issuerName FROM Banks LEFT JOIN SourceData ON Banks.bankId=SourceData.bankId LEFT JOIN Ratings ON SourceData.ratingId=Ratings.ratingId LEFT JOIN Issuers ON Ratings.issuerId=Issuers.issuerId")
dbDisconnect(conn)

d$periodEnding <- as.Date(strptime(d$periodEnding,format="%Y-%m-%d"))

plotBank <- function(bankName) {
  jitterAmount <- 0
  #xlim <- range(d[d$bankName==bankName,]$periodEnding)
  xlim <- range(d$periodEnding)
  #ylim <- range(d[d$bankName==bankName,]$ratingScore)
  ylim <- c(20,0)
  x <- d[(d$bankName==bankName & d$issuerName=="Standard and Poor's"),]
  plot(x$periodEnding, jitter(x$ratingScore, jitterAmount), 
       type="p", pch=16, col=rgb(1,0,0,0.5),
       #type="l", lwd=5, col="red",
       main=bankName,
       xlab="Period Ending",
       ylab="Rating Score (0=best)",
       xlim=xlim,
       ylim=ylim)

  x <- d[(d$bankName==bankName & d$issuerName=="Moody's"),]
  lines(x$periodEnding, jitter(x$ratingScore, jitterAmount), 
        type="p", pch=16, col=rgb(0,0,1,0.5))

  x <- d[(d$bankName==bankName & d$issuerName=="Fitch"),]
  lines(x$periodEnding, jitter(x$ratingScore, jitterAmount), 
        type="p", pch=16, col=rgb(0,1,0,0.5))

  abline(h=10, col="grey")
  
  
  #legend("topleft", 
  #       c("Standard and Poor's", "Moody's", "Fitch"), 
  #       col=c("red","green","blue"), 
  #       pch=1)
  
  l <- legend("bottomleft", 
            c("Standard and Poor's", "Moody's", "Fitch"), 
            pch=NA, seg.len=3, lwd=1, lty=NA)  
  
  clip(l$rect$left, min(l$rect$left+l$rect$w, l$text$x), 
       l$rect$top, l$rect$top-l$rect$h)
  
  points(0.3*l$text$x[1] + 0.7*l$rect$left, l$text$y[1], 
         pch=16, col=rgb(1,0,0,0.5), cex=7)
  points(0.7*l$text$x[2] + 0.3*l$rect$left, l$text$y[2], 
         pch=16, col=rgb(0,0,1,0.5), cex=7)
  points(0.3*l$text$x[3] + 0.7*l$rect$left, l$text$y[3], 
         pch=16, col=rgb(0,1,0,0.5), cex=7)
  
}

plotBank("ASB")
#plotBank("Heartland")
#plotBank("Rabo New Zealand")
#plotBank("Kiwibank")

# List names of banks
bankNames <- levels(factor(d$bankName))
#plotBank(bankNames[1])

pdf("ratings.pdf", onefile=TRUE)
for (b in bankNames) {
  plotBank(b)
}
dev.off()
