
attrition <- read.csv("attrition.csv", stringsAsFactors = T)
str(attrition)
library(polycor)
attrition_corr <- hetcor(attrition)
attrition_corr$correlations %>% 
  melt() %>% 
  ggplot(., aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "grey", high = "darkred") +
  geom_text(aes(Var1, Var2, label = round(value,2)), size = 2)+
  labs(title = "Correlation Matrix", x = "Numeric column", y = "Numeric Column",
       fill = "Coefficient Range") +
  theme(axis.text.x = element_text(vjust = 0.5, angle = 45),
        plot.title = element_text(face = "bold", hjust = 0.5))

attrition %>% 
  count(status) %>% 
  ggplot(., aes(status, n, fill = status)) +
  geom_bar(stat = "identity") +
  ggtitle("Existing staffs vs Exits")

attrition %>% 
  count(dept) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Deparment staff counts",
       x = "Department")
attrition %>% 
  count(status, dept) %>% 
  filter(status == "left") %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("Department with Largest Attrition Number") +
  xlab("Department")


cbind.data.frame(size = attrition %>% 
                   count(dept) %>% 
                   select(n),
                 churn = attrition %>% 
                   count(status, dept) %>% 
                   filter(status == "left") %>% 
                   select(n))

attrition %>% 
  group_by(dept) %>% 
  summarise(n = mean(average_montly_hours)) %>% 
  ggplot(., aes(reorder(dept,n), n, fill = n)) +
  geom_bar(stat = "identity") +
  coord_flip()

attrition %>% 
  group_by(dept) %>% 
  count(salary, sort = T) %>% 
  ggplot(., aes(reorder(dept, n), n, fill = salary)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("Salary range by department")

attrition %>% 
  group_by(dept) %>% 
  count(status) %>% 
  mutate(n2 = sum(n)) %>% 
  mutate(n3 = n/n2) %>% 
  ggplot(., aes(x = "", y = n3, fill = status)) +
  geom_bar(stat = "identity", width = 2) +
  coord_polar(theta = "y") +
  facet_wrap(~dept) +
  scale_fill_manual(values=c("#999999", "#E69F00"))

attrition %>% 
  group_by(number_project) %>% 
  count(status) %>% 
  ggplot(., aes(factor(number_project), n, fill = status)) +
  geom_bar(stat = "identity")attrition %>% 
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

