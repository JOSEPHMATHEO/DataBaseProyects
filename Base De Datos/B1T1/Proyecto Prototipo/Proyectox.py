import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="#23@luis2020",
    database="Northwind"

)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM Customers ")

myresult = mycursor.fetchall()

for x in myresult:
    print(x)