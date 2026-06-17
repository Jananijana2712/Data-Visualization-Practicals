library("rgl")
placement <- read.csv('C:\\Users\\Janani\\Desktop\\Janani\\PG Books\\Visualization\\Practical\\Placement.csv')
ssc <- placement$ssc_p
hsc <- placement$hsc_p
degree <- placement$degree_p
surface_grid <- expand.grid(ssc=seq(min(ssc), max(ssc), length.out=100),hsc=seq(min(hsc), max(hsc), length.out=100))
fit <- lm(degree ~ ssc * hsc, data=placement)
surface_grid$degree <- predict(fit, newdata=surface_grid)
z <- matrix(surface_grid$degree, nrow=100, ncol=100)
surface3d(seq(min(ssc), max(ssc), length.out=100),seq(min(hsc), max(hsc), length.out=100), z, col="lightblue", alpha=0.5)
points3d(ssc, hsc, degree, col="red", size=3)
axes3d(edges = "bbox", col="black")
title3d("3D Surface Plot with SSC, HSC, and Degree Percentages",xlab="SSC Percentage", ylab="HSC Percentage", zlab="Degree Percentage")
