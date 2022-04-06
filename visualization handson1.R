library("dplyr")
library("tidyr")
FakeNews$StoryType = "fake"
FakeNews
select(FakeNews, -c("when"))
FakeNews1 <- separate(FakeNews,url,c("website","domain"), sep = "/")
FakeNews1 <-unite(FakeNews1, website,domain, sep="/")
FakeNews2 <-FakeNews1[:10]