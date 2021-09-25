
bank_marketing <- read.csv("bank_marketing.csv", stringsAsFactors = T)
str(bank_marketing)
library(polycor)
bank_marketing_corr <- hetcor(bank_marketing)
bank_marketing_corr$correlations %>% 
  melt() %>% 
  ggplot(., aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "grey", high = "darkred") +
  geom_text(aes(Var1, Var2, label = round(value,2)), size = 2)+
  labs(title = "Correlation Matrix", x = "Numeric column", y = "Numeric Column",
       fill = "Coefficient Range") +
  theme(axis.text.x = element_text(vjust = 0.5, angle = 45),
        plot.title = element_text(face = "bold", hjust = 0.5))

bank_marketing %>% 
  count(status) %>% 
  ggplot(., aes(status, n, fill = status)) +
  geom_bar(stat = "identity") +


bank_marketing %>% 
  count(dept) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +

bank_marketing %>% 
  count(status, dept) %>% 
  filter(status == "left") %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +



cbind.data.frame(size = bank_marketing %>% 
                   count(dept) %>% 
                   select(n),
                 churn = bank_marketing %>% 
                   count(status, dept) %>% 
                   filter(status == "left") %>% 
                   select(n))

bank_marketing %>% 
  group_by(dept) %>% 
  summarise(n = mean(average_montly_hours)) %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip()

bank_marketing %>% 
  group_by(dept) %>% 
  count(salary, sort = T) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = salary)) +
  geom_bar(stat = "identity") +
  coord_flip() +


bank_marketing %>% 
  group_by(dept) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~dept) +
  scale_fill_manual(values=c("#999999", "#E69F00"))

bank_marketing %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  ggplot(., aes(factor(number_project), n, fill = status)) +
  geom_bar(stat = "identity")bank_marketing %>% 
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

