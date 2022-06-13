GDP <- read_excel("C:/Users/LENOVO/Downloads/GDP_VN.xlsx")
View(GDP)
#Vẽ biểu đồ
#plot
GDP$Năm
plot(GDP$Năm,GDP$GDP.per.capita.local)
plot(GDP$Năm,GDP$GDP.per.capita.USD)
plot(GDP$Năm,GDP$GCF)
plot(GDP$Năm,GDP$FC)
plot(GDP$Năm,GDP$NEGS)
#boxplot
boxplot(GDP,col=rainbow(7))
#barplot
barplot(GDP~Năm,data=GDP)
barplot(GDP.per.capita.local~Năm,data=GDP)
barplot(GDP.per.capita.USD~Năm,data=GDP)
barplot(GCF~Năm,data=GDP)
barplot(FC~Năm,data=GDP)
barplot(NEGS~Năm,data=GDP)
##-> biểu đồ của các cột dữ liệu qua từng năm tương đối cân bằng nhau, không mấy có sự khác biệt 
#biểu đồ hồi quy tuyến tính 
plot(GDP$Năm,GDP$GDP.per.capita.local)
lines(GDP$Năm,fitted(lm(GDP.per.capita.local~Năm,data = GDP)))
#pairsplot
pairs(GDP)
##mô tả quan hệ tương quan giữa các dữ liệu, các dữ liệu đều có mối quan hệ tuyến tính 
#biểu đồ nhiệt 
#install.packages("pheatmap")
library(pheatmap)
pheatmap(cor(GDP), main="Correlation Heatmap GDP Viet Nam", cluster_cols=F, cluster_rows=F)
##-> màu sẫm thể hiện tiêu cực, màu xanh là tích cực. Màu càng đậm thì cường độ tương quan càng lớn 
#biểu đồ thanh ghép nằm ngang 
barplot(cbind(GDP.per.capita.local, GDP.per.capita.USD, GCF, FC, NEGS) ~ Năm, GDP[14:15,], beside = TRUE, horiz=TRUE, col = rainbow(5))
legend("bottomright" ,c("GDP.per.capita.local", "GDP.per.capita.USD", "GCF", "FC","NEGS"), fill = rainbow(5))
#biểu đồ thanh chồng 
barplot(cbind(GDP.per.capita.local, GDP.per.capita.USD) ~ Năm, GDP, col = c("lightblue","lightgreen"), main = "GDP per cap")
legend("topleft", c("Gross domestic product per cap (Thousand VND)", "Gross domestic product per cap at foreign currency (USD)"), fill = c("lightblue","lightgreen"), cex = 0.85)
#biểu đồ tròn 
pie(GDP$GDP, labels = GDP$Năm, col = rainbow(15), main = "Tổng sản phẩm trong nước theo giá thực tế từ 2000 - 2015")
pie(GDP$GDP.per.capita.local, labels = GDP$Năm, col = rainbow(15), main = "Tổng sản phẩm trong nước bình quân đầu người theo giá thực tế từ 2000 - 2015")
pie(GDP$GDP.per.capita.USD, labels = GDP$Năm, col = rainbow(15), main = " Tổng sản phẩm trong nước bình quân đầu người theo giá thực tế từ 2000 - 2015")
pie(GDP$GCF, labels = GDP$Năm, col = rainbow(15), main = "Tích lũy tài sản theo giá thực tế từ 2000 - 2015")
pie(GDP$FC, labels = GDP$Năm, col = rainbow(15), main = "Tiêu dùng cuối cùng theo giá thực tế từ 2000 - 2015")
pie(GDP$NEGS, labels = GDP$Năm, col = rainbow(15), main = "Xuất khẩu hàng hóa và dịch vụ theo giá thực tế từ 2000 - 2015")
