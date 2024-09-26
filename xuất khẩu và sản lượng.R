# Buoc 1: Cai dat cac thu vien can thiet (neu chua cai)
install.packages("readxl")
install.packages("ggplot2")

# Buoc 2: Tai cac thu vien da cai dat
library(readxl)
library(ggplot2)

# Buoc 3: Doc du lieu tu file Excel
file_path <- "C:/Users/admin/OneDrive/Documents/New folder (3)/OneDrive/Desktop/du an/xuất khẩu và sản lượnng việt nam.xlsx"  # Thay doi thanh duong dan thuc te toi file cua ban
data <- read_excel(file_path)

# Kiem tra cau truc du lieu sau khi doc
print(head(data))

# Buoc 4: Chuan bi du lieu
data$xuatkhau_usd <- as.numeric(gsub(",", "", data[[3]]))  # C???t 3 l� c???t xu???t kh???u USD
data$sanluong_tan <- as.numeric(gsub(",", "", data[[4]]))  # C???t 4 l� c???t s???n lu???ng t???n

# Tao bang rieng cho xuat khau va san luong
data_xuatkhau <- data.frame(Year = data$year, Export_Value = data$xuatkhau_usd)
data_sanluong <- data.frame(Year = data$year, Production = data$sanluong_tan)

# Buoc 5: Ve bieu do gia tri xuat khau
ggplot(data_xuatkhau, aes(x = Year, y = Export_Value / 1e6)) +
  geom_line(color = 'red', size = 1.2) +
  geom_point(size = 3, color = 'red', fill = 'white', shape = 21, stroke = 1) +
  labs(title = 'Gia tri xuat khau ca phe cua Viet Nam (2017-2023)',
       x = 'Nam',
       y = 'Gia tri xuat khau (trieu USD)') +
  scale_y_continuous(labels = scales::comma_format(scale = 1e6)) +  # D???nh d???ng tr???c y
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "lightgrey", linetype = "dashed")
  )

# Buoc 6: Ve bieu do san luong
ggplot(data_sanluong, aes(x = Year, y = Production / 1e3)) +
  geom_line(color = 'blue', size = 1.2) +
  geom_point(size = 3, color = 'blue', fill = 'white', shape = 21, stroke = 1) +
  labs(title = 'San luong ca phe cua Viet Nam (2017-2023)',
       x = 'Nam',
       y = 'San luong (nghin tan)') +
  scale_y_continuous(labels = scales::comma_format(scale = 1e3)) +  # D???nh d???ng tr???c y
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "lightgrey", linetype = "dashed")
  )

