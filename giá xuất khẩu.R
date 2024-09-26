# Buoc 2: Tai thu vien ggplot2
library(ggplot2)

# Buoc 3: Chuan bi du lieu
coffee_data <- data.frame(
  Year = 2017:2023,
  Vietnam = c(2257, 1917, 1653, 1731, 1965, 2269, 2790),  # Gia xuat khau ca phe Viet Nam (USD/tan)
  Brazil = c(2116, 1957, 1597, 1392, 1718, 2021, 2182),   # Gia xuat khau ca phe Brazil (USD/tan)
  Colombia = c(1522, 1400, 1300, 1250, 1850, 2100, 2150) # Gia xuat khau ca phe Colombia (USD/tan)
)

# Buoc 4: Ve bieu do
ggplot(coffee_data, aes(x = Year)) +
  # Ve duong bieu dien cho tung quoc gia
  geom_line(aes(y = Vietnam, color = 'Vietnam'), linewidth = 1.5) +
  geom_line(aes(y = Brazil, color = 'Brazil'), linewidth = 1.5) +
  geom_line(aes(y = Colombia, color = 'Colombia'), linewidth = 1.5) +
  
  # Them tieu de va cac nhan truc
  labs(title = 'Bieu do So Sanh Gia Xuat Khau Ca Phe (2017-2023)',
       x = 'Nam',
       y = 'Gia xuat khau (USD/tan)') +
  
  # Tuy chinh mau sac cho cac quoc gia
  scale_color_manual(values = c('Vietnam' = 'red', 'Brazil' = 'green', 'Colombia' = 'blue')) +
  
  # Tuy chinh giao dien
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    legend.title = element_blank(),
    legend.position = "bottom"
  )

