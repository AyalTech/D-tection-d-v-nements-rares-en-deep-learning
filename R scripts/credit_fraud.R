
faud <- read.csv("faud.csv", stringsAsFactors = T)
str(faud)
library(polycor)
faud_corr <- hetcor(faud)
faud_corr$correlations %>% 
  melt() %>% 
  ggplot(., aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "grey", high = "darkred") +
  geom_text(aes(Var1, Var2, label = round(value,2)), size = 2)+
  labs(title = "Correlation Matrix", x = "Numeric column", y = "Numeric Column",
       fill = "Coefficient Range") +
  theme(axis.text.x = element_text(vjust = 0.5, angle = 45),
        plot.title = element_text(face = "bold", hjust = 0.5))

faud %>% 
  count(status) %>% 
  ggplot(., aes(status, n, fill = status)) +
  geom_bar(stat = "identity") +
  
  
  faud %>% 
  count(dept) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  
  faud %>% 
  count(status, dept) %>% 
  filter(status == "left") %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  
  
  
  cbind.data.frame(size = faud %>% 
                     count(dept) %>% 
                     select(n),
                   churn = faud %>% 
                     count(status, dept) %>% 
                     filter(status == "left") %>% 
                     select(n))

faud %>% 
  group_by(dept) %>% 
  summarise(n = mean(average_montly_hours)) %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip()

faud %>% 
  group_by(dept) %>% 
  count(salary, sort = T) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = salary)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  
  
  faud %>% 
  group_by(dept) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~dept) +
  scale_fill_manual(values=c("#999999", "#E69F00"))

faud %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  ggplot(., aes(factor(number_project), n, fill = status)) +
  geom_bar(stat = "identity")faud %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  ungroup() %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~number_project) +
  scale_fill_manual(values=c("#999999", "#E69F00"))

