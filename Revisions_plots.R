
library(ggplot2)
library(scales)

mert.counts.by.site$date<-as.Date(mert.counts.by.site$date)
delph.counts.by.site$date<-as.Date(delph.counts.by.site$date)
pot.counts.by.site$date<-as.Date(pot.counts.by.site$date)

### By plot treatment

#plotting Mertensia flower counts 
ggplot(mert.counts.by.site,aes(x=date,y=number.conspecifics,group=plot.treat)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week",title = "Mertensia Peak Bloom") +
  geom_point(aes(color=plot.treat)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=plot.treat),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-07','2019-07-18')),
               labels = date_format(format = "%W"))

#plotting Delphinium flower counts
ggplot(delph.counts.by.site,aes(x=date,y=number.conspecifics,group=plot.treat)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week", title = "Delphinium Peak Bloom") +
  geom_point(aes(color=plot.treat)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=plot.treat),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-18','2019-07-25')),
               labels = date_format(format = "%W"))

#plotting Potentilla flower counts
ggplot(pot.counts.by.site,aes(x=date,y=number.conspecifics,group=plot.treat)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week", title = "Potentilla Peak Bloom") +
  geom_point(aes(color=plot.treat)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=plot.treat),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-07-11','2019-08-25')),
               labels = date_format(format = "%W"))

#plotting all together

mert.counts.by.site<-mert.counts.by.site %>% mutate(species="Mertensia")
delph.counts.by.site<-delph.counts.by.site%>% mutate(species="Delphinium")
pot.counts.by.site<-pot.counts.by.site %>% mutate(species="Potentilla")
all.spec.bloom<-rbind(mert.counts.by.site,delph.counts.by.site,pot.counts.by.site)


ggplot(all.spec.bloom,aes(x=date,y=number.conspecifics,
                          group=interaction(plot.treat,species),color=species)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week", title = "Peak Bloom by Species") +
  geom_point() +
  scale_color_brewer(palette="Dark2") +
  labs(color="Species",lty="Plot Treatment") +
  geom_smooth(aes(lty=plot.treat),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-04','2019-08-25')),
               labels = date_format(format = "%W"))


### By site

#plotting Mertensia flower counts 
ggplot(mert.counts.by.site,aes(x=date,y=number.conspecifics,group=site)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week",title = "Mertensia Peak Bloom") +
  geom_point(aes(color=plot.treat)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=site),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-07','2019-07-18')),
               labels = date_format(format = "%W"))

#plotting Delphinium flower counts
ggplot(delph.counts.by.site,aes(x=date,y=number.conspecifics,group=site)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week", title = "Delphinium Peak Bloom") +
  geom_point(aes(color=site)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=site),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-18','2019-07-25')),
               labels = date_format(format = "%W"))

#plotting Potentilla flower counts
ggplot(pot.counts.by.site,aes(x=date,y=number.conspecifics,group=site)) +
  theme_classic() +
  labs(y="Floral Abundance",x="Week", title = "Potentilla Peak Bloom") +
  geom_point(aes(color=site)) +
  scale_color_brewer(palette="Dark2") +
  labs(color="Site") +
  geom_smooth(aes(color=site),se=FALSE) +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-07-11','2019-08-25')),
               labels = date_format(format = "%W"))

#plotting all sites/treatments together
#Mertensia
ggplot(mert.counts.by.site,aes(x=date,y=number.conspecifics)) +
  theme_classic() +
  geom_point() +
  geom_smooth(se=FALSE,color="darkgreen") +
  geom_vline(xintercept=as.Date("2019-06-27")) +
  geom_vline(xintercept = as.Date("2019-06-20"),linetype="dotdash") +
  labs(y="Floral Abundance",x="Week", title = "Mertensia Peak Bloom") +
  scale_color_brewer(palette="Dark2") +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-07','2019-07-18')),
               labels = date_format(format = "%W"))
#Delphinium
ggplot(delph.counts.by.site,aes(x=date,y=number.conspecifics)) +
  theme_classic() +
  geom_point() +
  geom_smooth(se=FALSE,color="darkgreen") +
  geom_vline(xintercept=as.Date("2019-07-06")) +
  labs(y="Floral Abundance",x="Week", title = "Delphinium Peak Bloom") +
  scale_color_brewer(palette="Dark2") +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-06-18','2019-07-25')),
               labels = date_format(format = "%W"))
#Potentilla
ggplot(pot.counts.by.site,aes(x=date,y=number.conspecifics)) +
  theme_classic() +
  geom_point() +
  geom_smooth(se=FALSE,color="darkgreen") +
  geom_vline(xintercept=as.Date("2019-08-02")) +
  labs(y="Floral Abundance",x="Week", title = "Potentilla Peak Bloom") +
  scale_color_brewer(palette="Dark2") +
  theme(axis.text.x = element_text(angle = 90))+
  scale_x_date(date_breaks = "1 week",
               limits = as.Date(c('2019-07-11','2019-08-25')),
               labels = date_format(format = "%W"))
  