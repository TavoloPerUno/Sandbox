library(tabulizer)
library(dplyr)
location <- 'http://www.pb.com/docs/us/pdf/sis/mail-services/usps-suffix-abbreviations.pdf'

# Extract the table
out <- extract_tables(location)
out[[6]] <- out[[6]][,-2]
out[[6]][18,2] <- 'ISLNDS'
final <- do.call(rbind, out)
abbvs <- data.frame(final[-c(1:5),])
colnames(abbvs) <- c("NAME", "COMMON", "STD")
