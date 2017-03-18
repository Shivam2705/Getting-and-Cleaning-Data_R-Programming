#Ans:1
fileurl1 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
dst1 = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q1.csv'
download.file(fileurl1, dst1, method = 'curl')
data1 = read.csv(dst1)
agricultureLogical = data1$ACR == 3 & data1$AGS == 6
head(which(agricultureLogical), 3)


#Ans:2 
fileurl2 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
dst2 = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q2.jpg'
download.file(fileurl2, dst2, mode = 'wb', method = 'curl')
data2 = readJPEG(dst2, native = TRUE)
quantile(data2, probs = c(0.3, 0.8))


#Ans:3
fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
dst3a = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3a.csv'
fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
dst3b = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3b.csv'
download.file(fileurl3a, dst3a, method = 'curl')
download.file(fileurl3b, dst3b, method = 'curl')
gdp = fread(dst3a, skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
edu = fread(dst3b)
merge = merge(gdp, edu, by = 'CountryCode')
nrow(merge)
arrange(merge, desc(Rank))[13, Economy]

#Ans:4

tapply(merge$Rank, merge$`Income Group`, mean)


#Ans:5
merge$RankGroups <- cut2(merge$Rank, g=5)
table(merge$RankGroups, merge$`Income Group`)