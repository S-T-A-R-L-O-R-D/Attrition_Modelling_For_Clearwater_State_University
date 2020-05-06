data_prep<-data%>%mutate(rank=ntile(HIGH_SCHL_GPA,10))%>%count(RETURNED_2ND_YR,rank)%>%filter(RETURNED_2ND_YR==1)
data_prep$N<-unclass(data%>%mutate(rank=ntile(HIGH_SCHL_GPA,10))%>%count(rank)%>%unname())[[2]]
data_prep$percent<-data_prep$n/data_prep$N
data_prep$greater_than<-unclass(data%>%mutate(rank=ntile(HIGH_SCHL_GPA,10))%>%group_by(rank)%>%summarise(min(HIGH_SCHL_GPA))%>%unname())[[2]]
data_prep$less_than<-unclass(data%>%mutate(rank=ntile(HIGH_SCHL_GPA,10))%>%group_by(rank)%>%summarise(max(HIGH_SCHL_GPA))%>%unname())[[2]]
data_prep$var_name<-rep("HIGH_SCHL_GPA",nrow(data_prep))
write.csv(data_prep,"HIGH_SCHL_GPA.csv",row.names=FALSE)