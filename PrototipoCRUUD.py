import mysql.connector
from prettytable import PrettyTable


mydb = mysql.connector.connect(

    host="localhost",
    user="root",
    password="#23@luis2002",
    database="Northwind"

)

mycursor = mydb.cursor()

print("--------- DataBase NorthWind ---------")
flag = True

while(flag):

    opcion = int( input("\n  --- Entities Data List ---\n"
                   "    Tablenames            Records\n"                   
                   "[1] Customers                  91\n"
                   "[2] Categories                  8\n"
                   "[3] Employees                   9\n"
                   "[4] OrderDetails	         2155\n"
                   "[5] Orders	                  830\n"
                   "[6] Products	               77\n"
                   "[7] Shippers	                3\n"
                   "[8] Suppliers	               29\n"
                   "[9] Exit Program                 \n"
                   "Choose an option: "))

    print(" ")

    if (opcion == 1):

        mycursor.execute("SELECT * FROM Customers ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["CustomerID", "CustomerName", "ContactName", "Address", "City", "PostalCode", "Country"])

        for (CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country) in myresult:
            table.add_row([CustomerID,CustomerName,ContactName,Address,City,PostalCode,Country])
        print(table)

    elif (opcion == 2):

        mycursor.execute("SELECT * FROM Categories ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["CategoryID","CategoryName","Description"])

        for (CategoryID, CategoryName, Description) in myresult:
            table.add_row([CategoryID, CategoryName,Description])
        print(table)


    elif (opcion == 3):

        mycursor.execute("SELECT * FROM Employees ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["EmployeeID", "LastName", "FirstName",	"BirthDate", "Photo", "Notes"])

        for (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes) in myresult:
            table.add_row([EmployeeID, LastName, FirstName, BirthDate, Photo, Notes])
        print(table)

    elif (opcion == 4):

        mycursor.execute("SELECT * FROM OrderDetails ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["OrderDetailID", "OrderID", "ProductID", "Quantity"])

        for (OrderDetailID, OrderID, ProductID, Quantity) in myresult:
            table.add_row([OrderDetailID,OrderID, ProductID, Quantity])
        print(table)

    elif (opcion == 5):

        mycursor.execute("SELECT * FROM Orders ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["OrderID", "CustomerID", "EmployeeID", "OrderDate", "ShipperID"])

        for (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) in myresult:
            table.add_row([OrderID, CustomerID, EmployeeID, OrderDate, ShipperID])
        print(table)

    elif (opcion == 6):

        mycursor.execute("SELECT * FROM Products ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["ProductID", "ProductName", "SupplierID", "CategoryID", "Unit", "Price"])

        for (ProductID, ProductName, SupplierID, CategoryID, Unit, Price) in myresult:
            table.add_row([ProductID, ProductName, SupplierID, CategoryID, Unit, Price])
        print(table)

    elif (opcion == 7):

        mycursor.execute("SELECT * FROM Shippers ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["ShipperID" ,"ShipperName", "Phone"])

        for (ShipperID, ShipperName, Phone) in myresult:
            table.add_row([ShipperID, ShipperName, Phone])
        print(table)


    elif (opcion == 8):

        mycursor.execute("SELECT * FROM Suppliers ")

        myresult = mycursor.fetchall()

        table = PrettyTable(["SupplierID", "SupplierName", "ContactName", "Address", "City", "PostalCode",
                             "Country", "Phone"])

        for (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone) in myresult:
            table.add_row([SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone])
        print(table)

    elif (opcion == 9):

        print("Salienod del programa...")

        flag = False


    else:

        print("Error seleccione una opcion valida ")
