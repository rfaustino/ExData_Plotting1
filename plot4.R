
    #read the data from file saved in working directory
    data_file <- read.table("household_power_consumption.txt", sep=";", header=TRUE) 
    data <- data_file
    
    # Cleaning the data frame
    
    #Var "Time": converting to Date/Time class
    data$Time <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y%H:%M:%S")  
  
    #Var "Date": converting to Date class
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    #subsetting for the dates 2007-02-01 and 2007-02-02
    data <- subset(data, data$Date == as.Date('2007-02-01') | data$Date == as.Date('2007-02-02') ) 
    
    #Var "Global_active_power": replacing "?" with NA and converting to numeric
    data$Global_active_power <- gsub("?", "NA", data$Global_active_power, fixed=TRUE)
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    #Var "Global_reactive_power": replacing "?" with NA and converting to numeric
    data$Global_reactive_power <- gsub("?", "NA", data$Global_reactive_power, fixed=TRUE)
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
    
    #Var "Voltage": replacing "?" with NA and converting to numeric
    data$Voltage <- gsub("?", "NA", data$Voltage, fixed=TRUE)
    data$Voltage <- as.numeric(data$Voltage)
    
    #Var "Global_intensity": replacing "?" with NA and converting to numeric
    data$Global_intensity <- gsub("?", "NA", data$Global_intensity, fixed=TRUE)
    data$Global_intensity <- as.numeric(data$Global_intensity)
    
    #Var "Sub_metering_1": replacing "?" with NA and converting to numeric
    data$Sub_metering_1 <- gsub("?", "NA", data$Sub_metering_1, fixed=TRUE)
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    
    #Var "Sub_metering_2": replacing "?" with NA and converting to numeric
    data$Sub_metering_2 <- gsub("?", "NA", data$Sub_metering_2, fixed=TRUE)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    
    #Var "Sub_metering_3": replacing "?" with NA and converting to numeric
    data$Sub_metering_3 <- gsub("?", "NA", data$Sub_metering_3, fixed=TRUE)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    
    
    # Creating the desired plot
    png(filename="plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2,2))
    
    with(data, {
      #top left plot
      plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
      
      #top right plot
      plot(data$Time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
      
      #bottom left plot
      plot (data$Time, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
      points (data$Time, data$Sub_metering_2, type = "l", col = "red")
      points (data$Time, data$Sub_metering_3, type = "l", col = "blue")
      legend ("topright", pt.cex=0.9, cex=0.9, bty="n", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      #bottom right plot
      plot(data$Time, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
 
    })
    
    dev.off()


                                  
                                