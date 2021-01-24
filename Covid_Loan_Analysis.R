## FILTERING COVID-19 FEDERAL BUSINESS LOAN DATA FOR ALLEGHENY COUNTY

## Reading in loan data files. Download here and replace paths: https://sba.app.box.com/s/5myd1nxutoq8wxecx2562baruz774si6/folder/127201759675
## Source: SBA
File_1 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/01 PPP sub 150k through 112420.csv", stringsAsFactors = F)
File_2 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/02 PPP sub 150k through 112420.csv", stringsAsFactors = F)
File_3 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/03 PPP sub 150k through 112420.csv", stringsAsFactors = F)
File_4 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/04 PPP sub 150k through 112420.csv", stringsAsFactors = F)
File_5 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/05 PPP sub 150k through 112420.csv", stringsAsFactors = F)
File_6 <- read.csv("/Users/mickeymcglasson/Downloads/120120 EIDL, EIDL Advance, and PPP Data-selected/150k plus PPP through 112420.csv", stringsAsFactors = F)

PPP.Data_combined <- rbind(File_1, File_2, File_3, File_4, File_5, File_6)
  
## Filtering down to loans in or near Allegheny County by ZIP codes (Data do no contain County explicitly.)
ZIPS <-read.csv("/Users/mickeymcglasson/Library/Mobile Documents/com~apple~CloudDocs/D4BL/Allegheny_County_ZIPS.csv")
ZIPS <- ZIPS$ZIPS
PPP_Allegheny <- PPP.Data_combined[which(as.numeric(PPP.Data_combined$Zip) %in% ZIPS),]
                                                      
#Gut Check
nrow(PPP_Allegheny)/nrow(PPP.Data_combined)

#Merge NAICS Description
NAICS <- read.csv("/Users/mickeymcglasson/Library/Mobile Documents/com~apple~CloudDocs/D4BL/NAICS.csv")
PPP_Allegheny<-merge(x=PPP_Allegheny, y=NAICS, by="NAICSCode")
write.csv(PPP_Allegheny, "/Users/mickeymcglasson/Downloads/Allegheny_Loans.csv", row.names = F)  


                                                      