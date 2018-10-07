df=read.csv(file.choose("C:/users/govind/iris.csv"))
df %>% head()
df %>% tail()
iris<-tbl_df(iris)
str(iris)
df1<-df %>% select(Species)
df2<-table(iris$Species)
df2
as.data.frame(df2)
df %>%qplot(SepalLengthCm,Species,data=.)
iris %>% tbl_df %>%
  +     select(matches(".t.")) %>% head(3)
iris %>% tbl_df %>%
  mutate(Petal.Width.plus.Length = Petal.Width + Petal.Length) %>%
  select(Species, Petal.Width.plus.Length) %>% head(3)
iris %>% tbl_df %>%
  mutate(Petal.Width.plus.Length = Petal.Width + Petal.Length,
         Sepal.Width.plus.Length = Sepal.Width + Sepal.Length) %>%
  select(Petal.Width.plus.Length, Sepal.Width.plus.Length) %>%
  head(3)
iris %>% tbl_df %>%
  transmute(Petal.Width.plus.Length = Petal.Width + Petal.Length) %>%
  head(3)
iris %>% tbl_df %>%
  filter(Sepal.Length > 5) %>% head() # filter provide funtionality pick out rows based on logical expressions.
iris %>% tbl_df %>%
  filter(Sepal.Length > 5 & Species == "virginica") %>%
  select(Species, Sepal.Length) %>% head()
iris %>%
  summarise(Mean.Petal.Length = mean(Petal.Length),
            Mean.Sepal.Length = mean(Sepal.Length))
iris %>%
  group_by(Species) %>%
  summarise(Mean.Petal.Length = mean(Petal.Length))
iris %>%
  summarise(Observations = n())
iris %>%
  group_by(Species) %>%
  summarise(Number.Of.Species = n())
df %>% summarise(avg_sleep = mean(PetalLengthCm), 
          min_sleep = min(PetalLengthCm),
          max_sleep = max(PetalLengthCm),
          total = n())
df%>% 
  group_by(Species) %>%
  summarise(avg_sleep = mean(PetalLengthCm), 
            min_sleep = min(PetalLengthCm), 
            max_sleep = max(PetalLengthCm),
            total = n())
iris %>%
  group_by(Species) %>%
  summarise(Number.Of.Samples = n(),
            Mean.Petal.Length = mean(Petal.Length))

#Web scraping in r
str_extract(data1,"card--floating ")
str_extract_all(data1,"card--floating ")
length(str_extract(data1,"div class"))
class(data3)
ftp <- "ftp://cran.r-project.org/pub/R/web/views/"
ftp_files <- getURL(ftp, dirlistonly = TRUE)
ftp_files
filenames <- str_split(ftp_files, "\r\n")[[1]]
filenames
class(filenames)
filenames[1:3]
write.table(filenames,file="path.txt",col.names=F,quote=F)
data<-read.csv(file.choose())

