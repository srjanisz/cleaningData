library(reshape)

testdata<-read.table("dataset/test//X_test.txt")
traindata<-read.table("dataset/train//X_train.txt")
data<-rbind(testdata,traindata)

testlabels<-read.table("dataset/test//y_test.txt")
trainlabels<-read.table("dataset/train//y_train.txt")
labels<-rbind(testlabels,trainlabels)

labels$V1<-factor(labels$V1,labels=c("Walking","Walking_Upstairs",
            "Walking_Downstairs","Sitting","Standing","Laying"))
colnames(labels)<-c("Activity")

testsubjects<-read.table("dataset/test/subject_test.txt")
trainsubjects<-read.table("dataset/train/subject_train.txt")
subjects<-rbind(testsubjects,trainsubjects)
colnames(subjects)<-c("Subject")

mean_std_cols<-c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,
                83,84,85,86,121,122,123,124,125,126,161,
                162,163,164,165,166,201,202,214,215,227,
                228,240,241,253,254,266,267,268,269,270,
                271,345,346,347,348,349,350,424,425,426,
                427,428,429,503,504,516,517,529,530,542,
                543)

subset<-data[,mean_std_cols]

col_names<-read.table("dataset/features.txt")
cols<-col_names[mean_std_cols,2]
colnames(subset)<-cols

label_data<-cbind(subjects,labels,subset)

tmp<-melt(test,id.vars=c("Subject","activity"))
cast(Subject+variable~activity, data=tmp,fun=mean)
tidy_data<-cast(Subject+activity~variable, data=tmp,fun=mean)

write.table(tidy_data,file="tidyoutput.txt",row.name=FALSE)