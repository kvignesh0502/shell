#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

echo " $TIMESTAMP " 

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " Error: $2... is $R failed $N "
        exit 1
    else 
        echo -e " $2... $G Success $N "
    fi

}

if [ $ID -ne 0 ]
then
    echo " ERROR : login with root user to run the script "
    exit 1
else
    echo -e " you are $G Root user $N "
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "MySQL installed"

yum install git -y &>> $LOGFILE 

VALIDATE $? "Git Installed "
