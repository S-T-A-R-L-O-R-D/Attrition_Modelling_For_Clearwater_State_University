catbin<-data%>%count(RETURNED_2ND_YR,levels=DEGREE_GROUP_DESC)%>%filter(RETURNED_2ND_YR==1)
catbin$N<-unclass(data%>%filter(DEGREE_GROUP_DESC%in%catbin$levels)%>%count(DEGREE_GROUP_DESC))[[2]]
catbin$percentage<-catbin$n/catbin$N
catbin$varNames<-rep("DEGREE_GROUP_DESC",nrow(catbin))
write.csv(catbin,file="categorical variable profiles/DEGREE_GROUP_DESC.csv")