# Buoc 0: Cai dat va tai cac thu vien can thiet
install.packages("ggplot2")  
install.packages("readxl")   
library(ggplot2)
library(readxl)

# Buoc 1: Doc du lieu tu file Excel
data <- read_excel("C:/Users/admin/OneDrive/Documents/New folder (3)/OneDrive/Desktop/du an/gia xuat khau.xlsx")  

# Kiem tra du lieu
print("Du lieu ban dau:")
head(data)

# Buoc 1: Kiem tra phan phoi chuan
shapiro_test_results <- lapply(data[-1], shapiro.test)  # Thuc hien kiem tra Shapiro-Wilk cho cac bien


print("Ket qua kiem tra phan phoi chuan (p-value):")
shapiro_test_results

# Buoc 2: Chuyen doi du lieu sang logarit
log_data <- log(data[-1])  # Chuyen doi tat ca cac bien (tru bien nam) sang logarit

# Them cot nam vao du lieu da chuyen doi
log_data <- cbind(Year = data$Year, log_data)


print("Du lieu sau khi chuyen doi sang logarit:")
head(log_data)


print("Ten cac cot trong log_data:")
print(names(log_data))

# Buoc 3: Xay dung mo hinh hoi quy tuyen tinh
model <- lm(log_data[,2] ~ log_data[,3] + log_data[,4] + log_data[,5])  # S??? d???ng ch??? s??? thay v� t�n c???t


print("Tom tat mo hinh hoi quy:")
summary(model)

# Ve bieu do hoi quy
ggplot(log_data, aes(x = log_data[,3], y = log_data[,2])) +  
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Bieu do hoi quy giua xuat khau ca phe Viet Nam va Brazil",
       x = "Xuat khau ca phe Brazil (log)",
       y = "Xuat khau ca phe Viet Nam (log)")

# Buoc 4: Phan tich he so hoi quy
coefficients <- summary(model)$coefficients  


print("He so hoi quy:")
coefficients

