CREATE DATABASE IF NOT EXISTS Base;
USE Base;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Suppliers;

START TRANSACTION;

CREATE TABLE Categories
(      
    CategoryID INTEGER PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(25),
    Description VARCHAR(255)
);

CREATE TABLE Customers
(      
    CustomerID INTEGER PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(20),
    PostalCode VARCHAR(10),
    Country VARCHAR(15)
);

CREATE TABLE Employees
(
    EmployeeID INTEGER PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(15),
    FirstName VARCHAR(15),
    BirthDate DATETIME,
    Photo VARCHAR(25),
    Notes VARCHAR(1024)
);

CREATE TABLE Shippers(
    ShipperID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ShipperName VARCHAR(25),
    Phone VARCHAR(15)
);

CREATE TABLE Suppliers(
    SupplierID INTEGER PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(20),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(15)
);

CREATE TABLE Products(
    ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50),
    SupplierID INTEGER,
    CategoryID INTEGER,
    Unit VARCHAR(25),
    Price NUMERIC,
	FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);

CREATE TABLE Orders(
    OrderID INTEGER PRIMARY KEY AUTO_INCREMENT,
    CustomerID INTEGER,
    EmployeeID INTEGER,
    OrderDate DATETIME,
    ShipperID INTEGER,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);

CREATE TABLE OrderDetails(
    OrderDetailID INTEGER PRIMARY KEY AUTO_INCREMENT,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
	FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

INSERT INTO Categories VALUES(1,'Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT INTO Categories VALUES(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO Categories VALUES(3,'Confections','Desserts, candies, and sweet breads');
INSERT INTO Categories VALUES(4,'Dairy Products','Cheeses');
INSERT INTO Categories VALUES(5,'Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT INTO Categories VALUES(6,'Meat/Poultry','Prepared meats');
INSERT INTO Categories VALUES(7,'Produce','Dried fruit and bean curd');
INSERT INTO Categories VALUES(8,'Seafood','Seaweed and fish');

INSERT INTO Customers VALUES(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany');
INSERT INTO Customers VALUES(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','5021','Mexico');
INSERT INTO Customers VALUES(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','5023','Mexico');
INSERT INTO Customers VALUES(4,'Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP','UK');
INSERT INTO Customers VALUES(5,'Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','S-958 22','Sweden');
INSERT INTO Customers VALUES(6,'Blauer See Delikatessen','Hanna Moos','Forsterstr. 57','Mannheim','68306','Germany');
INSERT INTO Customers VALUES(7,'Blondel père et fils','Frédérique Citeaux','24, place Kléber','Strasbourg','67000','France');
INSERT INTO Customers VALUES(8,'Bólido Comidas preparadas','Martín Sommer','C/ Araquil, 67','Madrid','28023','Spain');
INSERT INTO Customers VALUES(9,'Bon app''''','Laurence Lebihans','12, rue des Bouchers','Marseille','13008','France');
INSERT INTO Customers VALUES(10,'Bottom-Dollar Marketse','Elizabeth Lincoln','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada');
INSERT INTO Customers VALUES(11,'B''''s Beverages','Victoria Ashworth','Fauntleroy Circus','London','EC2 5NT','UK');
INSERT INTO Customers VALUES(12,'Cactus Comidas para llevar','Patricio Simpson','Cerrito 333','Buenos Aires','1010','Argentina');
INSERT INTO Customers VALUES(13,'Centro comercial Moctezuma','Francisco Chang','Sierras de Granada 9993','México D.F.','5022','Mexico');
INSERT INTO Customers VALUES(14,'Chop-suey Chinese','Yang Wang','Hauptstr. 29','Bern','3012','Switzerland');
INSERT INTO Customers VALUES(15,'Comércio Mineiro','Pedro Afonso','Av. dos Lusíadas, 23','São Paulo','05432-043','Brazil');
INSERT INTO Customers VALUES(16,'Consolidated Holdings','Elizabeth Brown','Berkeley Gardens 12 Brewery','London','WX1 6LT','UK');
INSERT INTO Customers VALUES(17,'Drachenblut Delikatessend','Sven Ottlieb','Walserweg 21','Aachen','52066','Germany');
INSERT INTO Customers VALUES(18,'Du monde entier','Janine Labrune','67, rue des Cinquante Otages','Nantes','44000','France');
INSERT INTO Customers VALUES(19,'Eastern Connection','Ann Devon','35 King George','London','WX3 6FW','UK');
INSERT INTO Customers VALUES(20,'Ernst Handel','Roland Mendel','Kirchgasse 6','Graz','8010','Austria');
INSERT INTO Customers VALUES(21,'Familia Arquibaldo','Aria Cruz','Rua Orós, 92','São Paulo','05442-030','Brazil');
INSERT INTO Customers VALUES(22,'FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','C/ Moralzarzal, 86','Madrid','28034','Spain');
INSERT INTO Customers VALUES(23,'Folies gourmandes','Martine Rancé','184, chaussée de Tournai','Lille','59000','France');
INSERT INTO Customers VALUES(24,'Folk och fä HB','Maria Larsson','Åkergatan 24','Bräcke','S-844 67','Sweden');
INSERT INTO Customers VALUES(25,'Frankenversand','Peter Franken','Berliner Platz 43','München','80805','Germany');
INSERT INTO Customers VALUES(26,'France restauration','Carine Schmitt','54, rue Royale','Nantes','44000','France');
INSERT INTO Customers VALUES(27,'Franchi S.p.A.','Paolo Accorti','Via Monte Bianco 34','Torino','10100','Italy');
INSERT INTO Customers VALUES(28,'Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Jardim das rosas n. 32','Lisboa','1675','Portugal');
INSERT INTO Customers VALUES(29,'Galería del gastrónomo','Eduardo Saavedra','Rambla de Cataluña, 23','Barcelona','8022','Spain');
INSERT INTO Customers VALUES(30,'Godos Cocina Típica','José Pedro Freyre','C/ Romero, 33','Sevilla','41101','Spain');
INSERT INTO Customers VALUES(31,'Gourmet Lanchonetes','André Fonseca','Av. Brasil, 442','Campinas','04876-786','Brazil');
INSERT INTO Customers VALUES(32,'Great Lakes Food Market','Howard Snyder','2732 Baker Blvd.','Eugene','97403','USA');
INSERT INTO Customers VALUES(33,'GROSELLA-Restaurante','Manuel Pereira','5ª Ave. Los Palos Grandes','Caracas','1081','Venezuela');
INSERT INTO Customers VALUES(34,'Hanari Carnes','Mario Pontes','Rua do Paço, 67','Rio de Janeiro','05454-876','Brazil');
INSERT INTO Customers VALUES(35,'HILARIÓN-Abastos','Carlos Hernández','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','5022','Venezuela');
INSERT INTO Customers VALUES(36,'Hungry Coyote Import Store','Yoshi Latimer','City Center Plaza 516 Main St.','Elgin','97827','USA');
INSERT INTO Customers VALUES(37,'Hungry Owl All-Night Grocers','Patricia McKenna','8 Johnstown Road','Cork','','Ireland');
INSERT INTO Customers VALUES(38,'Island Trading','Helen Bennett','Garden House Crowther Way','Cowes','PO31 7PJ','UK');
INSERT INTO Customers VALUES(39,'Königlich Essen','Philip Cramer','Maubelstr. 90','Brandenburg','14776','Germany');
INSERT INTO Customers VALUES(40,'La corne d''''abondance','Daniel Tonini','67, avenue de l''''Europe','Versailles','78000','France');
INSERT INTO Customers VALUES(41,'La maison d''''Asie','Annette Roulet','1 rue Alsace-Lorraine','Toulouse','31000','France');
INSERT INTO Customers VALUES(42,'Laughing Bacchus Wine Cellars','Yoshi Tannamuri','1900 Oak St.','Vancouver','V3F 2K1','Canada');
INSERT INTO Customers VALUES(43,'Lazy K Kountry Store','John Steel','12 Orchestra Terrace','Walla Walla','99362','USA');
INSERT INTO Customers VALUES(44,'Lehmanns Marktstand','Renate Messner','Magazinweg 7','Frankfurt a.M.','60528','Germany');
INSERT INTO Customers VALUES(45,'Let''''s Stop N Shop','Jaime Yorres','87 Polk St. Suite 5','San Francisco','94117','USA');
INSERT INTO Customers VALUES(46,'LILA-Supermercado','Carlos González','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','3508','Venezuela');
INSERT INTO Customers VALUES(47,'LINO-Delicateses','Felipe Izquierdo','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela');
INSERT INTO Customers VALUES(48,'Lonesome Pine Restaurant','Fran Wilson','89 Chiaroscuro Rd.','Portland','97219','USA');
INSERT INTO Customers VALUES(49,'Magazzini Alimentari Riuniti','Giovanni Rovelli','Via Ludovico il Moro 22','Bergamo','24100','Italy');
INSERT INTO Customers VALUES(50,'Maison Dewey','Catherine Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgium');
INSERT INTO Customers VALUES(51,'Mère Paillarde','Jean Fresnière','43 rue St. Laurent','Montréal','H1J 1C3','Canada');
INSERT INTO Customers VALUES(52,'Morgenstern Gesundkost','Alexander Feuer','Heerstr. 22','Leipzig','4179','Germany');
INSERT INTO Customers VALUES(53,'North/South','Simon Crowther','South House 300 Queensbridge','London','SW7 1RZ','UK');
INSERT INTO Customers VALUES(54,'Océano Atlántico Ltda.','Yvonne Moncada','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','1010','Argentina');
INSERT INTO Customers VALUES(55,'Old World Delicatessen','Rene Phillips','2743 Bering St.','Anchorage','99508','USA');
INSERT INTO Customers VALUES(56,'Ottilies Käseladen','Henriette Pfalzheim','Mehrheimerstr. 369','Köln','50739','Germany');
INSERT INTO Customers VALUES(57,'Paris spécialités','Marie Bertrand','265, boulevard Charonne','Paris','75012','France');
INSERT INTO Customers VALUES(58,'Pericles Comidas clásicas','Guillermo Fernández','Calle Dr. Jorge Cash 321','México D.F.','5033','Mexico');
INSERT INTO Customers VALUES(59,'Piccolo und mehr','Georg Pipps','Geislweg 14','Salzburg','5020','Austria');
INSERT INTO Customers VALUES(60,'Princesa Isabel Vinhoss','Isabel de Castro','Estrada da saúde n. 58','Lisboa','1756','Portugal');
INSERT INTO Customers VALUES(61,'Que Delícia','Bernardo Batista','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brazil');
INSERT INTO Customers VALUES(62,'Queen Cozinha','Lúcia Carvalho','Alameda dos Canàrios, 891','São Paulo','05487-020','Brazil');
INSERT INTO Customers VALUES(63,'QUICK-Stop','Horst Kloss','Taucherstraße 10','Cunewalde','1307','Germany');
INSERT INTO Customers VALUES(64,'Rancho grande','Sergio Gutiérrez','Av. del Libertador 900','Buenos Aires','1010','Argentina');
INSERT INTO Customers VALUES(65,'Rattlesnake Canyon Grocery','Paula Wilson','2817 Milton Dr.','Albuquerque','87110','USA');
INSERT INTO Customers VALUES(66,'Reggiani Caseifici','Maurizio Moroni','Strada Provinciale 124','Reggio Emilia','42100','Italy');
INSERT INTO Customers VALUES(67,'Ricardo Adocicados','Janete Limeira','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brazil');
INSERT INTO Customers VALUES(68,'Richter Supermarkt','Michael Holz','Grenzacherweg 237','Genève','1203','Switzerland');
INSERT INTO Customers VALUES(69,'Romero y tomillo','Alejandra Camino','Gran Vía, 1','Madrid','28001','Spain');
INSERT INTO Customers VALUES(70,'Santé Gourmet','Jonas Bergulfsen','Erling Skakkes gate 78','Stavern','4110','Norway');
INSERT INTO Customers VALUES(71,'Save-a-lot Markets','Jose Pavarotti','187 Suffolk Ln.','Boise','83720','USA');
INSERT INTO Customers VALUES(72,'Seven Seas Imports','Hari Kumar','90 Wadhurst Rd.','London','OX15 4NB','UK');
INSERT INTO Customers VALUES(73,'Simons bistro','Jytte Petersen','Vinbæltet 34','København','1734','Denmark');
INSERT INTO Customers VALUES(74,'Spécialités du monde','Dominique Perrier','25, rue Lauriston','Paris','75016','France');
INSERT INTO Customers VALUES(75,'Split Rail Beer & Ale','Art Braunschweiger','P.O. Box 555','Lander','82520','USA');
INSERT INTO Customers VALUES(76,'Suprêmes délices','Pascale Cartrain','Boulevard Tirou, 255','Charleroi','B-6000','Belgium');
INSERT INTO Customers VALUES(77,'The Big Cheese','Liz Nixon','89 Jefferson Way Suite 2','Portland','97201','USA');
INSERT INTO Customers VALUES(78,'The Cracker Box','Liu Wong','55 Grizzly Peak Rd.','Butte','59801','USA');
INSERT INTO Customers VALUES(79,'Toms Spezialitäten','Karin Josephs','Luisenstr. 48','Münster','44087','Germany');
INSERT INTO Customers VALUES(80,'Tortuga Restaurante','Miguel Angel Paolino','Avda. Azteca 123','México D.F.','5033','Mexico');
INSERT INTO Customers VALUES(81,'Tradição Hipermercados','Anabela Domingues','Av. Inês de Castro, 414','São Paulo','05634-030','Brazil');
INSERT INTO Customers VALUES(82,'Trail''''s Head Gourmet Provisioners','Helvetius Nagy','722 DaVinci Blvd.','Kirkland','98034','USA');
INSERT INTO Customers VALUES(83,'Vaffeljernet','Palle Ibsen','Smagsløget 45','Århus','8200','Denmark');
INSERT INTO Customers VALUES(84,'Victuailles en stock','Mary Saveley','2, rue du Commerce','Lyon','69004','France');
INSERT INTO Customers VALUES(85,'Vins et alcools Chevalier','Paul Henriot','59 rue de l''''Abbaye','Reims','51100','France');
INSERT INTO Customers VALUES(86,'Die Wandernde Kuh','Rita Müller','Adenauerallee 900','Stuttgart','70563','Germany');
INSERT INTO Customers VALUES(87,'Wartian Herkku','Pirkko Koskitalo','Torikatu 38','Oulu','90110','Finland');
INSERT INTO Customers VALUES(88,'Wellington Importadora','Paula Parente','Rua do Mercado, 12','Resende','08737-363','Brazil');
INSERT INTO Customers VALUES(89,'White Clover Markets','Karl Jablonski','305 - 14th Ave. S. Suite 3B','Seattle','98128','USA');
INSERT INTO Customers VALUES(90,'Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland');
INSERT INTO Customers VALUES(91,'Wolski','Zbyszek','ul. Filtrowa 68','Walla','01-012','Poland');

INSERT INTO Employees VALUES(1,'Davolio','Nancy','1968-12-08','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''.');
INSERT INTO Employees VALUES(2,'Fuller','Andrew','1952-02-19','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.');
INSERT INTO Employees VALUES(3,'Leverling','Janet','1963-08-30','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.');
INSERT INTO Employees VALUES(4,'Peacock','Margaret','1958-09-19','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.');
INSERT INTO Employees VALUES(5,'Buchanan','Steven','1955-03-04','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French.');
INSERT INTO Employees VALUES(6,'Suyama','Michael','1963-07-02','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.');
INSERT INTO Employees VALUES(7,'King','Robert','1960-05-29','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office.');
INSERT INTO Employees VALUES(8,'Callahan','Laura','1958-01-09','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.');
INSERT INTO Employees VALUES(9,'Dodsworth','Anne','1969-07-02','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.');
;

INSERT INTO Shippers VALUES(1, 'Speedy Express', '(503) 555-9831');
INSERT INTO Shippers VALUES(2, 'United Package', '(503) 555-3199');
INSERT INTO Shippers VALUES(3, 'Federal Shipping', '(503) 555-9931');

INSERT INTO Suppliers VALUES(1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','Londona','EC1 4SD','UK','(171) 555-2222');
INSERT INTO Suppliers VALUES(2,'New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822');
INSERT INTO Suppliers VALUES(3,'Grandma Kelly''s Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735');
INSERT INTO Suppliers VALUES(4,'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011');
INSERT INTO Suppliers VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain','(98) 598 76 54');
INSERT INTO Suppliers VALUES(6,'Mayumi''s','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan','(06) 431-7877');
INSERT INTO Suppliers VALUES(7,'Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia','(03) 444-2343');
INSERT INTO Suppliers VALUES(8,'Specialty Biscuits, Ltd.','Peter Wilson','29 King''s Way','Manchester','M14 GSD','UK','(161) 555-4448');
INSERT INTO Suppliers VALUES(9,'PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Göteborg','S-345 67','Sweden','031-987 65 43');
INSERT INTO Suppliers VALUES(10,'Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','São Paulo','5442','Brazil','(11) 555 4640');
INSERT INTO Suppliers VALUES(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany','(010) 9984510');
INSERT INTO Suppliers VALUES(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany','(069) 992755');
INSERT INTO Suppliers VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany','(04721) 8713');
INSERT INTO Suppliers VALUES(14,'Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy','(0544) 60323');
INSERT INTO Suppliers VALUES(15,'Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway','(0)2-953010');
INSERT INTO Suppliers VALUES(16,'Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA','(503) 555-9931');
INSERT INTO Suppliers VALUES(17,'Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden','08-123 45 67');
INSERT INTO Suppliers VALUES(18,'Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France','(1) 03.83.00.68');
INSERT INTO Suppliers VALUES(19,'New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','2134','USA','(617) 555-3267');
INSERT INTO Suppliers VALUES(20,'Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','512','Singapore','555-8787');
INSERT INTO Suppliers VALUES(21,'Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark','43844108');
INSERT INTO Suppliers VALUES(22,'Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands','(12345) 1212');
INSERT INTO Suppliers VALUES(23,'Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland','(953) 10956');
INSERT INTO Suppliers VALUES(24,'G''day, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunter''s Hill','Sydney','2042','Australia','(02) 555-5914');
INSERT INTO Suppliers VALUES(25,'Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montréal','H1J 1C3','Canada','(514) 555-9022');
INSERT INTO Suppliers VALUES(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy','(089) 6547665');
INSERT INTO Suppliers VALUES(27,'Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France','85.57.00.07');
INSERT INTO Suppliers VALUES(28,'Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France','38.76.98.06');
INSERT INTO Suppliers VALUES(29,'Forêts d''érables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955');

INSERT INTO Products VALUES(1,'Chais',1,1,'10 boxes x 20 bags',18);
INSERT INTO Products VALUES(2,'Chang',1,1,'24 - 12 oz bottles',19);
INSERT INTO Products VALUES(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10);
INSERT INTO Products VALUES(4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22);
INSERT INTO Products VALUES(5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.35);
INSERT INTO Products VALUES(6,'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25);
INSERT INTO Products VALUES(7,'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30);
INSERT INTO Products VALUES(8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40);
INSERT INTO Products VALUES(9,'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97);
INSERT INTO Products VALUES(10,'Ikura',4,8,'12 - 200 ml jars',31);
INSERT INTO Products VALUES(11,'Queso Cabrales',5,4,'1 kg pkg.',21);
INSERT INTO Products VALUES(12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38);
INSERT INTO Products VALUES(13,'Konbu',6,8,'2 kg box',6);
INSERT INTO Products VALUES(14,'Tofu',6,7,'40 - 100 g pkgs.',23.25);
INSERT INTO Products VALUES(15,'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5);
INSERT INTO Products VALUES(16,'Pavlova',7,3,'32 - 500 g boxes',17.45);
INSERT INTO Products VALUES(17,'Alice Mutton',7,6,'20 - 1 kg tins',39);
INSERT INTO Products VALUES(18,'Carnarvon Tigers',7,8,'16 kg pkg.',62.5);
INSERT INTO Products VALUES(19,'Teatime Chocolate Biscuits',8,3,'10 boxes x 12 pieces',9.2);
INSERT INTO Products VALUES(20,'Sir Rodney''s Marmalade',8,3,'30 gift boxes',81);
INSERT INTO Products VALUES(21,'Sir Rodney''s Scones',8,3,'24 pkgs. x 4 pieces',10);
INSERT INTO Products VALUES(22,'Gustaf''s Knäckebröd',9,5,'24 - 500 g pkgs.',21);
INSERT INTO Products VALUES(23,'Tunnbröd',9,5,'12 - 250 g pkgs.',9);
INSERT INTO Products VALUES(24,'Guaraná Fantástica',10,1,'12 - 355 ml cans',4.5);
INSERT INTO Products VALUES(25,'NuNuCa Nuß-Nougat-Creme',11,3,'20 - 450 g glasses',14);
INSERT INTO Products VALUES(26,'Gumbär Gummibärchen',11,3,'100 - 250 g bags',31.23);
INSERT INTO Products VALUES(27,'Schoggi Schokolade',11,3,'100 - 100 g pieces',43.9);
INSERT INTO Products VALUES(28,'Rössle Sauerkraut',12,7,'25 - 825 g cans',45.6);
INSERT INTO Products VALUES(29,'Thüringer Rostbratwurst',12,6,'50 bags x 30 sausgs.',123.79);
INSERT INTO Products VALUES(30,'Nord-Ost Matjeshering',13,8,'10 - 200 g glasses',25.89);
INSERT INTO Products VALUES(31,'Gorgonzola Telino',14,4,'12 - 100 g pkgs',12.5);
INSERT INTO Products VALUES(32,'Mascarpone Fabioli',14,4,'24 - 200 g pkgs.',32);
INSERT INTO Products VALUES(33,'Geitost',15,4,'500 g',2.5);
INSERT INTO Products VALUES(34,'Sasquatch Ale',16,1,'24 - 12 oz bottles',14);
INSERT INTO Products VALUES(35,'Steeleye Stout',16,1,'24 - 12 oz bottles',18);
INSERT INTO Products VALUES(36,'Inlagd Sill',17,8,'24 - 250 g jars',19);
INSERT INTO Products VALUES(37,'Gravad lax',17,8,'12 - 500 g pkgs.',26);
INSERT INTO Products VALUES(38,'Côte de Blaye',18,1,'12 - 75 cl bottles',263.5);
INSERT INTO Products VALUES(39,'Chartreuse verte',18,1,'750 cc per bottle',18);
INSERT INTO Products VALUES(40,'Boston Crab Meat',19,8,'24 - 4 oz tins',18.4);
INSERT INTO Products VALUES(41,'Jack''s New England Clam Chowder',19,8,'12 - 12 oz cans',9.65);
INSERT INTO Products VALUES(42,'Singaporean Hokkien Fried Mee',20,5,'32 - 1 kg pkgs.',14);
INSERT INTO Products VALUES(43,'Ipoh Coffee',20,1,'16 - 500 g tins',46);
INSERT INTO Products VALUES(44,'Gula Malacca',20,2,'20 - 2 kg bags',19.45);
INSERT INTO Products VALUES(45,'Røgede sild',21,8,'1k pkg.',9.5);
INSERT INTO Products VALUES(46,'Spegesild',21,8,'4 - 450 g glasses',12);
INSERT INTO Products VALUES(47,'Zaanse koeken',22,3,'10 - 4 oz boxes',9.5);
INSERT INTO Products VALUES(48,'Chocolade',22,3,'10 pkgs.',12.75);
INSERT INTO Products VALUES(49,'Maxilaku',23,3,'24 - 50 g pkgs.',20);
INSERT INTO Products VALUES(50,'Valkoinen suklaa',23,3,'12 - 100 g bars',16.25);
INSERT INTO Products VALUES(51,'Manjimup Dried Apples',24,7,'50 - 300 g pkgs.',53);
INSERT INTO Products VALUES(52,'Filo Mix',24,5,'16 - 2 kg boxes',7);
INSERT INTO Products VALUES(53,'Perth Pasties',24,6,'48 pieces',32.8);
INSERT INTO Products VALUES(54,'Tourtière',25,6,'16 pies',7.45);
INSERT INTO Products VALUES(55,'Pâté chinois',25,6,'24 boxes x 2 pies',24);
INSERT INTO Products VALUES(56,'Gnocchi di nonna Alice',26,5,'24 - 250 g pkgs.',38);
INSERT INTO Products VALUES(57,'Ravioli Angelo',26,5,'24 - 250 g pkgs.',19.5);
INSERT INTO Products VALUES(58,'Escargots de Bourgogne',27,8,'24 pieces',13.25);
INSERT INTO Products VALUES(59,'Raclette Courdavault',28,4,'5 kg pkg.',55);
INSERT INTO Products VALUES(60,'Camembert Pierrot',28,4,'15 - 300 g rounds',34);
INSERT INTO Products VALUES(61,'Sirop d''érable',29,2,'24 - 500 ml bottles',28.5);
INSERT INTO Products VALUES(62,'Tarte au sucre',29,3,'48 pies',49.3);
INSERT INTO Products VALUES(63,'Vegie-spread',7,2,'15 - 625 g jars',43.9);
INSERT INTO Products VALUES(64,'Wimmers gute Semmelknödel',12,5,'20 bags x 4 pieces',33.25);
INSERT INTO Products VALUES(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles',21.05);
INSERT INTO Products VALUES(66,'Louisiana Hot Spiced Okra',2,2,'24 - 8 oz jars',17);
INSERT INTO Products VALUES(67,'Laughing Lumberjack Lager',16,1,'24 - 12 oz bottles',14);
INSERT INTO Products VALUES(68,'Scottish Longbreads',8,3,'10 boxes x 8 pieces',12.5);
INSERT INTO Products VALUES(69,'Gudbrandsdalsost',15,4,'10 kg pkg.',36);
INSERT INTO Products VALUES(70,'Outback Lager',7,1,'24 - 355 ml bottles',15);
INSERT INTO Products VALUES(71,'Fløtemysost',15,4,'10 - 500 g pkgs.',21.5);
INSERT INTO Products VALUES(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.8);
INSERT INTO Products VALUES(73,'Röd Kaviar',17,8,'24 - 150 g jars',15);
INSERT INTO Products VALUES(74,'Longlife Tofu',4,7,'5 kg pkg.',10);
INSERT INTO Products VALUES(75,'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7.75);
INSERT INTO Products VALUES(76,'Lakkalikööri',23,1,'500 ml',18);
INSERT INTO Products VALUES(77,'Original Frankfurter grüne Soße',12,2,'12 boxes',13);

INSERT INTO Orders VALUES(10248,90,5,'1996-07-04',3);
INSERT INTO Orders VALUES(10249,81,6,'1996-07-05',1);
INSERT INTO Orders VALUES(10250,34,4,'1996-07-08',2);
INSERT INTO Orders VALUES(10251,84,3,'1996-07-08',1);
INSERT INTO Orders VALUES(10252,76,4,'1996-07-09',2);
INSERT INTO Orders VALUES(10253,34,3,'1996-07-10',2);
INSERT INTO Orders VALUES(10254,14,5,'1996-07-11',2);
INSERT INTO Orders VALUES(10255,68,9,'1996-07-12',3);
INSERT INTO Orders VALUES(10256,88,3,'1996-07-15',2);
INSERT INTO Orders VALUES(10257,35,4,'1996-07-16',3);
INSERT INTO Orders VALUES(10258,20,1,'1996-07-17',1);
INSERT INTO Orders VALUES(10259,13,4,'1996-07-18',3);
INSERT INTO Orders VALUES(10260,55,4,'1996-07-19',1);
INSERT INTO Orders VALUES(10261,61,4,'1996-07-19',2);
INSERT INTO Orders VALUES(10262,65,8,'1996-07-22',3);
INSERT INTO Orders VALUES(10263,20,9,'1996-07-23',3);
INSERT INTO Orders VALUES(10264,24,6,'1996-07-24',3);
INSERT INTO Orders VALUES(10265,7,2,'1996-07-25',1);
INSERT INTO Orders VALUES(10266,87,3,'1996-07-26',3);
INSERT INTO Orders VALUES(10267,25,4,'1996-07-29',1);
INSERT INTO Orders VALUES(10268,33,8,'1996-07-30',3);
INSERT INTO Orders VALUES(10269,89,5,'1996-07-31',1);
INSERT INTO Orders VALUES(10270,87,1,'1996-08-01',1);
INSERT INTO Orders VALUES(10271,75,6,'1996-08-01',2);
INSERT INTO Orders VALUES(10272,65,6,'1996-08-02',2);
INSERT INTO Orders VALUES(10273,63,3,'1996-08-05',3);
INSERT INTO Orders VALUES(10274,85,6,'1996-08-06',1);
INSERT INTO Orders VALUES(10275,49,1,'1996-08-07',1);
INSERT INTO Orders VALUES(10276,80,8,'1996-08-08',3);
INSERT INTO Orders VALUES(10277,52,2,'1996-08-09',3);
INSERT INTO Orders VALUES(10278,5,8,'1996-08-12',2);
INSERT INTO Orders VALUES(10279,44,8,'1996-08-13',2);
INSERT INTO Orders VALUES(10280,5,2,'1996-08-14',1);
INSERT INTO Orders VALUES(10281,69,4,'1996-08-14',1);
INSERT INTO Orders VALUES(10282,69,4,'1996-08-15',1);
INSERT INTO Orders VALUES(10283,46,3,'1996-08-16',3);
INSERT INTO Orders VALUES(10284,44,4,'1996-08-19',1);
INSERT INTO Orders VALUES(10285,63,1,'1996-08-20',2);
INSERT INTO Orders VALUES(10286,63,8,'1996-08-21',3);
INSERT INTO Orders VALUES(10287,67,8,'1996-08-22',3);
INSERT INTO Orders VALUES(10288,66,4,'1996-08-23',1);
INSERT INTO Orders VALUES(10289,11,7,'1996-08-26',3);
INSERT INTO Orders VALUES(10290,15,8,'1996-08-27',1);
INSERT INTO Orders VALUES(10291,61,6,'1996-08-27',2);
INSERT INTO Orders VALUES(10292,81,1,'1996-08-28',2);
INSERT INTO Orders VALUES(10293,80,1,'1996-08-29',3);
INSERT INTO Orders VALUES(10294,65,4,'1996-08-30',2);
INSERT INTO Orders VALUES(10295,85,2,'1996-09-02',2);
INSERT INTO Orders VALUES(10296,46,6,'1996-09-03',1);
INSERT INTO Orders VALUES(10297,7,5,'1996-09-04',2);
INSERT INTO Orders VALUES(10298,37,6,'1996-09-05',2);
INSERT INTO Orders VALUES(10299,67,4,'1996-09-06',2);
INSERT INTO Orders VALUES(10300,49,2,'1996-09-09',2);
INSERT INTO Orders VALUES(10301,86,8,'1996-09-09',2);
INSERT INTO Orders VALUES(10302,76,4,'1996-09-10',2);
INSERT INTO Orders VALUES(10303,30,7,'1996-09-11',2);
INSERT INTO Orders VALUES(10304,80,1,'1996-09-12',2);
INSERT INTO Orders VALUES(10305,55,8,'1996-09-13',3);
INSERT INTO Orders VALUES(10306,69,1,'1996-09-16',3);
INSERT INTO Orders VALUES(10307,48,2,'1996-09-17',2);
INSERT INTO Orders VALUES(10308,2,7,'1996-09-18',3);
INSERT INTO Orders VALUES(10309,37,3,'1996-09-19',1);
INSERT INTO Orders VALUES(10310,77,8,'1996-09-20',2);
INSERT INTO Orders VALUES(10311,18,1,'1996-09-20',3);
INSERT INTO Orders VALUES(10312,86,2,'1996-09-23',2);
INSERT INTO Orders VALUES(10313,63,2,'1996-09-24',2);
INSERT INTO Orders VALUES(10314,65,1,'1996-09-25',2);
INSERT INTO Orders VALUES(10315,38,4,'1996-09-26',2);
INSERT INTO Orders VALUES(10316,65,1,'1996-09-27',3);
INSERT INTO Orders VALUES(10317,48,6,'1996-09-30',1);
INSERT INTO Orders VALUES(10318,38,8,'1996-10-01',2);
INSERT INTO Orders VALUES(10319,80,7,'1996-10-02',3);
INSERT INTO Orders VALUES(10320,87,5,'1996-10-03',3);
INSERT INTO Orders VALUES(10321,38,3,'1996-10-03',2);
INSERT INTO Orders VALUES(10322,58,7,'1996-10-04',3);
INSERT INTO Orders VALUES(10323,39,4,'1996-10-07',1);
INSERT INTO Orders VALUES(10324,71,9,'1996-10-08',1);
INSERT INTO Orders VALUES(10325,39,1,'1996-10-09',3);
INSERT INTO Orders VALUES(10326,8,4,'1996-10-10',2);
INSERT INTO Orders VALUES(10327,24,2,'1996-10-11',1);
INSERT INTO Orders VALUES(10328,28,4,'1996-10-14',3);
INSERT INTO Orders VALUES(10329,75,4,'1996-10-15',2);
INSERT INTO Orders VALUES(10330,46,3,'1996-10-16',1);
INSERT INTO Orders VALUES(10331,9,9,'1996-10-16',1);
INSERT INTO Orders VALUES(10332,51,3,'1996-10-17',2);
INSERT INTO Orders VALUES(10333,87,5,'1996-10-18',3);
INSERT INTO Orders VALUES(10334,84,8,'1996-10-21',2);
INSERT INTO Orders VALUES(10335,37,7,'1996-10-22',2);
INSERT INTO Orders VALUES(10336,60,7,'1996-10-23',2);
INSERT INTO Orders VALUES(10337,25,4,'1996-10-24',3);
INSERT INTO Orders VALUES(10338,55,4,'1996-10-25',3);
INSERT INTO Orders VALUES(10339,51,2,'1996-10-28',2);
INSERT INTO Orders VALUES(10340,9,1,'1996-10-29',3);
INSERT INTO Orders VALUES(10341,73,7,'1996-10-29',3);
INSERT INTO Orders VALUES(10342,25,4,'1996-10-30',2);
INSERT INTO Orders VALUES(10343,44,4,'1996-10-31',1);
INSERT INTO Orders VALUES(10344,89,4,'1996-11-01',2);
INSERT INTO Orders VALUES(10345,63,2,'1996-11-04',2);
INSERT INTO Orders VALUES(10346,65,3,'1996-11-05',3);
INSERT INTO Orders VALUES(10347,21,4,'1996-11-06',3);
INSERT INTO Orders VALUES(10348,86,4,'1996-11-07',2);
INSERT INTO Orders VALUES(10349,75,7,'1996-11-08',1);
INSERT INTO Orders VALUES(10350,41,6,'1996-11-11',2);
INSERT INTO Orders VALUES(10351,20,1,'1996-11-11',1);
INSERT INTO Orders VALUES(10352,28,3,'1996-11-12',3);
INSERT INTO Orders VALUES(10353,59,7,'1996-11-13',3);
INSERT INTO Orders VALUES(10354,58,8,'1996-11-14',3);
INSERT INTO Orders VALUES(10355,4,6,'1996-11-15',1);
INSERT INTO Orders VALUES(10356,86,6,'1996-11-18',2);
INSERT INTO Orders VALUES(10357,46,1,'1996-11-19',3);
INSERT INTO Orders VALUES(10358,41,5,'1996-11-20',1);
INSERT INTO Orders VALUES(10359,72,5,'1996-11-21',3);
INSERT INTO Orders VALUES(10360,7,4,'1996-11-22',3);
INSERT INTO Orders VALUES(10361,63,1,'1996-11-22',2);
INSERT INTO Orders VALUES(10362,9,3,'1996-11-25',1);
INSERT INTO Orders VALUES(10363,17,4,'1996-11-26',3);
INSERT INTO Orders VALUES(10364,19,1,'1996-11-26',1);
INSERT INTO Orders VALUES(10365,3,3,'1996-11-27',2);
INSERT INTO Orders VALUES(10366,29,8,'1996-11-28',2);
INSERT INTO Orders VALUES(10367,83,7,'1996-11-28',3);
INSERT INTO Orders VALUES(10368,20,2,'1996-11-29',2);
INSERT INTO Orders VALUES(10369,75,8,'1996-12-02',2);
INSERT INTO Orders VALUES(10370,14,6,'1996-12-03',2);
INSERT INTO Orders VALUES(10371,41,1,'1996-12-03',1);
INSERT INTO Orders VALUES(10372,62,5,'1996-12-04',2);
INSERT INTO Orders VALUES(10373,37,4,'1996-12-05',3);
INSERT INTO Orders VALUES(10374,91,1,'1996-12-05',3);
INSERT INTO Orders VALUES(10375,36,3,'1996-12-06',2);
INSERT INTO Orders VALUES(10376,51,1,'1996-12-09',2);
INSERT INTO Orders VALUES(10377,72,1,'1996-12-09',3);
INSERT INTO Orders VALUES(10378,24,5,'1996-12-10',3);
INSERT INTO Orders VALUES(10379,61,2,'1996-12-11',1);
INSERT INTO Orders VALUES(10380,37,8,'1996-12-12',3);
INSERT INTO Orders VALUES(10381,46,3,'1996-12-12',3);
INSERT INTO Orders VALUES(10382,20,4,'1996-12-13',1);
INSERT INTO Orders VALUES(10383,4,8,'1996-12-16',3);
INSERT INTO Orders VALUES(10384,5,3,'1996-12-16',3);
INSERT INTO Orders VALUES(10385,75,1,'1996-12-17',2);
INSERT INTO Orders VALUES(10386,21,9,'1996-12-18',3);
INSERT INTO Orders VALUES(10387,70,1,'1996-12-18',2);
INSERT INTO Orders VALUES(10388,72,2,'1996-12-19',1);
INSERT INTO Orders VALUES(10389,10,4,'1996-12-20',2);
INSERT INTO Orders VALUES(10390,20,6,'1996-12-23',1);
INSERT INTO Orders VALUES(10391,17,3,'1996-12-23',3);
INSERT INTO Orders VALUES(10392,59,2,'1996-12-24',3);
INSERT INTO Orders VALUES(10393,71,1,'1996-12-25',3);
INSERT INTO Orders VALUES(10394,36,1,'1996-12-25',3);
INSERT INTO Orders VALUES(10395,35,6,'1996-12-26',1);
INSERT INTO Orders VALUES(10396,25,1,'1996-12-27',3);
INSERT INTO Orders VALUES(10397,60,5,'1996-12-27',1);
INSERT INTO Orders VALUES(10398,71,2,'1996-12-30',3);
INSERT INTO Orders VALUES(10399,83,8,'1996-12-31',3);
INSERT INTO Orders VALUES(10400,19,1,'1997-01-01',3);
INSERT INTO Orders VALUES(10401,65,1,'1997-01-01',1);
INSERT INTO Orders VALUES(10402,20,8,'1997-01-02',2);
INSERT INTO Orders VALUES(10403,20,4,'1997-01-03',3);
INSERT INTO Orders VALUES(10404,49,2,'1997-01-03',1);
INSERT INTO Orders VALUES(10405,47,1,'1997-01-06',1);
INSERT INTO Orders VALUES(10406,62,7,'1997-01-07',1);
INSERT INTO Orders VALUES(10407,56,2,'1997-01-07',2);
INSERT INTO Orders VALUES(10408,23,8,'1997-01-08',1);
INSERT INTO Orders VALUES(10409,54,3,'1997-01-09',1);
INSERT INTO Orders VALUES(10410,10,3,'1997-01-10',3);
INSERT INTO Orders VALUES(10411,10,9,'1997-01-10',3);
INSERT INTO Orders VALUES(10412,87,8,'1997-01-13',2);
INSERT INTO Orders VALUES(10413,41,3,'1997-01-14',2);
INSERT INTO Orders VALUES(10414,21,2,'1997-01-14',3);
INSERT INTO Orders VALUES(10415,36,3,'1997-01-15',1);
INSERT INTO Orders VALUES(10416,87,8,'1997-01-16',3);
INSERT INTO Orders VALUES(10417,73,4,'1997-01-16',3);
INSERT INTO Orders VALUES(10418,63,4,'1997-01-17',1);
INSERT INTO Orders VALUES(10419,68,4,'1997-01-20',2);
INSERT INTO Orders VALUES(10420,88,3,'1997-01-21',1);
INSERT INTO Orders VALUES(10421,61,8,'1997-01-21',1);
INSERT INTO Orders VALUES(10422,27,2,'1997-01-22',1);
INSERT INTO Orders VALUES(10423,31,6,'1997-01-23',3);
INSERT INTO Orders VALUES(10424,51,7,'1997-01-23',2);
INSERT INTO Orders VALUES(10425,41,6,'1997-01-24',2);
INSERT INTO Orders VALUES(10426,29,4,'1997-01-27',1);
INSERT INTO Orders VALUES(10427,59,4,'1997-01-27',2);
INSERT INTO Orders VALUES(10428,66,7,'1997-01-28',1);
INSERT INTO Orders VALUES(10429,37,3,'1997-01-29',2);
INSERT INTO Orders VALUES(10430,20,4,'1997-01-30',1);
INSERT INTO Orders VALUES(10431,10,4,'1997-01-30',2);
INSERT INTO Orders VALUES(10432,75,3,'1997-01-31',2);
INSERT INTO Orders VALUES(10433,60,3,'1997-02-03',3);
INSERT INTO Orders VALUES(10434,24,3,'1997-02-03',2);
INSERT INTO Orders VALUES(10435,16,8,'1997-02-04',2);
INSERT INTO Orders VALUES(10436,7,3,'1997-02-05',2);
INSERT INTO Orders VALUES(10437,87,8,'1997-02-05',1);
INSERT INTO Orders VALUES(10438,79,3,'1997-02-06',2);
INSERT INTO Orders VALUES(10439,51,6,'1997-02-07',3);
INSERT INTO Orders VALUES(10440,71,4,'1997-02-10',2);
INSERT INTO Orders VALUES(10441,55,3,'1997-02-10',2);
INSERT INTO Orders VALUES(10442,20,3,'1997-02-11',2);
INSERT INTO Orders VALUES(10443,66,8,'1997-02-12',1);
VALUES (10444,N'BERGS',3,'2/12/1997','3/12/1997','2/21/1997',3,3.50,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10445,N'BERGS',3,'2/13/1997','3/13/1997','2/20/1997',1,9.30,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10446,N'TOMSP',6,'2/14/1997','3/14/1997','2/19/1997',1,14.68,
	N'Toms Spezialitäten',N'Luisenstr. 48',N'Münster',
	NULL,N'44087',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10447,N'RICAR',4,'2/14/1997','3/14/1997','3/7/1997',2,68.66,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10448,N'RANCH',4,'2/17/1997','3/17/1997','2/24/1997',2,38.82,
	N'Rancho grande',N'Av. del Libertador 900',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10449,N'BLONP',3,'2/18/1997','3/18/1997','2/27/1997',2,53.30,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10450,N'VICTE',8,'2/19/1997','3/19/1997','3/11/1997',2,7.23,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10451,N'QUICK',4,'2/19/1997','3/5/1997','3/12/1997',3,189.09,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10452,N'SAVEA',8,'2/20/1997','3/20/1997','2/26/1997',1,140.26,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10453,N'AROUT',1,'2/21/1997','3/21/1997','2/26/1997',2,25.36,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10454,N'LAMAI',4,'2/21/1997','3/21/1997','2/25/1997',3,2.74,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10455,N'WARTH',8,'2/24/1997','4/7/1997','3/3/1997',2,180.45,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10456,N'KOENE',8,'2/25/1997','4/8/1997','2/28/1997',2,8.12,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10457,N'KOENE',2,'2/25/1997','3/25/1997','3/3/1997',1,11.57,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10458,N'SUPRD',7,'2/26/1997','3/26/1997','3/4/1997',3,147.06,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10459,N'VICTE',4,'2/27/1997','3/27/1997','2/28/1997',2,25.09,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10460,N'FOLKO',8,'2/28/1997','3/28/1997','3/3/1997',1,16.27,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10461,N'LILAS',1,'2/28/1997','3/28/1997','3/5/1997',3,148.61,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10462,N'CONSH',2,'3/3/1997','3/31/1997','3/18/1997',1,6.17,
	N'Consolidated Holdings',N'Berkeley Gardens 12  Brewery',N'London',
	NULL,N'WX1 6LT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10463,N'SUPRD',5,'3/4/1997','4/1/1997','3/6/1997',3,14.78,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10464,N'FURIB',4,'3/4/1997','4/1/1997','3/14/1997',2,89.00,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10465,N'VAFFE',1,'3/5/1997','4/2/1997','3/14/1997',3,145.04,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10466,N'COMMI',4,'3/6/1997','4/3/1997','3/13/1997',1,11.93,
	N'Comércio Mineiro',N'Av. dos Lusíadas, 23',N'Sao Paulo',
	N'SP',N'05432-043',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10467,N'MAGAA',8,'3/6/1997','4/3/1997','3/11/1997',2,4.93,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10468,N'KOENE',3,'3/7/1997','4/4/1997','3/12/1997',3,44.12,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10469,N'WHITC',1,'3/10/1997','4/7/1997','3/14/1997',1,60.18,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10470,N'BONAP',4,'3/11/1997','4/8/1997','3/14/1997',2,64.56,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10471,N'BSBEV',2,'3/11/1997','4/8/1997','3/18/1997',3,45.59,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10472,N'SEVES',8,'3/12/1997','4/9/1997','3/19/1997',1,4.20,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10473,N'ISLAT',1,'3/13/1997','3/27/1997','3/21/1997',3,16.37,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10474,N'PERIC',5,'3/13/1997','4/10/1997','3/21/1997',2,83.49,
	N'Pericles Comidas clásicas',N'Calle Dr. Jorge Cash 321',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10475,N'SUPRD',9,'3/14/1997','4/11/1997','4/4/1997',1,68.52,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10476,N'HILAA',8,'3/17/1997','4/14/1997','3/24/1997',3,4.41,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10477,N'PRINI',5,'3/17/1997','4/14/1997','3/25/1997',2,13.02,
	N'Princesa Isabel Vinhos',N'Estrada da saúde n. 58',N'Lisboa',
	NULL,N'1756',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10478,N'VICTE',2,'3/18/1997','4/1/1997','3/26/1997',3,4.81,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10479,N'RATTC',3,'3/19/1997','4/16/1997','3/21/1997',3,708.95,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10480,N'FOLIG',6,'3/20/1997','4/17/1997','3/24/1997',2,1.35,
	N'Folies gourmandes',N'184, chaussée de Tournai',N'Lille',
	NULL,N'59000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10481,N'RICAR',8,'3/20/1997','4/17/1997','3/25/1997',2,64.33,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10482,N'LAZYK',1,'3/21/1997','4/18/1997','4/10/1997',3,7.48,
	N'Lazy K Kountry Store',N'12 Orchestra Terrace',N'Walla Walla',
	N'WA',N'99362',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10483,N'WHITC',7,'3/24/1997','4/21/1997','4/25/1997',2,15.28,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10484,N'BSBEV',3,'3/24/1997','4/21/1997','4/1/1997',3,6.88,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10485,N'LINOD',4,'3/25/1997','4/8/1997','3/31/1997',2,64.45,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10486,N'HILAA',1,'3/26/1997','4/23/1997','4/2/1997',2,30.53,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10487,N'QUEEN',2,'3/26/1997','4/23/1997','3/28/1997',2,71.07,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10488,N'FRANK',8,'3/27/1997','4/24/1997','4/2/1997',2,4.93,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10489,N'PICCO',6,'3/28/1997','4/25/1997','4/9/1997',2,5.29,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10490,N'HILAA',7,'3/31/1997','4/28/1997','4/3/1997',2,210.19,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10491,N'FURIB',8,'3/31/1997','4/28/1997','4/8/1997',3,16.96,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10492,N'BOTTM',3,'4/1/1997','4/29/1997','4/11/1997',1,62.89,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10493,N'LAMAI',4,'4/2/1997','4/30/1997','4/10/1997',3,10.64,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10494,N'COMMI',4,'4/2/1997','4/30/1997','4/9/1997',2,65.99,
	N'Comércio Mineiro',N'Av. dos Lusíadas, 23',N'Sao Paulo',
	N'SP',N'05432-043',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10495,N'LAUGB',3,'4/3/1997','5/1/1997','4/11/1997',3,4.65,
	N'Laughing Bacchus Wine Cellars',N'2319 Elm St.',N'Vancouver',
	N'BC',N'V3F 2K1',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10496,N'TRADH',7,'4/4/1997','5/2/1997','4/7/1997',2,46.77,
	N'Tradiçao Hipermercados',N'Av. Inês de Castro, 414',N'Sao Paulo',
	N'SP',N'05634-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10497,N'LEHMS',7,'4/4/1997','5/2/1997','4/7/1997',1,36.21,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10498,N'HILAA',8,'4/7/1997','5/5/1997','4/11/1997',2,29.75,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10499,N'LILAS',4,'4/8/1997','5/6/1997','4/16/1997',2,102.02,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10500,N'LAMAI',6,'4/9/1997','5/7/1997','4/17/1997',1,42.68,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10501,N'BLAUS',9,'4/9/1997','5/7/1997','4/16/1997',3,8.85,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10502,N'PERIC',2,'4/10/1997','5/8/1997','4/29/1997',1,69.32,
	N'Pericles Comidas clásicas',N'Calle Dr. Jorge Cash 321',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10503,N'HUNGO',6,'4/11/1997','5/9/1997','4/16/1997',2,16.74,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10504,N'WHITC',4,'4/11/1997','5/9/1997','4/18/1997',3,59.13,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10505,N'MEREP',3,'4/14/1997','5/12/1997','4/21/1997',3,7.13,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10506,N'KOENE',9,'4/15/1997','5/13/1997','5/2/1997',2,21.19,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10507,N'ANTON',7,'4/15/1997','5/13/1997','4/22/1997',1,47.45,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10508,N'OTTIK',1,'4/16/1997','5/14/1997','5/13/1997',2,4.99,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10509,N'BLAUS',4,'4/17/1997','5/15/1997','4/29/1997',1,0.15,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10510,N'SAVEA',6,'4/18/1997','5/16/1997','4/28/1997',3,367.63,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10511,N'BONAP',4,'4/18/1997','5/16/1997','4/21/1997',3,350.64,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10512,N'FAMIA',7,'4/21/1997','5/19/1997','4/24/1997',2,3.53,
	N'Familia Arquibaldo',N'Rua Orós, 92',N'Sao Paulo',
	N'SP',N'05442-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10513,N'WANDK',7,'4/22/1997','6/3/1997','4/28/1997',1,105.65,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10514,N'ERNSH',3,'4/22/1997','5/20/1997','5/16/1997',2,789.95,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10515,N'QUICK',2,'4/23/1997','5/7/1997','5/23/1997',1,204.47,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10516,N'HUNGO',2,'4/24/1997','5/22/1997','5/1/1997',3,62.78,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10517,N'NORTS',3,'4/24/1997','5/22/1997','4/29/1997',3,32.07,
	N'North/South',N'South House 300 Queensbridge',N'London',
	NULL,N'SW7 1RZ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10518,N'TORTU',4,'4/25/1997','5/9/1997','5/5/1997',2,218.15,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10519,N'CHOPS',6,'4/28/1997','5/26/1997','5/1/1997',3,91.76,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10520,N'SANTG',7,'4/29/1997','5/27/1997','5/1/1997',1,13.37,
	N'Santé Gourmet',N'Erling Skakkes gate 78',N'Stavern',
	NULL,N'4110',N'Norway')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10521,N'CACTU',8,'4/29/1997','5/27/1997','5/2/1997',2,17.22,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10522,N'LEHMS',4,'4/30/1997','5/28/1997','5/6/1997',1,45.33,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10523,N'SEVES',7,'5/1/1997','5/29/1997','5/30/1997',2,77.63,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10524,N'BERGS',1,'5/1/1997','5/29/1997','5/7/1997',2,244.79,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10525,N'BONAP',1,'5/2/1997','5/30/1997','5/23/1997',2,11.06,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10526,N'WARTH',4,'5/5/1997','6/2/1997','5/15/1997',2,58.59,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10527,N'QUICK',7,'5/5/1997','6/2/1997','5/7/1997',1,41.90,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10528,N'GREAL',6,'5/6/1997','5/20/1997','5/9/1997',2,3.35,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10529,N'MAISD',5,'5/7/1997','6/4/1997','5/9/1997',2,66.69,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10530,N'PICCO',3,'5/8/1997','6/5/1997','5/12/1997',2,339.22,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10531,N'OCEAN',7,'5/8/1997','6/5/1997','5/19/1997',1,8.12,
	N'Océano Atlántico Ltda.',N'Ing. Gustavo Moncada 8585 Piso 20-A',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10532,N'EASTC',7,'5/9/1997','6/6/1997','5/12/1997',3,74.46,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10533,N'FOLKO',8,'5/12/1997','6/9/1997','5/22/1997',1,188.04,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10534,N'LEHMS',8,'5/12/1997','6/9/1997','5/14/1997',2,27.94,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10535,N'ANTON',4,'5/13/1997','6/10/1997','5/21/1997',1,15.64,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10536,N'LEHMS',3,'5/14/1997','6/11/1997','6/6/1997',2,58.88,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10537,N'RICSU',1,'5/14/1997','5/28/1997','5/19/1997',1,78.85,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10538,N'BSBEV',9,'5/15/1997','6/12/1997','5/16/1997',3,4.87,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10539,N'BSBEV',6,'5/16/1997','6/13/1997','5/23/1997',3,12.36,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10540,N'QUICK',3,'5/19/1997','6/16/1997','6/13/1997',3,1007.64,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10541,N'HANAR',2,'5/19/1997','6/16/1997','5/29/1997',1,68.65,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10542,N'KOENE',1,'5/20/1997','6/17/1997','5/26/1997',3,10.95,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10543,N'LILAS',8,'5/21/1997','6/18/1997','5/23/1997',2,48.17,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10544,N'LONEP',4,'5/21/1997','6/18/1997','5/30/1997',1,24.91,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10545,N'LAZYK',8,'5/22/1997','6/19/1997','6/26/1997',2,11.92,
	N'Lazy K Kountry Store',N'12 Orchestra Terrace',N'Walla Walla',
	N'WA',N'99362',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10546,N'VICTE',1,'5/23/1997','6/20/1997','5/27/1997',3,194.72,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10547,N'SEVES',3,'5/23/1997','6/20/1997','6/2/1997',2,178.43,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10548,N'TOMSP',3,'5/26/1997','6/23/1997','6/2/1997',2,1.43,
	N'Toms Spezialitäten',N'Luisenstr. 48',N'Münster',
	NULL,N'44087',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10549,N'QUICK',5,'5/27/1997','6/10/1997','5/30/1997',1,171.24,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10550,N'GODOS',7,'5/28/1997','6/25/1997','6/6/1997',3,4.32,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10551,N'FURIB',4,'5/28/1997','7/9/1997','6/6/1997',3,72.95,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10552,N'HILAA',2,'5/29/1997','6/26/1997','6/5/1997',1,83.22,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10553,N'WARTH',2,'5/30/1997','6/27/1997','6/3/1997',2,149.49,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10554,N'OTTIK',4,'5/30/1997','6/27/1997','6/5/1997',3,120.97,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10555,N'SAVEA',6,'6/2/1997','6/30/1997','6/4/1997',3,252.49,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10556,N'SIMOB',2,'6/3/1997','7/15/1997','6/13/1997',1,9.80,
	N'Simons bistro',N'Vinbæltet 34',N'Kobenhavn',
	NULL,N'1734',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10557,N'LEHMS',9,'6/3/1997','6/17/1997','6/6/1997',2,96.72,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10558,N'AROUT',1,'6/4/1997','7/2/1997','6/10/1997',2,72.97,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10559,N'BLONP',6,'6/5/1997','7/3/1997','6/13/1997',1,8.05,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10560,N'FRANK',8,'6/6/1997','7/4/1997','6/9/1997',1,36.65,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10561,N'FOLKO',2,'6/6/1997','7/4/1997','6/9/1997',2,242.21,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10562,N'REGGC',1,'6/9/1997','7/7/1997','6/12/1997',1,22.95,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10563,N'RICAR',2,'6/10/1997','7/22/1997','6/24/1997',2,60.43,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10564,N'RATTC',4,'6/10/1997','7/8/1997','6/16/1997',3,13.75,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10565,N'MEREP',8,'6/11/1997','7/9/1997','6/18/1997',2,7.15,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10566,N'BLONP',9,'6/12/1997','7/10/1997','6/18/1997',1,88.40,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10567,N'HUNGO',1,'6/12/1997','7/10/1997','6/17/1997',1,33.97,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10568,N'GALED',3,'6/13/1997','7/11/1997','7/9/1997',3,6.54,
	N'Galería del gastronómo',N'Rambla de Cataluña, 23',N'Barcelona',
	NULL,N'8022',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10569,N'RATTC',5,'6/16/1997','7/14/1997','7/11/1997',1,58.98,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10570,N'MEREP',3,'6/17/1997','7/15/1997','6/19/1997',3,188.99,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10571,N'ERNSH',8,'6/17/1997','7/29/1997','7/4/1997',3,26.06,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10572,N'BERGS',3,'6/18/1997','7/16/1997','6/25/1997',2,116.43,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10573,N'ANTON',7,'6/19/1997','7/17/1997','6/20/1997',3,84.84,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10574,N'TRAIH',4,'6/19/1997','7/17/1997','6/30/1997',2,37.60,
	N'Trail''s Head Gourmet Provisioners',N'722 DaVinci Blvd.',N'Kirkland',
	N'WA',N'98034',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10575,N'MORGK',5,'6/20/1997','7/4/1997','6/30/1997',1,127.34,
	N'Morgenstern Gesundkost',N'Heerstr. 22',N'Leipzig',
	NULL,N'04179',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10576,N'TORTU',3,'6/23/1997','7/7/1997','6/30/1997',3,18.56,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10577,N'TRAIH',9,'6/23/1997','8/4/1997','6/30/1997',2,25.41,
	N'Trail''s Head Gourmet Provisioners',N'722 DaVinci Blvd.',N'Kirkland',
	N'WA',N'98034',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10578,N'BSBEV',4,'6/24/1997','7/22/1997','7/25/1997',3,29.60,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10579,N'LETSS',1,'6/25/1997','7/23/1997','7/4/1997',2,13.73,
	N'Let''s Stop N Shop',N'87 Polk St. Suite 5',N'San Francisco',
	N'CA',N'94117',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10580,N'OTTIK',4,'6/26/1997','7/24/1997','7/1/1997',3,75.89,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10581,N'FAMIA',3,'6/26/1997','7/24/1997','7/2/1997',1,3.01,
	N'Familia Arquibaldo',N'Rua Orós, 92',N'Sao Paulo',
	N'SP',N'05442-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10582,N'BLAUS',3,'6/27/1997','7/25/1997','7/14/1997',2,27.71,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10583,N'WARTH',2,'6/30/1997','7/28/1997','7/4/1997',2,7.28,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10584,N'BLONP',4,'6/30/1997','7/28/1997','7/4/1997',1,59.14,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10585,N'WELLI',7,'7/1/1997','7/29/1997','7/10/1997',1,13.41,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10586,N'REGGC',9,'7/2/1997','7/30/1997','7/9/1997',1,0.48,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10587,N'QUEDE',1,'7/2/1997','7/30/1997','7/9/1997',1,62.52,
	N'Que Delícia',N'Rua da Panificadora, 12',N'Rio de Janeiro',
	N'RJ',N'02389-673',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10588,N'QUICK',2,'7/3/1997','7/31/1997','7/10/1997',3,194.67,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10589,N'GREAL',8,'7/4/1997','8/1/1997','7/14/1997',2,4.42,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10590,N'MEREP',4,'7/7/1997','8/4/1997','7/14/1997',3,44.77,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10591,N'VAFFE',1,'7/7/1997','7/21/1997','7/16/1997',1,55.92,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10592,N'LEHMS',3,'7/8/1997','8/5/1997','7/16/1997',1,32.10,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10593,N'LEHMS',7,'7/9/1997','8/6/1997','8/13/1997',2,174.20,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10594,N'OLDWO',3,'7/9/1997','8/6/1997','7/16/1997',2,5.24,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10595,N'ERNSH',2,'7/10/1997','8/7/1997','7/14/1997',1,96.78,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10596,N'WHITC',8,'7/11/1997','8/8/1997','8/12/1997',1,16.34,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10597,N'PICCO',7,'7/11/1997','8/8/1997','7/18/1997',3,35.12,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10598,N'RATTC',1,'7/14/1997','8/11/1997','7/18/1997',3,44.42,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10599,N'BSBEV',6,'7/15/1997','8/26/1997','7/21/1997',3,29.98,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10600,N'HUNGC',4,'7/16/1997','8/13/1997','7/21/1997',1,45.13,
	N'Hungry Coyote Import Store',N'City Center Plaza 516 Main St.',N'Elgin',
	N'OR',N'97827',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10601,N'HILAA',7,'7/16/1997','8/27/1997','7/22/1997',1,58.30,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10602,N'VAFFE',8,'7/17/1997','8/14/1997','7/22/1997',2,2.92,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10603,N'SAVEA',8,'7/18/1997','8/15/1997','8/8/1997',2,48.77,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10604,N'FURIB',1,'7/18/1997','8/15/1997','7/29/1997',1,7.46,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10605,N'MEREP',1,'7/21/1997','8/18/1997','7/29/1997',2,379.13,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10606,N'TRADH',4,'7/22/1997','8/19/1997','7/31/1997',3,79.40,
	N'Tradiçao Hipermercados',N'Av. Inês de Castro, 414',N'Sao Paulo',
	N'SP',N'05634-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10607,N'SAVEA',5,'7/22/1997','8/19/1997','7/25/1997',1,200.24,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10608,N'TOMSP',4,'7/23/1997','8/20/1997','8/1/1997',2,27.79,
	N'Toms Spezialitäten',N'Luisenstr. 48',N'Münster',
	NULL,N'44087',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10609,N'DUMON',7,'7/24/1997','8/21/1997','7/30/1997',2,1.85,
	N'Du monde entier',N'67, rue des Cinquante Otages',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10610,N'LAMAI',8,'7/25/1997','8/22/1997','8/6/1997',1,26.78,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10611,N'WOLZA',6,'7/25/1997','8/22/1997','8/1/1997',2,80.65,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10612,N'SAVEA',1,'7/28/1997','8/25/1997','8/1/1997',2,544.08,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10613,N'HILAA',4,'7/29/1997','8/26/1997','8/1/1997',2,8.11,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10614,N'BLAUS',8,'7/29/1997','8/26/1997','8/1/1997',3,1.93,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10615,N'WILMK',2,'7/30/1997','8/27/1997','8/6/1997',3,0.75,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10616,N'GREAL',1,'7/31/1997','8/28/1997','8/5/1997',2,116.53,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10617,N'GREAL',4,'7/31/1997','8/28/1997','8/4/1997',2,18.53,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10618,N'MEREP',1,'8/1/1997','9/12/1997','8/8/1997',1,154.68,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10619,N'MEREP',3,'8/4/1997','9/1/1997','8/7/1997',3,91.05,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10620,N'LAUGB',2,'8/5/1997','9/2/1997','8/14/1997',3,0.94,
	N'Laughing Bacchus Wine Cellars',N'2319 Elm St.',N'Vancouver',
	N'BC',N'V3F 2K1',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10621,N'ISLAT',4,'8/5/1997','9/2/1997','8/11/1997',2,23.73,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10622,N'RICAR',4,'8/6/1997','9/3/1997','8/11/1997',3,50.97,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10623,N'FRANK',8,'8/7/1997','9/4/1997','8/12/1997',2,97.18,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10624,N'THECR',4,'8/7/1997','9/4/1997','8/19/1997',2,94.80,
	N'The Cracker Box',N'55 Grizzly Peak Rd.',N'Butte',
	N'MT',N'59801',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10625,N'ANATR',3,'8/8/1997','9/5/1997','8/14/1997',1,43.90,
	N'Ana Trujillo Emparedados y helados',N'Avda. de la Constitución 2222',N'México D.F.',
	NULL,N'05021',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10626,N'BERGS',1,'8/11/1997','9/8/1997','8/20/1997',2,138.69,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10627,N'SAVEA',8,'8/11/1997','9/22/1997','8/21/1997',3,107.46,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10628,N'BLONP',4,'8/12/1997','9/9/1997','8/20/1997',3,30.36,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10629,N'GODOS',4,'8/12/1997','9/9/1997','8/20/1997',3,85.46,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10630,N'KOENE',1,'8/13/1997','9/10/1997','8/19/1997',2,32.35,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10631,N'LAMAI',8,'8/14/1997','9/11/1997','8/15/1997',1,0.87,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10632,N'WANDK',8,'8/14/1997','9/11/1997','8/19/1997',1,41.38,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10633,N'ERNSH',7,'8/15/1997','9/12/1997','8/18/1997',3,477.90,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10634,N'FOLIG',4,'8/15/1997','9/12/1997','8/21/1997',3,487.38,
	N'Folies gourmandes',N'184, chaussée de Tournai',N'Lille',
	NULL,N'59000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10635,N'MAGAA',8,'8/18/1997','9/15/1997','8/21/1997',3,47.46,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10636,N'WARTH',4,'8/19/1997','9/16/1997','8/26/1997',1,1.15,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10637,N'QUEEN',6,'8/19/1997','9/16/1997','8/26/1997',1,201.29,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10638,N'LINOD',3,'8/20/1997','9/17/1997','9/1/1997',1,158.44,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10639,N'SANTG',7,'8/20/1997','9/17/1997','8/27/1997',3,38.64,
	N'Santé Gourmet',N'Erling Skakkes gate 78',N'Stavern',
	NULL,N'4110',N'Norway')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10640,N'WANDK',4,'8/21/1997','9/18/1997','8/28/1997',1,23.55,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10641,N'HILAA',4,'8/22/1997','9/19/1997','8/26/1997',2,179.61,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10642,N'SIMOB',7,'8/22/1997','9/19/1997','9/5/1997',3,41.89,
	N'Simons bistro',N'Vinbæltet 34',N'Kobenhavn',
	NULL,N'1734',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10643,N'ALFKI',6,'8/25/1997','9/22/1997','9/2/1997',1,29.46,
	N'Alfreds Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10644,N'WELLI',3,'8/25/1997','9/22/1997','9/1/1997',2,0.14,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10645,N'HANAR',4,'8/26/1997','9/23/1997','9/2/1997',1,12.41,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10646,N'HUNGO',9,'8/27/1997','10/8/1997','9/3/1997',3,142.33,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10647,N'QUEDE',4,'8/27/1997','9/10/1997','9/3/1997',2,45.54,
	N'Que Delícia',N'Rua da Panificadora, 12',N'Rio de Janeiro',
	N'RJ',N'02389-673',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10648,N'RICAR',5,'8/28/1997','10/9/1997','9/9/1997',2,14.25,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10649,N'MAISD',5,'8/28/1997','9/25/1997','8/29/1997',3,6.20,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10650,N'FAMIA',5,'8/29/1997','9/26/1997','9/3/1997',3,176.81,
	N'Familia Arquibaldo',N'Rua Orós, 92',N'Sao Paulo',
	N'SP',N'05442-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10651,N'WANDK',8,'9/1/1997','9/29/1997','9/11/1997',2,20.60,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10652,N'GOURL',4,'9/1/1997','9/29/1997','9/8/1997',2,7.14,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10653,N'FRANK',1,'9/2/1997','9/30/1997','9/19/1997',1,93.25,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10654,N'BERGS',5,'9/2/1997','9/30/1997','9/11/1997',1,55.26,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10655,N'REGGC',1,'9/3/1997','10/1/1997','9/11/1997',2,4.41,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10656,N'GREAL',6,'9/4/1997','10/2/1997','9/10/1997',1,57.15,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10657,N'SAVEA',2,'9/4/1997','10/2/1997','9/15/1997',2,352.69,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10658,N'QUICK',4,'9/5/1997','10/3/1997','9/8/1997',1,364.15,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10659,N'QUEEN',7,'9/5/1997','10/3/1997','9/10/1997',2,105.81,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10660,N'HUNGC',8,'9/8/1997','10/6/1997','10/15/1997',1,111.29,
	N'Hungry Coyote Import Store',N'City Center Plaza 516 Main St.',N'Elgin',
	N'OR',N'97827',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10661,N'HUNGO',7,'9/9/1997','10/7/1997','9/15/1997',3,17.55,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10662,N'LONEP',3,'9/9/1997','10/7/1997','9/18/1997',2,1.28,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10663,N'BONAP',2,'9/10/1997','9/24/1997','10/3/1997',2,113.15,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10664,N'FURIB',1,'9/10/1997','10/8/1997','9/19/1997',3,1.27,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10665,N'LONEP',1,'9/11/1997','10/9/1997','9/17/1997',2,26.31,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10666,N'RICSU',7,'9/12/1997','10/10/1997','9/22/1997',2,232.42,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10667,N'ERNSH',7,'9/12/1997','10/10/1997','9/19/1997',1,78.09,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10668,N'WANDK',1,'9/15/1997','10/13/1997','9/23/1997',2,47.22,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10669,N'SIMOB',2,'9/15/1997','10/13/1997','9/22/1997',1,24.39,
	N'Simons bistro',N'Vinbæltet 34',N'Kobenhavn',
	NULL,N'1734',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10670,N'FRANK',4,'9/16/1997','10/14/1997','9/18/1997',1,203.48,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10671,N'FRANR',1,'9/17/1997','10/15/1997','9/24/1997',1,30.34,
	N'France restauration',N'54, rue Royale',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10672,N'BERGS',9,'9/17/1997','10/1/1997','9/26/1997',2,95.75,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10673,N'WILMK',2,'9/18/1997','10/16/1997','9/19/1997',1,22.76,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10674,N'ISLAT',4,'9/18/1997','10/16/1997','9/30/1997',2,0.90,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10675,N'FRANK',5,'9/19/1997','10/17/1997','9/23/1997',2,31.85,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10676,N'TORTU',2,'9/22/1997','10/20/1997','9/29/1997',2,2.01,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10677,N'ANTON',1,'9/22/1997','10/20/1997','9/26/1997',3,4.03,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10678,N'SAVEA',7,'9/23/1997','10/21/1997','10/16/1997',3,388.98,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10679,N'BLONP',8,'9/23/1997','10/21/1997','9/30/1997',3,27.94,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10680,N'OLDWO',1,'9/24/1997','10/22/1997','9/26/1997',1,26.61,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10681,N'GREAL',3,'9/25/1997','10/23/1997','9/30/1997',3,76.13,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10682,N'ANTON',3,'9/25/1997','10/23/1997','10/1/1997',2,36.13,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10683,N'DUMON',2,'9/26/1997','10/24/1997','10/1/1997',1,4.40,
	N'Du monde entier',N'67, rue des Cinquante Otages',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10684,N'OTTIK',3,'9/26/1997','10/24/1997','9/30/1997',1,145.63,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10685,N'GOURL',4,'9/29/1997','10/13/1997','10/3/1997',2,33.75,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10686,N'PICCO',2,'9/30/1997','10/28/1997','10/8/1997',1,96.50,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10687,N'HUNGO',9,'9/30/1997','10/28/1997','10/30/1997',2,296.43,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10688,N'VAFFE',4,'10/1/1997','10/15/1997','10/7/1997',2,299.09,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10689,N'BERGS',1,'10/1/1997','10/29/1997','10/7/1997',2,13.42,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10690,N'HANAR',1,'10/2/1997','10/30/1997','10/3/1997',1,15.80,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10691,N'QUICK',2,'10/3/1997','11/14/1997','10/22/1997',2,810.05,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10692,N'ALFKI',4,'10/3/1997','10/31/1997','10/13/1997',2,61.02,
	N'Alfred''s Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10693,N'WHITC',3,'10/6/1997','10/20/1997','10/10/1997',3,139.34,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10694,N'QUICK',8,'10/6/1997','11/3/1997','10/9/1997',3,398.36,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10695,N'WILMK',7,'10/7/1997','11/18/1997','10/14/1997',1,16.72,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10696,N'WHITC',8,'10/8/1997','11/19/1997','10/14/1997',3,102.55,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10697,N'LINOD',3,'10/8/1997','11/5/1997','10/14/1997',1,45.52,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10698,N'ERNSH',4,'10/9/1997','11/6/1997','10/17/1997',1,272.47,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10699,N'MORGK',3,'10/9/1997','11/6/1997','10/13/1997',3,0.58,
	N'Morgenstern Gesundkost',N'Heerstr. 22',N'Leipzig',
	NULL,N'04179',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10700,N'SAVEA',3,'10/10/1997','11/7/1997','10/16/1997',1,65.10,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10701,N'HUNGO',6,'10/13/1997','10/27/1997','10/15/1997',3,220.31,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10702,N'ALFKI',4,'10/13/1997','11/24/1997','10/21/1997',1,23.94,
	N'Alfred''s Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10703,N'FOLKO',6,'10/14/1997','11/11/1997','10/20/1997',2,152.30,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10704,N'QUEEN',6,'10/14/1997','11/11/1997','11/7/1997',1,4.78,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10705,N'HILAA',9,'10/15/1997','11/12/1997','11/18/1997',2,3.52,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10706,N'OLDWO',8,'10/16/1997','11/13/1997','10/21/1997',3,135.63,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10707,N'AROUT',4,'10/16/1997','10/30/1997','10/23/1997',3,21.74,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10708,N'THEBI',6,'10/17/1997','11/28/1997','11/5/1997',2,2.96,
	N'The Big Cheese',N'89 Jefferson Way Suite 2',N'Portland',
	N'OR',N'97201',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10709,N'GOURL',1,'10/17/1997','11/14/1997','11/20/1997',3,210.80,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10710,N'FRANS',1,'10/20/1997','11/17/1997','10/23/1997',1,4.98,
	N'Franchi S.p.A.',N'Via Monte Bianco 34',N'Torino',
	NULL,N'10100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10711,N'SAVEA',5,'10/21/1997','12/2/1997','10/29/1997',2,52.41,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10712,N'HUNGO',3,'10/21/1997','11/18/1997','10/31/1997',1,89.93,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10713,N'SAVEA',1,'10/22/1997','11/19/1997','10/24/1997',1,167.05,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10714,N'SAVEA',5,'10/22/1997','11/19/1997','10/27/1997',3,24.49,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10715,N'BONAP',3,'10/23/1997','11/6/1997','10/29/1997',1,63.20,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10716,N'RANCH',4,'10/24/1997','11/21/1997','10/27/1997',2,22.57,
	N'Rancho grande',N'Av. del Libertador 900',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10717,N'FRANK',1,'10/24/1997','11/21/1997','10/29/1997',2,59.25,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10718,N'KOENE',1,'10/27/1997','11/24/1997','10/29/1997',3,170.88,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10719,N'LETSS',8,'10/27/1997','11/24/1997','11/5/1997',2,51.44,
	N'Let''s Stop N Shop',N'87 Polk St. Suite 5',N'San Francisco',
	N'CA',N'94117',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10720,N'QUEDE',8,'10/28/1997','11/11/1997','11/5/1997',2,9.53,
	N'Que Delícia',N'Rua da Panificadora, 12',N'Rio de Janeiro',
	N'RJ',N'02389-673',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10721,N'QUICK',5,'10/29/1997','11/26/1997','10/31/1997',3,48.92,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10722,N'SAVEA',8,'10/29/1997','12/10/1997','11/4/1997',1,74.58,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10723,N'WHITC',3,'10/30/1997','11/27/1997','11/25/1997',1,21.72,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10724,N'MEREP',8,'10/30/1997','12/11/1997','11/5/1997',2,57.75,
	N'Mère Paillarde',N'43 rue St. Laurent',N'Montréal',
	N'Québec',N'H1J 1C3',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10725,N'FAMIA',4,'10/31/1997','11/28/1997','11/5/1997',3,10.83,
	N'Familia Arquibaldo',N'Rua Orós, 92',N'Sao Paulo',
	N'SP',N'05442-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10726,N'EASTC',4,'11/3/1997','11/17/1997','12/5/1997',1,16.56,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10727,N'REGGC',2,'11/3/1997','12/1/1997','12/5/1997',1,89.90,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10728,N'QUEEN',4,'11/4/1997','12/2/1997','11/11/1997',2,58.33,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10729,N'LINOD',8,'11/4/1997','12/16/1997','11/14/1997',3,141.06,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10730,N'BONAP',5,'11/5/1997','12/3/1997','11/14/1997',1,20.12,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10731,N'CHOPS',7,'11/6/1997','12/4/1997','11/14/1997',1,96.65,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10732,N'BONAP',3,'11/6/1997','12/4/1997','11/7/1997',1,16.97,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10733,N'BERGS',1,'11/7/1997','12/5/1997','11/10/1997',3,110.11,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10734,N'GOURL',2,'11/7/1997','12/5/1997','11/12/1997',3,1.63,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10735,N'LETSS',6,'11/10/1997','12/8/1997','11/21/1997',2,45.97,
	N'Let''s Stop N Shop',N'87 Polk St. Suite 5',N'San Francisco',
	N'CA',N'94117',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10736,N'HUNGO',9,'11/11/1997','12/9/1997','11/21/1997',2,44.10,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10737,N'VINET',2,'11/11/1997','12/9/1997','11/18/1997',2,7.79,
	N'Vins et alcools Chevalier',N'59 rue de l''Abbaye',N'Reims',
	NULL,N'51100',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10738,N'SPECD',2,'11/12/1997','12/10/1997','11/18/1997',1,2.91,
	N'Spécialités du monde',N'25, rue Lauriston',N'Paris',
	NULL,N'75016',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10739,N'VINET',3,'11/12/1997','12/10/1997','11/17/1997',3,11.08,
	N'Vins et alcools Chevalier',N'59 rue de l''Abbaye',N'Reims',
	NULL,N'51100',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10740,N'WHITC',4,'11/13/1997','12/11/1997','11/25/1997',2,81.88,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10741,N'AROUT',4,'11/14/1997','11/28/1997','11/18/1997',3,10.96,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10742,N'BOTTM',3,'11/14/1997','12/12/1997','11/18/1997',3,243.73,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10743,N'AROUT',1,'11/17/1997','12/15/1997','11/21/1997',2,23.72,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10744,N'VAFFE',6,'11/17/1997','12/15/1997','11/24/1997',1,69.19,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10745,N'QUICK',9,'11/18/1997','12/16/1997','11/27/1997',1,3.52,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10746,N'CHOPS',1,'11/19/1997','12/17/1997','11/21/1997',3,31.43,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10747,N'PICCO',6,'11/19/1997','12/17/1997','11/26/1997',1,117.33,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10748,N'SAVEA',3,'11/20/1997','12/18/1997','11/28/1997',1,232.55,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10749,N'ISLAT',4,'11/20/1997','12/18/1997','12/19/1997',2,61.53,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10750,N'WARTH',9,'11/21/1997','12/19/1997','11/24/1997',1,79.30,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10751,N'RICSU',3,'11/24/1997','12/22/1997','12/3/1997',3,130.79,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10752,N'NORTS',2,'11/24/1997','12/22/1997','11/28/1997',3,1.39,
	N'North/South',N'South House 300 Queensbridge',N'London',
	NULL,N'SW7 1RZ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10753,N'FRANS',3,'11/25/1997','12/23/1997','11/27/1997',1,7.70,
	N'Franchi S.p.A.',N'Via Monte Bianco 34',N'Torino',
	NULL,N'10100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10754,N'MAGAA',6,'11/25/1997','12/23/1997','11/27/1997',3,2.38,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10755,N'BONAP',4,'11/26/1997','12/24/1997','11/28/1997',2,16.71,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10756,N'SPLIR',8,'11/27/1997','12/25/1997','12/2/1997',2,73.21,
	N'Split Rail Beer & Ale',N'P.O. Box 555',N'Lander',
	N'WY',N'82520',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10757,N'SAVEA',6,'11/27/1997','12/25/1997','12/15/1997',1,8.19,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10758,N'RICSU',3,'11/28/1997','12/26/1997','12/4/1997',3,138.17,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10759,N'ANATR',3,'11/28/1997','12/26/1997','12/12/1997',3,11.99,
	N'Ana Trujillo Emparedados y helados',N'Avda. de la Constitución 2222',N'México D.F.',
	NULL,N'05021',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10760,N'MAISD',4,'12/1/1997','12/29/1997','12/10/1997',1,155.64,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10761,N'RATTC',5,'12/2/1997','12/30/1997','12/8/1997',2,18.66,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10762,N'FOLKO',3,'12/2/1997','12/30/1997','12/9/1997',1,328.74,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10763,N'FOLIG',3,'12/3/1997','12/31/1997','12/8/1997',3,37.35,
	N'Folies gourmandes',N'184, chaussée de Tournai',N'Lille',
	NULL,N'59000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10764,N'ERNSH',6,'12/3/1997','12/31/1997','12/8/1997',3,145.45,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10765,N'QUICK',3,'12/4/1997','1/1/1998','12/9/1997',3,42.74,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10766,N'OTTIK',4,'12/5/1997','1/2/1998','12/9/1997',1,157.55,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10767,N'SUPRD',4,'12/5/1997','1/2/1998','12/15/1997',3,1.59,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10768,N'AROUT',3,'12/8/1997','1/5/1998','12/15/1997',2,146.32,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10769,N'VAFFE',3,'12/8/1997','1/5/1998','12/12/1997',1,65.06,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10770,N'HANAR',8,'12/9/1997','1/6/1998','12/17/1997',3,5.32,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10771,N'ERNSH',9,'12/10/1997','1/7/1998','1/2/1998',2,11.19,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10772,N'LEHMS',3,'12/10/1997','1/7/1998','12/19/1997',2,91.28,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10773,N'ERNSH',1,'12/11/1997','1/8/1998','12/16/1997',3,96.43,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10774,N'FOLKO',4,'12/11/1997','12/25/1997','12/12/1997',1,48.20,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10775,N'THECR',7,'12/12/1997','1/9/1998','12/26/1997',1,20.25,
	N'The Cracker Box',N'55 Grizzly Peak Rd.',N'Butte',
	N'MT',N'59801',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10776,N'ERNSH',1,'12/15/1997','1/12/1998','12/18/1997',3,351.53,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10777,N'GOURL',7,'12/15/1997','12/29/1997','1/21/1998',2,3.01,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10778,N'BERGS',3,'12/16/1997','1/13/1998','12/24/1997',1,6.79,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10779,N'MORGK',3,'12/16/1997','1/13/1998','1/14/1998',2,58.13,
	N'Morgenstern Gesundkost',N'Heerstr. 22',N'Leipzig',
	NULL,N'04179',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10780,N'LILAS',2,'12/16/1997','12/30/1997','12/25/1997',1,42.13,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10781,N'WARTH',2,'12/17/1997','1/14/1998','12/19/1997',3,73.16,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10782,N'CACTU',9,'12/17/1997','1/14/1998','12/22/1997',3,1.10,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10783,N'HANAR',4,'12/18/1997','1/15/1998','12/19/1997',2,124.98,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10784,N'MAGAA',4,'12/18/1997','1/15/1998','12/22/1997',3,70.09,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10785,N'GROSR',1,'12/18/1997','1/15/1998','12/24/1997',3,1.51,
	N'GROSELLA-Restaurante',N'5ª Ave. Los Palos Grandes',N'Caracas',
	N'DF',N'1081',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10786,N'QUEEN',8,'12/19/1997','1/16/1998','12/23/1997',1,110.87,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10787,N'LAMAI',2,'12/19/1997','1/2/1998','12/26/1997',1,249.93,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10788,N'QUICK',1,'12/22/1997','1/19/1998','1/19/1998',2,42.70,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10789,N'FOLIG',1,'12/22/1997','1/19/1998','12/31/1997',2,100.60,
	N'Folies gourmandes',N'184, chaussée de Tournai',N'Lille',
	NULL,N'59000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10790,N'GOURL',6,'12/22/1997','1/19/1998','12/26/1997',1,28.23,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10791,N'FRANK',6,'12/23/1997','1/20/1998','1/1/1998',2,16.85,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10792,N'WOLZA',1,'12/23/1997','1/20/1998','12/31/1997',3,23.79,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10793,N'AROUT',3,'12/24/1997','1/21/1998','1/8/1998',3,4.52,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10794,N'QUEDE',6,'12/24/1997','1/21/1998','1/2/1998',1,21.49,
	N'Que Delícia',N'Rua da Panificadora, 12',N'Rio de Janeiro',
	N'RJ',N'02389-673',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10795,N'ERNSH',8,'12/24/1997','1/21/1998','1/20/1998',2,126.66,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10796,N'HILAA',3,'12/25/1997','1/22/1998','1/14/1998',1,26.52,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10797,N'DRACD',7,'12/25/1997','1/22/1998','1/5/1998',2,33.35,
	N'Drachenblut Delikatessen',N'Walserweg 21',N'Aachen',
	NULL,N'52066',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10798,N'ISLAT',2,'12/26/1997','1/23/1998','1/5/1998',1,2.33,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10799,N'KOENE',9,'12/26/1997','2/6/1998','1/5/1998',3,30.76,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10800,N'SEVES',1,'12/26/1997','1/23/1998','1/5/1998',3,137.44,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10801,N'BOLID',4,'12/29/1997','1/26/1998','12/31/1997',2,97.09,
	N'Bólido Comidas preparadas',N'C/ Araquil, 67',N'Madrid',
	NULL,N'28023',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10802,N'SIMOB',4,'12/29/1997','1/26/1998','1/2/1998',2,257.26,
	N'Simons bistro',N'Vinbæltet 34',N'Kobenhavn',
	NULL,N'1734',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10803,N'WELLI',4,'12/30/1997','1/27/1998','1/6/1998',1,55.23,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10804,N'SEVES',6,'12/30/1997','1/27/1998','1/7/1998',2,27.33,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10805,N'THEBI',2,'12/30/1997','1/27/1998','1/9/1998',3,237.34,
	N'The Big Cheese',N'89 Jefferson Way Suite 2',N'Portland',
	N'OR',N'97201',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10806,N'VICTE',3,'12/31/1997','1/28/1998','1/5/1998',2,22.11,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10807,N'FRANS',4,'12/31/1997','1/28/1998','1/30/1998',1,1.36,
	N'Franchi S.p.A.',N'Via Monte Bianco 34',N'Torino',
	NULL,N'10100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10808,N'OLDWO',2,'1/1/1998','1/29/1998','1/9/1998',3,45.53,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10809,N'WELLI',7,'1/1/1998','1/29/1998','1/7/1998',1,4.87,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10810,N'LAUGB',2,'1/1/1998','1/29/1998','1/7/1998',3,4.33,
	N'Laughing Bacchus Wine Cellars',N'2319 Elm St.',N'Vancouver',
	N'BC',N'V3F 2K1',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10811,N'LINOD',8,'1/2/1998','1/30/1998','1/8/1998',1,31.22,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10812,N'REGGC',5,'1/2/1998','1/30/1998','1/12/1998',1,59.78,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10813,N'RICAR',1,'1/5/1998','2/2/1998','1/9/1998',1,47.38,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10814,N'VICTE',3,'1/5/1998','2/2/1998','1/14/1998',3,130.94,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10815,N'SAVEA',2,'1/5/1998','2/2/1998','1/14/1998',3,14.62,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10816,N'GREAL',4,'1/6/1998','2/3/1998','2/4/1998',2,719.78,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10817,N'KOENE',3,'1/6/1998','1/20/1998','1/13/1998',2,306.07,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10818,N'MAGAA',7,'1/7/1998','2/4/1998','1/12/1998',3,65.48,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10819,N'CACTU',2,'1/7/1998','2/4/1998','1/16/1998',3,19.76,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10820,N'RATTC',3,'1/7/1998','2/4/1998','1/13/1998',2,37.52,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10821,N'SPLIR',1,'1/8/1998','2/5/1998','1/15/1998',1,36.68,
	N'Split Rail Beer & Ale',N'P.O. Box 555',N'Lander',
	N'WY',N'82520',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10822,N'TRAIH',6,'1/8/1998','2/5/1998','1/16/1998',3,7.00,
	N'Trail''s Head Gourmet Provisioners',N'722 DaVinci Blvd.',N'Kirkland',
	N'WA',N'98034',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10823,N'LILAS',5,'1/9/1998','2/6/1998','1/13/1998',2,163.97,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10824,N'FOLKO',8,'1/9/1998','2/6/1998','1/30/1998',1,1.23,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10825,N'DRACD',1,'1/9/1998','2/6/1998','1/14/1998',1,79.25,
	N'Drachenblut Delikatessen',N'Walserweg 21',N'Aachen',
	NULL,N'52066',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10826,N'BLONP',6,'1/12/1998','2/9/1998','2/6/1998',1,7.09,
	N'Blondel père et fils',N'24, place Kléber',N'Strasbourg',
	NULL,N'67000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10827,N'BONAP',1,'1/12/1998','1/26/1998','2/6/1998',2,63.54,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10828,N'RANCH',9,'1/13/1998','1/27/1998','2/4/1998',1,90.85,
	N'Rancho grande',N'Av. del Libertador 900',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10829,N'ISLAT',9,'1/13/1998','2/10/1998','1/23/1998',1,154.72,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10830,N'TRADH',4,'1/13/1998','2/24/1998','1/21/1998',2,81.83,
	N'Tradiçao Hipermercados',N'Av. Inês de Castro, 414',N'Sao Paulo',
	N'SP',N'05634-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10831,N'SANTG',3,'1/14/1998','2/11/1998','1/23/1998',2,72.19,
	N'Santé Gourmet',N'Erling Skakkes gate 78',N'Stavern',
	NULL,N'4110',N'Norway')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10832,N'LAMAI',2,'1/14/1998','2/11/1998','1/19/1998',2,43.26,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10833,N'OTTIK',6,'1/15/1998','2/12/1998','1/23/1998',2,71.49,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10834,N'TRADH',1,'1/15/1998','2/12/1998','1/19/1998',3,29.78,
	N'Tradiçao Hipermercados',N'Av. Inês de Castro, 414',N'Sao Paulo',
	N'SP',N'05634-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10835,N'ALFKI',1,'1/15/1998','2/12/1998','1/21/1998',3,69.53,
	N'Alfred''s Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10836,N'ERNSH',7,'1/16/1998','2/13/1998','1/21/1998',1,411.88,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10837,N'BERGS',9,'1/16/1998','2/13/1998','1/23/1998',3,13.32,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10838,N'LINOD',3,'1/19/1998','2/16/1998','1/23/1998',3,59.28,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10839,N'TRADH',3,'1/19/1998','2/16/1998','1/22/1998',3,35.43,
	N'Tradiçao Hipermercados',N'Av. Inês de Castro, 414',N'Sao Paulo',
	N'SP',N'05634-030',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10840,N'LINOD',4,'1/19/1998','3/2/1998','2/16/1998',2,2.71,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10841,N'SUPRD',5,'1/20/1998','2/17/1998','1/29/1998',2,424.30,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10842,N'TORTU',1,'1/20/1998','2/17/1998','1/29/1998',3,54.42,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10843,N'VICTE',4,'1/21/1998','2/18/1998','1/26/1998',2,9.26,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10844,N'PICCO',8,'1/21/1998','2/18/1998','1/26/1998',2,25.22,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10845,N'QUICK',8,'1/21/1998','2/4/1998','1/30/1998',1,212.98,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10846,N'SUPRD',2,'1/22/1998','3/5/1998','1/23/1998',3,56.46,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10847,N'SAVEA',4,'1/22/1998','2/5/1998','2/10/1998',3,487.57,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10848,N'CONSH',7,'1/23/1998','2/20/1998','1/29/1998',2,38.24,
	N'Consolidated Holdings',N'Berkeley Gardens 12  Brewery',N'London',
	NULL,N'WX1 6LT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10849,N'KOENE',9,'1/23/1998','2/20/1998','1/30/1998',2,0.56,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10850,N'VICTE',1,'1/23/1998','3/6/1998','1/30/1998',1,49.19,
	N'Victuailles en stock',N'2, rue du Commerce',N'Lyon',
	NULL,N'69004',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10851,N'RICAR',5,'1/26/1998','2/23/1998','2/2/1998',1,160.55,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10852,N'RATTC',8,'1/26/1998','2/9/1998','1/30/1998',1,174.05,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10853,N'BLAUS',9,'1/27/1998','2/24/1998','2/3/1998',2,53.83,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10854,N'ERNSH',3,'1/27/1998','2/24/1998','2/5/1998',2,100.22,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10855,N'OLDWO',3,'1/27/1998','2/24/1998','2/4/1998',1,170.97,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10856,N'ANTON',3,'1/28/1998','2/25/1998','2/10/1998',2,58.43,
	N'Antonio Moreno Taquería',N'Mataderos  2312',N'México D.F.',
	NULL,N'05023',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10857,N'BERGS',8,'1/28/1998','2/25/1998','2/6/1998',2,188.85,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10858,N'LACOR',2,'1/29/1998','2/26/1998','2/3/1998',1,52.51,
	N'La corne d''abondance',N'67, avenue de l''Europe',N'Versailles',
	NULL,N'78000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10859,N'FRANK',1,'1/29/1998','2/26/1998','2/2/1998',2,76.10,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10860,N'FRANR',3,'1/29/1998','2/26/1998','2/4/1998',3,19.26,
	N'France restauration',N'54, rue Royale',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10861,N'WHITC',4,'1/30/1998','2/27/1998','2/17/1998',2,14.93,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10862,N'LEHMS',8,'1/30/1998','3/13/1998','2/2/1998',2,53.23,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10863,N'HILAA',4,'2/2/1998','3/2/1998','2/17/1998',2,30.26,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10864,N'AROUT',4,'2/2/1998','3/2/1998','2/9/1998',2,3.04,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10865,N'QUICK',2,'2/2/1998','2/16/1998','2/12/1998',1,348.14,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10866,N'BERGS',5,'2/3/1998','3/3/1998','2/12/1998',1,109.11,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10867,N'LONEP',6,'2/3/1998','3/17/1998','2/11/1998',1,1.93,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10868,N'QUEEN',7,'2/4/1998','3/4/1998','2/23/1998',2,191.27,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10869,N'SEVES',5,'2/4/1998','3/4/1998','2/9/1998',1,143.28,
	N'Seven Seas Imports',N'90 Wadhurst Rd.',N'London',
	NULL,N'OX15 4NB',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10870,N'WOLZA',5,'2/4/1998','3/4/1998','2/13/1998',3,12.04,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10871,N'BONAP',9,'2/5/1998','3/5/1998','2/10/1998',2,112.27,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10872,N'GODOS',5,'2/5/1998','3/5/1998','2/9/1998',2,175.32,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10873,N'WILMK',4,'2/6/1998','3/6/1998','2/9/1998',1,0.82,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10874,N'GODOS',5,'2/6/1998','3/6/1998','2/11/1998',2,19.58,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10875,N'BERGS',4,'2/6/1998','3/6/1998','3/3/1998',2,32.37,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10876,N'BONAP',7,'2/9/1998','3/9/1998','2/12/1998',3,60.42,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10877,N'RICAR',1,'2/9/1998','3/9/1998','2/19/1998',1,38.06,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10878,N'QUICK',4,'2/10/1998','3/10/1998','2/12/1998',1,46.69,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10879,N'WILMK',3,'2/10/1998','3/10/1998','2/12/1998',3,8.50,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10880,N'FOLKO',7,'2/10/1998','3/24/1998','2/18/1998',1,88.01,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10881,N'CACTU',4,'2/11/1998','3/11/1998','2/18/1998',1,2.84,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10882,N'SAVEA',4,'2/11/1998','3/11/1998','2/20/1998',3,23.10,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10883,N'LONEP',8,'2/12/1998','3/12/1998','2/20/1998',3,0.53,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10884,N'LETSS',4,'2/12/1998','3/12/1998','2/13/1998',2,90.97,
	N'Let''s Stop N Shop',N'87 Polk St. Suite 5',N'San Francisco',
	N'CA',N'94117',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10885,N'SUPRD',6,'2/12/1998','3/12/1998','2/18/1998',3,5.64,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10886,N'HANAR',1,'2/13/1998','3/13/1998','3/2/1998',1,4.99,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10887,N'GALED',8,'2/13/1998','3/13/1998','2/16/1998',3,1.25,
	N'Galería del gastronómo',N'Rambla de Cataluña, 23',N'Barcelona',
	NULL,N'8022',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10888,N'GODOS',1,'2/16/1998','3/16/1998','2/23/1998',2,51.87,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10889,N'RATTC',9,'2/16/1998','3/16/1998','2/23/1998',3,280.61,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10890,N'DUMON',7,'2/16/1998','3/16/1998','2/18/1998',1,32.76,
	N'Du monde entier',N'67, rue des Cinquante Otages',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10891,N'LEHMS',7,'2/17/1998','3/17/1998','2/19/1998',2,20.37,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10892,N'MAISD',4,'2/17/1998','3/17/1998','2/19/1998',2,120.27,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10893,N'KOENE',9,'2/18/1998','3/18/1998','2/20/1998',2,77.78,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10894,N'SAVEA',1,'2/18/1998','3/18/1998','2/20/1998',1,116.13,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10895,N'ERNSH',3,'2/18/1998','3/18/1998','2/23/1998',1,162.75,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10896,N'MAISD',7,'2/19/1998','3/19/1998','2/27/1998',3,32.45,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10897,N'HUNGO',3,'2/19/1998','3/19/1998','2/25/1998',2,603.54,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10898,N'OCEAN',4,'2/20/1998','3/20/1998','3/6/1998',2,1.27,
	N'Océano Atlántico Ltda.',N'Ing. Gustavo Moncada 8585 Piso 20-A',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10899,N'LILAS',5,'2/20/1998','3/20/1998','2/26/1998',3,1.21,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10900,N'WELLI',1,'2/20/1998','3/20/1998','3/4/1998',2,1.66,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10901,N'HILAA',4,'2/23/1998','3/23/1998','2/26/1998',1,62.09,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10902,N'FOLKO',1,'2/23/1998','3/23/1998','3/3/1998',1,44.15,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10903,N'HANAR',3,'2/24/1998','3/24/1998','3/4/1998',3,36.71,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10904,N'WHITC',3,'2/24/1998','3/24/1998','2/27/1998',3,162.95,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10905,N'WELLI',9,'2/24/1998','3/24/1998','3/6/1998',2,13.72,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10906,N'WOLZA',4,'2/25/1998','3/11/1998','3/3/1998',3,26.29,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10907,N'SPECD',6,'2/25/1998','3/25/1998','2/27/1998',3,9.19,
	N'Spécialités du monde',N'25, rue Lauriston',N'Paris',
	NULL,N'75016',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10908,N'REGGC',4,'2/26/1998','3/26/1998','3/6/1998',2,32.96,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10909,N'SANTG',1,'2/26/1998','3/26/1998','3/10/1998',2,53.05,
	N'Santé Gourmet',N'Erling Skakkes gate 78',N'Stavern',
	NULL,N'4110',N'Norway')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10910,N'WILMK',1,'2/26/1998','3/26/1998','3/4/1998',3,38.11,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10911,N'GODOS',3,'2/26/1998','3/26/1998','3/5/1998',1,38.19,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10912,N'HUNGO',2,'2/26/1998','3/26/1998','3/18/1998',2,580.91,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10913,N'QUEEN',4,'2/26/1998','3/26/1998','3/4/1998',1,33.05,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10914,N'QUEEN',6,'2/27/1998','3/27/1998','3/2/1998',1,21.19,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10915,N'TORTU',2,'2/27/1998','3/27/1998','3/2/1998',2,3.51,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10916,N'RANCH',1,'2/27/1998','3/27/1998','3/9/1998',2,63.77,
	N'Rancho grande',N'Av. del Libertador 900',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10917,N'ROMEY',4,'3/2/1998','3/30/1998','3/11/1998',2,8.29,
	N'Romero y tomillo',N'Gran Vía, 1',N'Madrid',
	NULL,N'28001',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10918,N'BOTTM',3,'3/2/1998','3/30/1998','3/11/1998',3,48.83,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10919,N'LINOD',2,'3/2/1998','3/30/1998','3/4/1998',2,19.80,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10920,N'AROUT',4,'3/3/1998','3/31/1998','3/9/1998',2,29.61,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10921,N'VAFFE',1,'3/3/1998','4/14/1998','3/9/1998',1,176.48,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10922,N'HANAR',5,'3/3/1998','3/31/1998','3/5/1998',3,62.74,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10923,N'LAMAI',7,'3/3/1998','4/14/1998','3/13/1998',3,68.26,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10924,N'BERGS',3,'3/4/1998','4/1/1998','4/8/1998',2,151.52,
	N'Berglunds snabbköp',N'Berguvsvägen  8',N'Luleå',
	NULL,N'S-958 22',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10925,N'HANAR',3,'3/4/1998','4/1/1998','3/13/1998',1,2.27,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10926,N'ANATR',4,'3/4/1998','4/1/1998','3/11/1998',3,39.92,
	N'Ana Trujillo Emparedados y helados',N'Avda. de la Constitución 2222',N'México D.F.',
	NULL,N'05021',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10927,N'LACOR',4,'3/5/1998','4/2/1998','4/8/1998',1,19.79,
	N'La corne d''abondance',N'67, avenue de l''Europe',N'Versailles',
	NULL,N'78000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10928,N'GALED',1,'3/5/1998','4/2/1998','3/18/1998',1,1.36,
	N'Galería del gastronómo',N'Rambla de Cataluña, 23',N'Barcelona',
	NULL,N'8022',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10929,N'FRANK',6,'3/5/1998','4/2/1998','3/12/1998',1,33.93,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10930,N'SUPRD',4,'3/6/1998','4/17/1998','3/18/1998',3,15.55,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10931,N'RICSU',4,'3/6/1998','3/20/1998','3/19/1998',2,13.60,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10932,N'BONAP',8,'3/6/1998','4/3/1998','3/24/1998',1,134.64,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10933,N'ISLAT',6,'3/6/1998','4/3/1998','3/16/1998',3,54.15,
	N'Island Trading',N'Garden House Crowther Way',N'Cowes',
	N'Isle of Wight',N'PO31 7PJ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10934,N'LEHMS',3,'3/9/1998','4/6/1998','3/12/1998',3,32.01,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10935,N'WELLI',4,'3/9/1998','4/6/1998','3/18/1998',3,47.59,
	N'Wellington Importadora',N'Rua do Mercado, 12',N'Resende',
	N'SP',N'08737-363',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10936,N'GREAL',3,'3/9/1998','4/6/1998','3/18/1998',2,33.68,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10937,N'CACTU',7,'3/10/1998','3/24/1998','3/13/1998',3,31.51,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10938,N'QUICK',3,'3/10/1998','4/7/1998','3/16/1998',2,31.89,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10939,N'MAGAA',2,'3/10/1998','4/7/1998','3/13/1998',2,76.33,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10940,N'BONAP',8,'3/11/1998','4/8/1998','3/23/1998',3,19.77,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10941,N'SAVEA',7,'3/11/1998','4/8/1998','3/20/1998',2,400.81,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10942,N'REGGC',9,'3/11/1998','4/8/1998','3/18/1998',3,17.95,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10943,N'BSBEV',4,'3/11/1998','4/8/1998','3/19/1998',2,2.17,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10944,N'BOTTM',6,'3/12/1998','3/26/1998','3/13/1998',3,52.92,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10945,N'MORGK',4,'3/12/1998','4/9/1998','3/18/1998',1,10.22,
	N'Morgenstern Gesundkost',N'Heerstr. 22',N'Leipzig',
	NULL,N'04179',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10946,N'VAFFE',1,'3/12/1998','4/9/1998','3/19/1998',2,27.20,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10947,N'BSBEV',3,'3/13/1998','4/10/1998','3/16/1998',2,3.26,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10948,N'GODOS',3,'3/13/1998','4/10/1998','3/19/1998',3,23.39,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10949,N'BOTTM',2,'3/13/1998','4/10/1998','3/17/1998',3,74.44,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10950,N'MAGAA',1,'3/16/1998','4/13/1998','3/23/1998',2,2.50,
	N'Magazzini Alimentari Riuniti',N'Via Ludovico il Moro 22',N'Bergamo',
	NULL,N'24100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10951,N'RICSU',9,'3/16/1998','4/27/1998','4/7/1998',2,30.85,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10952,N'ALFKI',1,'3/16/1998','4/27/1998','3/24/1998',1,40.42,
	N'Alfred''s Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10953,N'AROUT',9,'3/16/1998','3/30/1998','3/25/1998',2,23.72,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10954,N'LINOD',5,'3/17/1998','4/28/1998','3/20/1998',1,27.91,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10955,N'FOLKO',8,'3/17/1998','4/14/1998','3/20/1998',2,3.26,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10956,N'BLAUS',6,'3/17/1998','4/28/1998','3/20/1998',2,44.65,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10957,N'HILAA',8,'3/18/1998','4/15/1998','3/27/1998',3,105.36,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10958,N'OCEAN',7,'3/18/1998','4/15/1998','3/27/1998',2,49.56,
	N'Océano Atlántico Ltda.',N'Ing. Gustavo Moncada 8585 Piso 20-A',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10959,N'GOURL',6,'3/18/1998','4/29/1998','3/23/1998',2,4.98,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10960,N'HILAA',3,'3/19/1998','4/2/1998','4/8/1998',1,2.08,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10961,N'QUEEN',8,'3/19/1998','4/16/1998','3/30/1998',1,104.47,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10962,N'QUICK',8,'3/19/1998','4/16/1998','3/23/1998',2,275.79,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10963,N'FURIB',9,'3/19/1998','4/16/1998','3/26/1998',3,2.70,
	N'Furia Bacalhau e Frutos do Mar',N'Jardim das rosas n. 32',N'Lisboa',
	NULL,N'1675',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10964,N'SPECD',3,'3/20/1998','4/17/1998','3/24/1998',2,87.38,
	N'Spécialités du monde',N'25, rue Lauriston',N'Paris',
	NULL,N'75016',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10965,N'OLDWO',6,'3/20/1998','4/17/1998','3/30/1998',3,144.38,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10966,N'CHOPS',4,'3/20/1998','4/17/1998','4/8/1998',1,27.19,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10967,N'TOMSP',2,'3/23/1998','4/20/1998','4/2/1998',2,62.22,
	N'Toms Spezialitäten',N'Luisenstr. 48',N'Münster',
	NULL,N'44087',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10968,N'ERNSH',1,'3/23/1998','4/20/1998','4/1/1998',3,74.60,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10969,N'COMMI',1,'3/23/1998','4/20/1998','3/30/1998',2,0.21,
	N'Comércio Mineiro',N'Av. dos Lusíadas, 23',N'Sao Paulo',
	N'SP',N'05432-043',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10970,N'BOLID',9,'3/24/1998','4/7/1998','4/24/1998',1,16.16,
	N'Bólido Comidas preparadas',N'C/ Araquil, 67',N'Madrid',
	NULL,N'28023',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10971,N'FRANR',2,'3/24/1998','4/21/1998','4/2/1998',2,121.82,
	N'France restauration',N'54, rue Royale',N'Nantes',
	NULL,N'44000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10972,N'LACOR',4,'3/24/1998','4/21/1998','3/26/1998',2,0.02,
	N'La corne d''abondance',N'67, avenue de l''Europe',N'Versailles',
	NULL,N'78000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10973,N'LACOR',6,'3/24/1998','4/21/1998','3/27/1998',2,15.17,
	N'La corne d''abondance',N'67, avenue de l''Europe',N'Versailles',
	NULL,N'78000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10974,N'SPLIR',3,'3/25/1998','4/8/1998','4/3/1998',3,12.96,
	N'Split Rail Beer & Ale',N'P.O. Box 555',N'Lander',
	N'WY',N'82520',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10975,N'BOTTM',1,'3/25/1998','4/22/1998','3/27/1998',3,32.27,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10976,N'HILAA',1,'3/25/1998','5/6/1998','4/3/1998',1,37.97,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10977,N'FOLKO',8,'3/26/1998','4/23/1998','4/10/1998',3,208.50,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10978,N'MAISD',9,'3/26/1998','4/23/1998','4/23/1998',2,32.82,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10979,N'ERNSH',8,'3/26/1998','4/23/1998','3/31/1998',2,353.07,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10980,N'FOLKO',4,'3/27/1998','5/8/1998','4/17/1998',1,1.26,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10981,N'HANAR',1,'3/27/1998','4/24/1998','4/2/1998',2,193.37,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10982,N'BOTTM',2,'3/27/1998','4/24/1998','4/8/1998',1,14.01,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10983,N'SAVEA',2,'3/27/1998','4/24/1998','4/6/1998',2,657.54,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10984,N'SAVEA',1,'3/30/1998','4/27/1998','4/3/1998',3,211.22,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10985,N'HUNGO',2,'3/30/1998','4/27/1998','4/2/1998',1,91.51,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10986,N'OCEAN',8,'3/30/1998','4/27/1998','4/21/1998',2,217.86,
	N'Océano Atlántico Ltda.',N'Ing. Gustavo Moncada 8585 Piso 20-A',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10987,N'EASTC',8,'3/31/1998','4/28/1998','4/6/1998',1,185.48,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10988,N'RATTC',3,'3/31/1998','4/28/1998','4/10/1998',2,61.14,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10989,N'QUEDE',2,'3/31/1998','4/28/1998','4/2/1998',1,34.76,
	N'Que Delícia',N'Rua da Panificadora, 12',N'Rio de Janeiro',
	N'RJ',N'02389-673',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10990,N'ERNSH',2,'4/1/1998','5/13/1998','4/7/1998',3,117.61,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10991,N'QUICK',1,'4/1/1998','4/29/1998','4/7/1998',1,38.51,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10992,N'THEBI',1,'4/1/1998','4/29/1998','4/3/1998',3,4.27,
	N'The Big Cheese',N'89 Jefferson Way Suite 2',N'Portland',
	N'OR',N'97201',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10993,N'FOLKO',7,'4/1/1998','4/29/1998','4/10/1998',3,8.81,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10994,N'VAFFE',2,'4/2/1998','4/16/1998','4/9/1998',3,65.53,
	N'Vaffeljernet',N'Smagsloget 45',N'Århus',
	NULL,N'8200',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10995,N'PERIC',1,'4/2/1998','4/30/1998','4/6/1998',3,46.00,
	N'Pericles Comidas clásicas',N'Calle Dr. Jorge Cash 321',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10996,N'QUICK',4,'4/2/1998','4/30/1998','4/10/1998',2,1.12,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10997,N'LILAS',8,'4/3/1998','5/15/1998','4/13/1998',2,73.91,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10998,N'WOLZA',8,'4/3/1998','4/17/1998','4/17/1998',2,20.31,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (10999,N'OTTIK',6,'4/3/1998','5/1/1998','4/10/1998',2,96.35,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11000,N'RATTC',2,'4/6/1998','5/4/1998','4/14/1998',3,55.12,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11001,N'FOLKO',2,'4/6/1998','5/4/1998','4/14/1998',2,197.30,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11002,N'SAVEA',4,'4/6/1998','5/4/1998','4/16/1998',1,141.16,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11003,N'THECR',3,'4/6/1998','5/4/1998','4/8/1998',3,14.91,
	N'The Cracker Box',N'55 Grizzly Peak Rd.',N'Butte',
	N'MT',N'59801',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11004,N'MAISD',3,'4/7/1998','5/5/1998','4/20/1998',1,44.84,
	N'Maison Dewey',N'Rue Joseph-Bens 532',N'Bruxelles',
	NULL,N'B-1180',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11005,N'WILMK',2,'4/7/1998','5/5/1998','4/10/1998',1,0.75,
	N'Wilman Kala',N'Keskuskatu 45',N'Helsinki',
	NULL,N'21240',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11006,N'GREAL',3,'4/7/1998','5/5/1998','4/15/1998',2,25.19,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11007,N'PRINI',8,'4/8/1998','5/6/1998','4/13/1998',2,202.24,
	N'Princesa Isabel Vinhos',N'Estrada da saúde n. 58',N'Lisboa',
	NULL,N'1756',N'Portugal')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11008,N'ERNSH',7,'4/8/1998','5/6/1998',NULL,3,79.46,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11009,N'GODOS',2,'4/8/1998','5/6/1998','4/10/1998',1,59.11,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11010,N'REGGC',2,'4/9/1998','5/7/1998','4/21/1998',2,28.71,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11011,N'ALFKI',3,'4/9/1998','5/7/1998','4/13/1998',1,1.21,
	N'Alfred''s Futterkiste',N'Obere Str. 57',N'Berlin',
	NULL,N'12209',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11012,N'FRANK',1,'4/9/1998','4/23/1998','4/17/1998',3,242.95,
	N'Frankenversand',N'Berliner Platz 43',N'München',
	NULL,N'80805',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11013,N'ROMEY',2,'4/9/1998','5/7/1998','4/10/1998',1,32.99,
	N'Romero y tomillo',N'Gran Vía, 1',N'Madrid',
	NULL,N'28001',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11014,N'LINOD',2,'4/10/1998','5/8/1998','4/15/1998',3,23.60,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11015,N'SANTG',2,'4/10/1998','4/24/1998','4/20/1998',2,4.62,
	N'Santé Gourmet',N'Erling Skakkes gate 78',N'Stavern',
	NULL,N'4110',N'Norway')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11016,N'AROUT',9,'4/10/1998','5/8/1998','4/13/1998',2,33.80,
	N'Around the Horn',N'Brook Farm Stratford St. Mary',N'Colchester',
	N'Essex',N'CO7 6JX',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11017,N'ERNSH',9,'4/13/1998','5/11/1998','4/20/1998',2,754.26,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11018,N'LONEP',4,'4/13/1998','5/11/1998','4/16/1998',2,11.65,
	N'Lonesome Pine Restaurant',N'89 Chiaroscuro Rd.',N'Portland',
	N'OR',N'97219',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11019,N'RANCH',6,'4/13/1998','5/11/1998',NULL,3,3.17,
	N'Rancho grande',N'Av. del Libertador 900',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11020,N'OTTIK',2,'4/14/1998','5/12/1998','4/16/1998',2,43.30,
	N'Ottilies Käseladen',N'Mehrheimerstr. 369',N'Köln',
	NULL,N'50739',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11021,N'QUICK',3,'4/14/1998','5/12/1998','4/21/1998',1,297.18,
	N'QUICK-Stop',N'Taucherstraße 10',N'Cunewalde',
	NULL,N'01307',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11022,N'HANAR',9,'4/14/1998','5/12/1998','5/4/1998',2,6.27,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11023,N'BSBEV',1,'4/14/1998','4/28/1998','4/24/1998',2,123.83,
	N'B''s Beverages',N'Fauntleroy Circus',N'London',
	NULL,N'EC2 5NT',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11024,N'EASTC',4,'4/15/1998','5/13/1998','4/20/1998',1,74.36,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11025,N'WARTH',6,'4/15/1998','5/13/1998','4/24/1998',3,29.17,
	N'Wartian Herkku',N'Torikatu 38',N'Oulu',
	NULL,N'90110',N'Finland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11026,N'FRANS',4,'4/15/1998','5/13/1998','4/28/1998',1,47.09,
	N'Franchi S.p.A.',N'Via Monte Bianco 34',N'Torino',
	NULL,N'10100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11027,N'BOTTM',1,'4/16/1998','5/14/1998','4/20/1998',1,52.52,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11028,N'KOENE',2,'4/16/1998','5/14/1998','4/22/1998',1,29.59,
	N'Königlich Essen',N'Maubelstr. 90',N'Brandenburg',
	NULL,N'14776',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11029,N'CHOPS',4,'4/16/1998','5/14/1998','4/27/1998',1,47.84,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11030,N'SAVEA',7,'4/17/1998','5/15/1998','4/27/1998',2,830.75,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11031,N'SAVEA',6,'4/17/1998','5/15/1998','4/24/1998',2,227.22,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11032,N'WHITC',2,'4/17/1998','5/15/1998','4/23/1998',3,606.19,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11033,N'RICSU',7,'4/17/1998','5/15/1998','4/23/1998',3,84.74,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11034,N'OLDWO',8,'4/20/1998','6/1/1998','4/27/1998',1,40.32,
	N'Old World Delicatessen',N'2743 Bering St.',N'Anchorage',
	N'AK',N'99508',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11035,N'SUPRD',2,'4/20/1998','5/18/1998','4/24/1998',2,0.17,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11036,N'DRACD',8,'4/20/1998','5/18/1998','4/22/1998',3,149.47,
	N'Drachenblut Delikatessen',N'Walserweg 21',N'Aachen',
	NULL,N'52066',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11037,N'GODOS',7,'4/21/1998','5/19/1998','4/27/1998',1,3.20,
	N'Godos Cocina Típica',N'C/ Romero, 33',N'Sevilla',
	NULL,N'41101',N'Spain')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11038,N'SUPRD',1,'4/21/1998','5/19/1998','4/30/1998',2,29.59,
	N'Suprêmes délices',N'Boulevard Tirou, 255',N'Charleroi',
	NULL,N'B-6000',N'Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11039,N'LINOD',1,'4/21/1998','5/19/1998',NULL,2,65.00,
	N'LINO-Delicateses',N'Ave. 5 de Mayo Porlamar',N'I. de Margarita',
	N'Nueva Esparta',N'4980',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11040,N'GREAL',4,'4/22/1998','5/20/1998',NULL,3,18.84,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11041,N'CHOPS',3,'4/22/1998','5/20/1998','4/28/1998',2,48.22,
	N'Chop-suey Chinese',N'Hauptstr. 31',N'Bern',
	NULL,N'3012',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11042,N'COMMI',2,'4/22/1998','5/6/1998','5/1/1998',1,29.99,
	N'Comércio Mineiro',N'Av. dos Lusíadas, 23',N'Sao Paulo',
	N'SP',N'05432-043',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11043,N'SPECD',5,'4/22/1998','5/20/1998','4/29/1998',2,8.80,
	N'Spécialités du monde',N'25, rue Lauriston',N'Paris',
	NULL,N'75016',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11044,N'WOLZA',4,'4/23/1998','5/21/1998','5/1/1998',1,8.72,
	N'Wolski Zajazd',N'ul. Filtrowa 68',N'Warszawa',
	NULL,N'01-012',N'Poland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11045,N'BOTTM',6,'4/23/1998','5/21/1998',NULL,2,70.58,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11046,N'WANDK',8,'4/23/1998','5/21/1998','4/24/1998',2,71.64,
	N'Die Wandernde Kuh',N'Adenauerallee 900',N'Stuttgart',
	NULL,N'70563',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11047,N'EASTC',7,'4/24/1998','5/22/1998','5/1/1998',3,46.62,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11048,N'BOTTM',7,'4/24/1998','5/22/1998','4/30/1998',3,24.12,
	N'Bottom-Dollar Markets',N'23 Tsawassen Blvd.',N'Tsawassen',
	N'BC',N'T2F 8M4',N'Canada')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11049,N'GOURL',3,'4/24/1998','5/22/1998','5/4/1998',1,8.34,
	N'Gourmet Lanchonetes',N'Av. Brasil, 442',N'Campinas',
	N'SP',N'04876-786',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11050,N'FOLKO',8,'4/27/1998','5/25/1998','5/5/1998',2,59.41,
	N'Folk och fä HB',N'Åkergatan 24',N'Bräcke',
	NULL,N'S-844 67',N'Sweden')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11051,N'LAMAI',7,'4/27/1998','5/25/1998',NULL,3,2.79,
	N'La maison d''Asie',N'1 rue Alsace-Lorraine',N'Toulouse',
	NULL,N'31000',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11052,N'HANAR',3,'4/27/1998','5/25/1998','5/1/1998',1,67.26,
	N'Hanari Carnes',N'Rua do Paço, 67',N'Rio de Janeiro',
	N'RJ',N'05454-876',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11053,N'PICCO',2,'4/27/1998','5/25/1998','4/29/1998',2,53.05,
	N'Piccolo und mehr',N'Geislweg 14',N'Salzburg',
	NULL,N'5020',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11054,N'CACTU',8,'4/28/1998','5/26/1998',NULL,1,0.33,
	N'Cactus Comidas para llevar',N'Cerrito 333',N'Buenos Aires',
	NULL,N'1010',N'Argentina')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11055,N'HILAA',7,'4/28/1998','5/26/1998','5/5/1998',2,120.92,
	N'HILARION-Abastos',N'Carrera 22 con Ave. Carlos Soublette #8-35',N'San Cristóbal',
	N'Táchira',N'5022',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11056,N'EASTC',8,'4/28/1998','5/12/1998','5/1/1998',2,278.96,
	N'Eastern Connection',N'35 King George',N'London',
	NULL,N'WX3 6FW',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11057,N'NORTS',3,'4/29/1998','5/27/1998','5/1/1998',3,4.13,
	N'North/South',N'South House 300 Queensbridge',N'London',
	NULL,N'SW7 1RZ',N'UK')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11058,N'BLAUS',9,'4/29/1998','5/27/1998',NULL,3,31.14,
	N'Blauer See Delikatessen',N'Forsterstr. 57',N'Mannheim',
	NULL,N'68306',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11059,N'RICAR',2,'4/29/1998','6/10/1998',NULL,2,85.80,
	N'Ricardo Adocicados',N'Av. Copacabana, 267',N'Rio de Janeiro',
	N'RJ',N'02389-890',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11060,N'FRANS',2,'4/30/1998','5/28/1998','5/4/1998',2,10.98,
	N'Franchi S.p.A.',N'Via Monte Bianco 34',N'Torino',
	NULL,N'10100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11061,N'GREAL',4,'4/30/1998','6/11/1998',NULL,3,14.01,
	N'Great Lakes Food Market',N'2732 Baker Blvd.',N'Eugene',
	N'OR',N'97403',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11062,N'REGGC',4,'4/30/1998','5/28/1998',NULL,2,29.93,
	N'Reggiani Caseifici',N'Strada Provinciale 124',N'Reggio Emilia',
	NULL,N'42100',N'Italy')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11063,N'HUNGO',3,'4/30/1998','5/28/1998','5/6/1998',2,81.73,
	N'Hungry Owl All-Night Grocers',N'8 Johnstown Road',N'Cork',
	N'Co. Cork',NULL,N'Ireland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11064,N'SAVEA',1,'5/1/1998','5/29/1998','5/4/1998',1,30.09,
	N'Save-a-lot Markets',N'187 Suffolk Ln.',N'Boise',
	N'ID',N'83720',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11065,N'LILAS',8,'5/1/1998','5/29/1998',NULL,1,12.91,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11066,N'WHITC',7,'5/1/1998','5/29/1998','5/4/1998',2,44.72,
	N'White Clover Markets',N'1029 - 12th Ave. S.',N'Seattle',
	N'WA',N'98124',N'USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11067,N'DRACD',1,'5/4/1998','5/18/1998','5/6/1998',2,7.98,
	N'Drachenblut Delikatessen',N'Walserweg 21',N'Aachen',
	NULL,N'52066',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11068,N'QUEEN',8,'5/4/1998','6/1/1998',NULL,2,81.75,
	N'Queen Cozinha',N'Alameda dos Canàrios, 891',N'Sao Paulo',
	N'SP',N'05487-020',N'Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11069,N'TORTU',1,'5/4/1998','6/1/1998','5/6/1998',2,15.67,
	N'Tortuga Restaurante',N'Avda. Azteca 123',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11070,N'LEHMS',2,'5/5/1998','6/2/1998',NULL,1,136.00,
	N'Lehmanns Marktstand',N'Magazinweg 7',N'Frankfurt a.M.',
	NULL,N'60528',N'Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11071,N'LILAS',1,'5/5/1998','6/2/1998',NULL,1,0.93,
	N'LILA-Supermercado',N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo',N'Barquisimeto',
	N'Lara',N'3508',N'Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11072,N'ERNSH',4,'5/5/1998','6/2/1998',NULL,2,258.64,
	N'Ernst Handel',N'Kirchgasse 6',N'Graz',
	NULL,N'8010',N'Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11073,N'PERIC',2,'5/5/1998','6/2/1998',NULL,2,24.95,
	N'Pericles Comidas clásicas',N'Calle Dr. Jorge Cash 321',N'México D.F.',
	NULL,N'05033',N'Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11074,N'SIMOB',7,'5/6/1998','6/3/1998',NULL,2,18.44,
	N'Simons bistro',N'Vinbæltet 34',N'Kobenhavn',
	NULL,N'1734',N'Denmark')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11075,N'RICSU',8,'5/6/1998','6/3/1998',NULL,2,6.19,
	N'Richter Supermarkt',N'Starenweg 5',N'Genève',
	NULL,N'1204',N'Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11076,N'BONAP',4,'5/6/1998','6/3/1998',NULL,2,38.28,
	N'Bon app''',N'12, rue des Bouchers',N'Marseille',
	NULL,N'13008',N'France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","RequiredDate",
	"ShippedDate","ShipVia","Freight","ShipName","ShipAddress",
	"ShipCity","ShipRegion","ShipPostalCode","ShipCountry")
VALUES (11077,N'RATTC',1,'5/6/1998','6/3/1998',NULL,2,8.53,
	N'Rattlesnake Canyon Grocery',N'2817 Milton Dr.',N'Albuquerque',
	N'NM',N'87110',N'USA')

INSERT INTO OrderDetails VALUES(1,10248,11,12);
INSERT INTO OrderDetails VALUES(2,10248,42,10);
INSERT INTO OrderDetails VALUES(3,10248,72,5);
INSERT INTO OrderDetails VALUES(4,10249,14,9);
INSERT INTO OrderDetails VALUES(5,10249,51,40);
INSERT INTO OrderDetails VALUES(6,10250,41,10);
INSERT INTO OrderDetails VALUES(7,10250,51,35);
INSERT INTO OrderDetails VALUES(8,10250,65,15);
INSERT INTO OrderDetails VALUES(9,10251,22,6);
INSERT INTO OrderDetails VALUES(10,10251,57,15);
INSERT INTO OrderDetails VALUES(11,10251,65,20);
INSERT INTO OrderDetails VALUES(12,10252,20,40);
INSERT INTO OrderDetails VALUES(13,10252,33,25);
INSERT INTO OrderDetails VALUES(14,10252,60,40);
INSERT INTO OrderDetails VALUES(15,10253,31,20);
INSERT INTO OrderDetails VALUES(16,10253,39,42);
INSERT INTO OrderDetails VALUES(17,10253,49,40);
INSERT INTO OrderDetails VALUES(18,10254,24,15);
INSERT INTO OrderDetails VALUES(19,10254,55,21);
INSERT INTO OrderDetails VALUES(20,10254,74,21);
INSERT INTO OrderDetails VALUES(21,10255,2,20);
INSERT INTO OrderDetails VALUES(22,10255,16,35);
INSERT INTO OrderDetails VALUES(23,10255,36,25);
INSERT INTO OrderDetails VALUES(24,10255,59,30);
INSERT INTO OrderDetails VALUES(25,10256,53,15);
INSERT INTO OrderDetails VALUES(26,10256,77,12);
INSERT INTO OrderDetails VALUES(27,10257,27,25);
INSERT INTO OrderDetails VALUES(28,10257,39,6);
INSERT INTO OrderDetails VALUES(29,10257,77,15);
INSERT INTO OrderDetails VALUES(30,10258,2,50);
INSERT INTO OrderDetails VALUES(31,10258,5,65);
INSERT INTO OrderDetails VALUES(32,10258,32,6);
INSERT INTO OrderDetails VALUES(33,10259,21,10);
INSERT INTO OrderDetails VALUES(34,10259,37,1);
INSERT INTO OrderDetails VALUES(35,10260,41,16);
INSERT INTO OrderDetails VALUES(36,10260,57,50);
INSERT INTO OrderDetails VALUES(37,10260,62,15);
INSERT INTO OrderDetails VALUES(38,10260,70,21);
INSERT INTO OrderDetails VALUES(39,10261,21,20);
INSERT INTO OrderDetails VALUES(40,10261,35,20);
INSERT INTO OrderDetails VALUES(41,10262,5,12);
INSERT INTO OrderDetails VALUES(42,10262,7,15);
INSERT INTO OrderDetails VALUES(43,10262,56,2);
INSERT INTO OrderDetails VALUES(44,10263,16,60);
INSERT INTO OrderDetails VALUES(45,10263,24,28);
INSERT INTO OrderDetails VALUES(46,10263,30,60);
INSERT INTO OrderDetails VALUES(47,10263,74,36);
INSERT INTO OrderDetails VALUES(48,10264,2,35);
INSERT INTO OrderDetails VALUES(49,10264,41,25);
INSERT INTO OrderDetails VALUES(50,10265,17,30);
INSERT INTO OrderDetails VALUES(51,10265,70,20);
INSERT INTO OrderDetails VALUES(52,10266,12,12);
INSERT INTO OrderDetails VALUES(53,10267,40,50);
INSERT INTO OrderDetails VALUES(54,10267,59,70);
INSERT INTO OrderDetails VALUES(55,10267,76,15);
INSERT INTO OrderDetails VALUES(56,10268,29,10);
INSERT INTO OrderDetails VALUES(57,10268,72,4);
INSERT INTO OrderDetails VALUES(58,10269,33,60);
INSERT INTO OrderDetails VALUES(59,10269,72,20);
INSERT INTO OrderDetails VALUES(60,10270,36,30);
INSERT INTO OrderDetails VALUES(61,10270,43,25);
INSERT INTO OrderDetails VALUES(62,10271,33,24);
INSERT INTO OrderDetails VALUES(63,10272,20,6);
INSERT INTO OrderDetails VALUES(64,10272,31,40);
INSERT INTO OrderDetails VALUES(65,10272,72,24);
INSERT INTO OrderDetails VALUES(66,10273,10,24);
INSERT INTO OrderDetails VALUES(67,10273,31,15);
INSERT INTO OrderDetails VALUES(68,10273,33,20);
INSERT INTO OrderDetails VALUES(69,10273,40,60);
INSERT INTO OrderDetails VALUES(70,10273,76,33);
INSERT INTO OrderDetails VALUES(71,10274,71,20);
INSERT INTO OrderDetails VALUES(72,10274,72,7);
INSERT INTO OrderDetails VALUES(73,10275,24,12);
INSERT INTO OrderDetails VALUES(74,10275,59,6);
INSERT INTO OrderDetails VALUES(75,10276,10,15);
INSERT INTO OrderDetails VALUES(76,10276,13,10);
INSERT INTO OrderDetails VALUES(77,10277,28,20);
INSERT INTO OrderDetails VALUES(78,10277,62,12);
INSERT INTO OrderDetails VALUES(79,10278,44,16);
INSERT INTO OrderDetails VALUES(80,10278,59,15);
INSERT INTO OrderDetails VALUES(81,10278,63,8);
INSERT INTO OrderDetails VALUES(82,10278,73,25);
INSERT INTO OrderDetails VALUES(83,10279,17,15);
INSERT INTO OrderDetails VALUES(84,10280,24,12);
INSERT INTO OrderDetails VALUES(85,10280,55,20);
INSERT INTO OrderDetails VALUES(86,10280,75,30);
INSERT INTO OrderDetails VALUES(87,10281,19,1);
INSERT INTO OrderDetails VALUES(88,10281,24,6);
INSERT INTO OrderDetails VALUES(89,10281,35,4);
INSERT INTO OrderDetails VALUES(90,10282,30,6);
INSERT INTO OrderDetails VALUES(91,10282,57,2);
INSERT INTO OrderDetails VALUES(92,10283,15,20);
INSERT INTO OrderDetails VALUES(93,10283,19,18);
INSERT INTO OrderDetails VALUES(94,10283,60,35);
INSERT INTO OrderDetails VALUES(95,10283,72,3);
INSERT INTO OrderDetails VALUES(96,10284,27,15);
INSERT INTO OrderDetails VALUES(97,10284,44,21);
INSERT INTO OrderDetails VALUES(98,10284,60,20);
INSERT INTO OrderDetails VALUES(99,10284,67,5);
INSERT INTO OrderDetails VALUES(100,10285,1,45);
INSERT INTO OrderDetails VALUES(101,10285,40,40);
INSERT INTO OrderDetails VALUES(102,10285,53,36);
INSERT INTO OrderDetails VALUES(103,10286,35,100);
INSERT INTO OrderDetails VALUES(104,10286,62,40);
INSERT INTO OrderDetails VALUES(105,10287,16,40);
INSERT INTO OrderDetails VALUES(106,10287,34,20);
INSERT INTO OrderDetails VALUES(107,10287,46,15);
INSERT INTO OrderDetails VALUES(108,10288,54,10);
INSERT INTO OrderDetails VALUES(109,10288,68,3);
INSERT INTO OrderDetails VALUES(110,10289,3,30);
INSERT INTO OrderDetails VALUES(111,10289,64,9);
INSERT INTO OrderDetails VALUES(112,10290,5,20);
INSERT INTO OrderDetails VALUES(113,10290,29,15);
INSERT INTO OrderDetails VALUES(114,10290,49,15);
INSERT INTO OrderDetails VALUES(115,10290,77,10);
INSERT INTO OrderDetails VALUES(116,10291,13,20);
INSERT INTO OrderDetails VALUES(117,10291,44,24);
INSERT INTO OrderDetails VALUES(118,10291,51,2);
INSERT INTO OrderDetails VALUES(119,10292,20,20);
INSERT INTO OrderDetails VALUES(120,10293,18,12);
INSERT INTO OrderDetails VALUES(121,10293,24,10);
INSERT INTO OrderDetails VALUES(122,10293,63,5);
INSERT INTO OrderDetails VALUES(123,10293,75,6);
INSERT INTO OrderDetails VALUES(124,10294,1,18);
INSERT INTO OrderDetails VALUES(125,10294,17,15);
INSERT INTO OrderDetails VALUES(126,10294,43,15);
INSERT INTO OrderDetails VALUES(127,10294,60,21);
INSERT INTO OrderDetails VALUES(128,10294,75,6);
INSERT INTO OrderDetails VALUES(129,10295,56,4);
INSERT INTO OrderDetails VALUES(130,10296,11,12);
INSERT INTO OrderDetails VALUES(131,10296,16,30);
INSERT INTO OrderDetails VALUES(132,10296,69,15);
INSERT INTO OrderDetails VALUES(133,10297,39,60);
INSERT INTO OrderDetails VALUES(134,10297,72,20);
INSERT INTO OrderDetails VALUES(135,10298,2,40);
INSERT INTO OrderDetails VALUES(136,10298,36,40);
INSERT INTO OrderDetails VALUES(137,10298,59,30);
INSERT INTO OrderDetails VALUES(138,10298,62,15);
INSERT INTO OrderDetails VALUES(139,10299,19,15);
INSERT INTO OrderDetails VALUES(140,10299,70,20);
INSERT INTO OrderDetails VALUES(141,10300,66,30);
INSERT INTO OrderDetails VALUES(142,10300,68,20);
INSERT INTO OrderDetails VALUES(143,10301,40,10);
INSERT INTO OrderDetails VALUES(144,10301,56,20);
INSERT INTO OrderDetails VALUES(145,10302,17,40);
INSERT INTO OrderDetails VALUES(146,10302,28,28);
INSERT INTO OrderDetails VALUES(147,10302,43,12);
INSERT INTO OrderDetails VALUES(148,10303,40,40);
INSERT INTO OrderDetails VALUES(149,10303,65,30);
INSERT INTO OrderDetails VALUES(150,10303,68,15);
INSERT INTO OrderDetails VALUES(151,10304,49,30);
INSERT INTO OrderDetails VALUES(152,10304,59,10);
INSERT INTO OrderDetails VALUES(153,10304,71,2);
INSERT INTO OrderDetails VALUES(154,10305,18,25);
INSERT INTO OrderDetails VALUES(155,10305,29,25);
INSERT INTO OrderDetails VALUES(156,10305,39,30);
INSERT INTO OrderDetails VALUES(157,10306,30,10);
INSERT INTO OrderDetails VALUES(158,10306,53,10);
INSERT INTO OrderDetails VALUES(159,10306,54,5);
INSERT INTO OrderDetails VALUES(160,10307,62,10);
INSERT INTO OrderDetails VALUES(161,10307,68,3);
INSERT INTO OrderDetails VALUES(162,10308,69,1);
INSERT INTO OrderDetails VALUES(163,10308,70,5);
INSERT INTO OrderDetails VALUES(164,10309,4,20);
INSERT INTO OrderDetails VALUES(165,10309,6,30);
INSERT INTO OrderDetails VALUES(166,10309,42,2);
INSERT INTO OrderDetails VALUES(167,10309,43,20);
INSERT INTO OrderDetails VALUES(168,10309,71,3);
INSERT INTO OrderDetails VALUES(169,10310,16,10);
INSERT INTO OrderDetails VALUES(170,10310,62,5);
INSERT INTO OrderDetails VALUES(171,10311,42,6);
INSERT INTO OrderDetails VALUES(172,10311,69,7);
INSERT INTO OrderDetails VALUES(173,10312,28,4);
INSERT INTO OrderDetails VALUES(174,10312,43,24);
INSERT INTO OrderDetails VALUES(175,10312,53,20);
INSERT INTO OrderDetails VALUES(176,10312,75,10);
INSERT INTO OrderDetails VALUES(177,10313,36,12);
INSERT INTO OrderDetails VALUES(178,10314,32,40);
INSERT INTO OrderDetails VALUES(179,10314,58,30);
INSERT INTO OrderDetails VALUES(180,10314,62,25);
INSERT INTO OrderDetails VALUES(181,10315,34,14);
INSERT INTO OrderDetails VALUES(182,10315,70,30);
INSERT INTO OrderDetails VALUES(183,10316,41,10);
INSERT INTO OrderDetails VALUES(184,10316,62,70);
INSERT INTO OrderDetails VALUES(185,10317,1,20);
INSERT INTO OrderDetails VALUES(186,10318,41,20);
INSERT INTO OrderDetails VALUES(187,10318,76,6);
INSERT INTO OrderDetails VALUES(188,10319,17,8);
INSERT INTO OrderDetails VALUES(189,10319,28,14);
INSERT INTO OrderDetails VALUES(190,10319,76,30);
INSERT INTO OrderDetails VALUES(191,10320,71,30);
INSERT INTO OrderDetails VALUES(192,10321,35,10);
INSERT INTO OrderDetails VALUES(193,10322,52,20);
INSERT INTO OrderDetails VALUES(194,10323,15,5);
INSERT INTO OrderDetails VALUES(195,10323,25,4);
INSERT INTO OrderDetails VALUES(196,10323,39,4);
INSERT INTO OrderDetails VALUES(197,10324,16,21);
INSERT INTO OrderDetails VALUES(198,10324,35,70);
INSERT INTO OrderDetails VALUES(199,10324,46,30);
INSERT INTO OrderDetails VALUES(200,10324,59,40);
INSERT INTO OrderDetails VALUES(201,10324,63,80);
INSERT INTO OrderDetails VALUES(202,10325,6,6);
INSERT INTO OrderDetails VALUES(203,10325,13,12);
INSERT INTO OrderDetails VALUES(204,10325,14,9);
INSERT INTO OrderDetails VALUES(205,10325,31,4);
INSERT INTO OrderDetails VALUES(206,10325,72,40);
INSERT INTO OrderDetails VALUES(207,10326,4,24);
INSERT INTO OrderDetails VALUES(208,10326,57,16);
INSERT INTO OrderDetails VALUES(209,10326,75,50);
INSERT INTO OrderDetails VALUES(210,10327,2,25);
INSERT INTO OrderDetails VALUES(211,10327,11,50);
INSERT INTO OrderDetails VALUES(212,10327,30,35);
INSERT INTO OrderDetails VALUES(213,10327,58,30);
INSERT INTO OrderDetails VALUES(214,10328,59,9);
INSERT INTO OrderDetails VALUES(215,10328,65,40);
INSERT INTO OrderDetails VALUES(216,10328,68,10);
INSERT INTO OrderDetails VALUES(217,10329,19,10);
INSERT INTO OrderDetails VALUES(218,10329,30,8);
INSERT INTO OrderDetails VALUES(219,10329,38,20);
INSERT INTO OrderDetails VALUES(220,10329,56,12);
INSERT INTO OrderDetails VALUES(221,10330,26,50);
INSERT INTO OrderDetails VALUES(222,10330,72,25);
INSERT INTO OrderDetails VALUES(223,10331,54,15);
INSERT INTO OrderDetails VALUES(224,10332,18,40);
INSERT INTO OrderDetails VALUES(225,10332,42,10);
INSERT INTO OrderDetails VALUES(226,10332,47,16);
INSERT INTO OrderDetails VALUES(227,10333,14,10);
INSERT INTO OrderDetails VALUES(228,10333,21,10);
INSERT INTO OrderDetails VALUES(229,10333,71,40);
INSERT INTO OrderDetails VALUES(230,10334,52,8);
INSERT INTO OrderDetails VALUES(231,10334,68,10);
INSERT INTO OrderDetails VALUES(232,10335,2,7);
INSERT INTO OrderDetails VALUES(233,10335,31,25);
INSERT INTO OrderDetails VALUES(234,10335,32,6);
INSERT INTO OrderDetails VALUES(235,10335,51,48);
INSERT INTO OrderDetails VALUES(236,10336,4,18);
INSERT INTO OrderDetails VALUES(237,10337,23,40);
INSERT INTO OrderDetails VALUES(238,10337,26,24);
INSERT INTO OrderDetails VALUES(239,10337,36,20);
INSERT INTO OrderDetails VALUES(240,10337,37,28);
INSERT INTO OrderDetails VALUES(241,10337,72,25);
INSERT INTO OrderDetails VALUES(242,10338,17,20);
INSERT INTO OrderDetails VALUES(243,10338,30,15);
INSERT INTO OrderDetails VALUES(244,10339,4,10);
INSERT INTO OrderDetails VALUES(245,10339,17,70);
INSERT INTO OrderDetails VALUES(246,10339,62,28);
INSERT INTO OrderDetails VALUES(247,10340,18,20);
INSERT INTO OrderDetails VALUES(248,10340,41,12);
INSERT INTO OrderDetails VALUES(249,10340,43,40);
INSERT INTO OrderDetails VALUES(250,10341,33,8);
INSERT INTO OrderDetails VALUES(251,10341,59,9);
INSERT INTO OrderDetails VALUES(252,10342,2,24);
INSERT INTO OrderDetails VALUES(253,10342,31,56);
INSERT INTO OrderDetails VALUES(254,10342,36,40);
INSERT INTO OrderDetails VALUES(255,10342,55,40);
INSERT INTO OrderDetails VALUES(256,10343,64,50);
INSERT INTO OrderDetails VALUES(257,10343,68,4);
INSERT INTO OrderDetails VALUES(258,10343,76,15);
INSERT INTO OrderDetails VALUES(259,10344,4,35);
INSERT INTO OrderDetails VALUES(260,10344,8,70);
INSERT INTO OrderDetails VALUES(261,10345,8,70);
INSERT INTO OrderDetails VALUES(262,10345,19,80);
INSERT INTO OrderDetails VALUES(263,10345,42,9);
INSERT INTO OrderDetails VALUES(264,10346,17,36);
INSERT INTO OrderDetails VALUES(265,10346,56,20);
INSERT INTO OrderDetails VALUES(266,10347,25,10);
INSERT INTO OrderDetails VALUES(267,10347,39,50);
INSERT INTO OrderDetails VALUES(268,10347,40,4);
INSERT INTO OrderDetails VALUES(269,10347,75,6);
INSERT INTO OrderDetails VALUES(270,10348,1,15);
INSERT INTO OrderDetails VALUES(271,10348,23,25);
INSERT INTO OrderDetails VALUES(272,10349,54,24);
INSERT INTO OrderDetails VALUES(273,10350,50,15);
INSERT INTO OrderDetails VALUES(274,10350,69,18);
INSERT INTO OrderDetails VALUES(275,10351,38,20);
INSERT INTO OrderDetails VALUES(276,10351,41,13);
INSERT INTO OrderDetails VALUES(277,10351,44,77);
INSERT INTO OrderDetails VALUES(278,10351,65,10);
INSERT INTO OrderDetails VALUES(279,10352,24,10);
INSERT INTO OrderDetails VALUES(280,10352,54,20);
INSERT INTO OrderDetails VALUES(281,10353,11,12);
INSERT INTO OrderDetails VALUES(282,10353,38,50);
INSERT INTO OrderDetails VALUES(283,10354,1,12);
INSERT INTO OrderDetails VALUES(284,10354,29,4);
INSERT INTO OrderDetails VALUES(285,10355,24,25);
INSERT INTO OrderDetails VALUES(286,10355,57,25);
INSERT INTO OrderDetails VALUES(287,10356,31,30);
INSERT INTO OrderDetails VALUES(288,10356,55,12);
INSERT INTO OrderDetails VALUES(289,10356,69,20);
INSERT INTO OrderDetails VALUES(290,10357,10,30);
INSERT INTO OrderDetails VALUES(291,10357,26,16);
INSERT INTO OrderDetails VALUES(292,10357,60,8);
INSERT INTO OrderDetails VALUES(293,10358,24,10);
INSERT INTO OrderDetails VALUES(294,10358,34,10);
INSERT INTO OrderDetails VALUES(295,10358,36,20);
INSERT INTO OrderDetails VALUES(296,10359,16,56);
INSERT INTO OrderDetails VALUES(297,10359,31,70);
INSERT INTO OrderDetails VALUES(298,10359,60,80);
INSERT INTO OrderDetails VALUES(299,10360,28,30);
INSERT INTO OrderDetails VALUES(300,10360,29,35);
INSERT INTO OrderDetails VALUES(301,10360,38,10);
INSERT INTO OrderDetails VALUES(302,10360,49,35);
INSERT INTO OrderDetails VALUES(303,10360,54,28);
INSERT INTO OrderDetails VALUES(304,10361,39,54);
INSERT INTO OrderDetails VALUES(305,10361,60,55);
INSERT INTO OrderDetails VALUES(306,10362,25,50);
INSERT INTO OrderDetails VALUES(307,10362,51,20);
INSERT INTO OrderDetails VALUES(308,10362,54,24);
INSERT INTO OrderDetails VALUES(309,10363,31,20);
INSERT INTO OrderDetails VALUES(310,10363,75,12);
INSERT INTO OrderDetails VALUES(311,10363,76,12);
INSERT INTO OrderDetails VALUES(312,10364,69,30);
INSERT INTO OrderDetails VALUES(313,10364,71,5);
INSERT INTO OrderDetails VALUES(314,10365,11,24);
INSERT INTO OrderDetails VALUES(315,10366,65,5);
INSERT INTO OrderDetails VALUES(316,10366,77,5);
INSERT INTO OrderDetails VALUES(317,10367,34,36);
INSERT INTO OrderDetails VALUES(318,10367,54,18);
INSERT INTO OrderDetails VALUES(319,10367,65,15);
INSERT INTO OrderDetails VALUES(320,10367,77,7);
INSERT INTO OrderDetails VALUES(321,10368,21,5);
INSERT INTO OrderDetails VALUES(322,10368,28,13);
INSERT INTO OrderDetails VALUES(323,10368,57,25);
INSERT INTO OrderDetails VALUES(324,10368,64,35);
INSERT INTO OrderDetails VALUES(325,10369,29,20);
INSERT INTO OrderDetails VALUES(326,10369,56,18);
INSERT INTO OrderDetails VALUES(327,10370,1,15);
INSERT INTO OrderDetails VALUES(328,10370,64,30);
INSERT INTO OrderDetails VALUES(329,10370,74,20);
INSERT INTO OrderDetails VALUES(330,10371,36,6);
INSERT INTO OrderDetails VALUES(331,10372,20,12);
INSERT INTO OrderDetails VALUES(332,10372,38,40);
INSERT INTO OrderDetails VALUES(333,10372,60,70);
INSERT INTO OrderDetails VALUES(334,10372,72,42);
INSERT INTO OrderDetails VALUES(335,10373,58,80);
INSERT INTO OrderDetails VALUES(336,10373,71,50);
INSERT INTO OrderDetails VALUES(337,10374,31,30);
INSERT INTO OrderDetails VALUES(338,10374,58,15);
INSERT INTO OrderDetails VALUES(339,10375,14,15);
INSERT INTO OrderDetails VALUES(340,10375,54,10);
INSERT INTO OrderDetails VALUES(341,10376,31,42);
INSERT INTO OrderDetails VALUES(342,10377,28,20);
INSERT INTO OrderDetails VALUES(343,10377,39,20);
INSERT INTO OrderDetails VALUES(344,10378,71,6);
INSERT INTO OrderDetails VALUES(345,10379,41,8);
INSERT INTO OrderDetails VALUES(346,10379,63,16);
INSERT INTO OrderDetails VALUES(347,10379,65,20);
INSERT INTO OrderDetails VALUES(348,10380,30,18);
INSERT INTO OrderDetails VALUES(349,10380,53,20);
INSERT INTO OrderDetails VALUES(350,10380,60,6);
INSERT INTO OrderDetails VALUES(351,10380,70,30);
INSERT INTO OrderDetails VALUES(352,10381,74,14);
INSERT INTO OrderDetails VALUES(353,10382,5,32);
INSERT INTO OrderDetails VALUES(354,10382,18,9);
INSERT INTO OrderDetails VALUES(355,10382,29,14);
INSERT INTO OrderDetails VALUES(356,10382,33,60);
INSERT INTO OrderDetails VALUES(357,10382,74,50);
INSERT INTO OrderDetails VALUES(358,10383,13,20);
INSERT INTO OrderDetails VALUES(359,10383,50,15);
INSERT INTO OrderDetails VALUES(360,10383,56,20);
INSERT INTO OrderDetails VALUES(361,10384,20,28);
INSERT INTO OrderDetails VALUES(362,10384,60,15);
INSERT INTO OrderDetails VALUES(363,10385,7,10);
INSERT INTO OrderDetails VALUES(364,10385,60,20);
INSERT INTO OrderDetails VALUES(365,10385,68,8);
INSERT INTO OrderDetails VALUES(366,10386,24,15);
INSERT INTO OrderDetails VALUES(367,10386,34,10);
INSERT INTO OrderDetails VALUES(368,10387,24,15);
INSERT INTO OrderDetails VALUES(369,10387,28,6);
INSERT INTO OrderDetails VALUES(370,10387,59,12);
INSERT INTO OrderDetails VALUES(371,10387,71,15);
INSERT INTO OrderDetails VALUES(372,10388,45,15);
INSERT INTO OrderDetails VALUES(373,10388,52,20);
INSERT INTO OrderDetails VALUES(374,10388,53,40);
INSERT INTO OrderDetails VALUES(375,10389,10,16);
INSERT INTO OrderDetails VALUES(376,10389,55,15);
INSERT INTO OrderDetails VALUES(377,10389,62,20);
INSERT INTO OrderDetails VALUES(378,10389,70,30);
INSERT INTO OrderDetails VALUES(379,10390,31,60);
INSERT INTO OrderDetails VALUES(380,10390,35,40);
INSERT INTO OrderDetails VALUES(381,10390,46,45);
INSERT INTO OrderDetails VALUES(382,10390,72,24);
INSERT INTO OrderDetails VALUES(383,10391,13,18);
INSERT INTO OrderDetails VALUES(384,10392,69,50);
INSERT INTO OrderDetails VALUES(385,10393,2,25);
INSERT INTO OrderDetails VALUES(386,10393,14,42);
INSERT INTO OrderDetails VALUES(387,10393,25,7);
INSERT INTO OrderDetails VALUES(388,10393,26,70);
INSERT INTO OrderDetails VALUES(389,10393,31,32);
INSERT INTO OrderDetails VALUES(390,10394,13,10);
INSERT INTO OrderDetails VALUES(391,10394,62,10);
INSERT INTO OrderDetails VALUES(392,10395,46,28);
INSERT INTO OrderDetails VALUES(393,10395,53,70);
INSERT INTO OrderDetails VALUES(394,10395,69,8);
INSERT INTO OrderDetails VALUES(395,10396,23,40);
INSERT INTO OrderDetails VALUES(396,10396,71,60);
INSERT INTO OrderDetails VALUES(397,10396,72,21);
INSERT INTO OrderDetails VALUES(398,10397,21,10);
INSERT INTO OrderDetails VALUES(399,10397,51,18);
INSERT INTO OrderDetails VALUES(400,10398,35,30);
INSERT INTO OrderDetails VALUES(401,10398,55,120);
INSERT INTO OrderDetails VALUES(402,10399,68,60);
INSERT INTO OrderDetails VALUES(403,10399,71,30);
INSERT INTO OrderDetails VALUES(404,10399,76,35);
INSERT INTO OrderDetails VALUES(405,10399,77,14);
INSERT INTO OrderDetails VALUES(406,10400,29,21);
INSERT INTO OrderDetails VALUES(407,10400,35,35);
INSERT INTO OrderDetails VALUES(408,10400,49,30);
INSERT INTO OrderDetails VALUES(409,10401,30,18);
INSERT INTO OrderDetails VALUES(410,10401,56,70);
INSERT INTO OrderDetails VALUES(411,10401,65,20);
INSERT INTO OrderDetails VALUES(412,10401,71,60);
INSERT INTO OrderDetails VALUES(413,10402,23,60);
INSERT INTO OrderDetails VALUES(414,10402,63,65);
INSERT INTO OrderDetails VALUES(415,10403,16,21);
INSERT INTO OrderDetails VALUES(416,10403,48,70);
INSERT INTO OrderDetails VALUES(417,10404,26,30);
INSERT INTO OrderDetails VALUES(418,10404,42,40);
INSERT INTO OrderDetails VALUES(419,10404,49,30);
INSERT INTO OrderDetails VALUES(420,10405,3,50);
INSERT INTO OrderDetails VALUES(421,10406,1,10);
INSERT INTO OrderDetails VALUES(422,10406,21,30);
INSERT INTO OrderDetails VALUES(423,10406,28,42);
INSERT INTO OrderDetails VALUES(424,10406,36,5);
INSERT INTO OrderDetails VALUES(425,10406,40,2);
INSERT INTO OrderDetails VALUES(426,10407,11,30);
INSERT INTO OrderDetails VALUES(427,10407,69,15);
INSERT INTO OrderDetails VALUES(428,10407,71,15);
INSERT INTO OrderDetails VALUES(429,10408,37,10);
INSERT INTO OrderDetails VALUES(430,10408,54,6);
INSERT INTO OrderDetails VALUES(431,10408,62,35);
INSERT INTO OrderDetails VALUES(432,10409,14,12);
INSERT INTO OrderDetails VALUES(433,10409,21,12);
INSERT INTO OrderDetails VALUES(434,10410,33,49);
INSERT INTO OrderDetails VALUES(435,10410,59,16);
INSERT INTO OrderDetails VALUES(436,10411,41,25);
INSERT INTO OrderDetails VALUES(437,10411,44,40);
INSERT INTO OrderDetails VALUES(438,10411,59,9);
INSERT INTO OrderDetails VALUES(439,10412,14,20);
INSERT INTO OrderDetails VALUES(440,10413,1,24);
INSERT INTO OrderDetails VALUES(441,10413,62,40);
INSERT INTO OrderDetails VALUES(442,10413,76,14);
INSERT INTO OrderDetails VALUES(443,10414,19,18);
INSERT INTO OrderDetails VALUES(444,10414,33,50);
INSERT INTO OrderDetails VALUES(445,10415,17,2);
INSERT INTO OrderDetails VALUES(446,10415,33,20);
INSERT INTO OrderDetails VALUES(447,10416,19,20);
INSERT INTO OrderDetails VALUES(448,10416,53,10);
INSERT INTO OrderDetails VALUES(449,10416,57,20);
INSERT INTO OrderDetails VALUES(450,10417,38,50);
INSERT INTO OrderDetails VALUES(451,10417,46,2);
INSERT INTO OrderDetails VALUES(452,10417,68,36);
INSERT INTO OrderDetails VALUES(453,10417,77,35);
INSERT INTO OrderDetails VALUES(454,10418,2,60);
INSERT INTO OrderDetails VALUES(455,10418,47,55);
INSERT INTO OrderDetails VALUES(456,10418,61,16);
INSERT INTO OrderDetails VALUES(457,10418,74,15);
INSERT INTO OrderDetails VALUES(458,10419,60,60);
INSERT INTO OrderDetails VALUES(459,10419,69,20);
INSERT INTO OrderDetails VALUES(460,10420,9,20);
INSERT INTO OrderDetails VALUES(461,10420,13,2);
INSERT INTO OrderDetails VALUES(462,10420,70,8);
INSERT INTO OrderDetails VALUES(463,10420,73,20);
INSERT INTO OrderDetails VALUES(464,10421,19,4);
INSERT INTO OrderDetails VALUES(465,10421,26,30);
INSERT INTO OrderDetails VALUES(466,10421,53,15);
INSERT INTO OrderDetails VALUES(467,10421,77,10);
INSERT INTO OrderDetails VALUES(468,10422,26,2);
INSERT INTO OrderDetails VALUES(469,10423,31,14);
INSERT INTO OrderDetails VALUES(470,10423,59,20);
INSERT INTO OrderDetails VALUES(471,10424,35,60);
INSERT INTO OrderDetails VALUES(472,10424,38,49);
INSERT INTO OrderDetails VALUES(473,10424,68,30);
INSERT INTO OrderDetails VALUES(474,10425,55,10);
INSERT INTO OrderDetails VALUES(475,10425,76,20);
INSERT INTO OrderDetails VALUES(476,10426,56,5);
INSERT INTO OrderDetails VALUES(477,10426,64,7);
INSERT INTO OrderDetails VALUES(478,10427,14,35);
INSERT INTO OrderDetails VALUES(479,10428,46,20);
INSERT INTO OrderDetails VALUES(480,10429,50,40);
INSERT INTO OrderDetails VALUES(481,10429,63,35);
INSERT INTO OrderDetails VALUES(482,10430,17,45);
INSERT INTO OrderDetails VALUES(483,10430,21,50);
INSERT INTO OrderDetails VALUES(484,10430,56,30);
INSERT INTO OrderDetails VALUES(485,10430,59,70);
INSERT INTO OrderDetails VALUES(486,10431,17,50);
INSERT INTO OrderDetails VALUES(487,10431,40,50);
INSERT INTO OrderDetails VALUES(488,10431,47,30);
INSERT INTO OrderDetails VALUES(489,10432,26,10);
INSERT INTO OrderDetails VALUES(490,10432,54,40);
INSERT INTO OrderDetails VALUES(491,10433,56,28);
INSERT INTO OrderDetails VALUES(492,10434,11,6);
INSERT INTO OrderDetails VALUES(493,10434,76,18);
INSERT INTO OrderDetails VALUES(494,10435,2,10);
INSERT INTO OrderDetails VALUES(495,10435,22,12);
INSERT INTO OrderDetails VALUES(496,10435,72,10);
INSERT INTO OrderDetails VALUES(497,10436,46,5);
INSERT INTO OrderDetails VALUES(498,10436,56,40);
INSERT INTO OrderDetails VALUES(499,10436,64,30);
INSERT INTO OrderDetails VALUES(500,10436,75,24);
INSERT INTO OrderDetails VALUES(501,10437,53,15);
INSERT INTO OrderDetails VALUES(502,10438,19,15);
INSERT INTO OrderDetails VALUES(503,10438,34,20);
INSERT INTO OrderDetails VALUES(504,10438,57,15);
INSERT INTO OrderDetails VALUES(505,10439,12,15);
INSERT INTO OrderDetails VALUES(506,10439,16,16);
INSERT INTO OrderDetails VALUES(507,10439,64,6);
INSERT INTO OrderDetails VALUES(508,10439,74,30);
INSERT INTO OrderDetails VALUES(509,10440,2,45);
INSERT INTO OrderDetails VALUES(510,10440,16,49);
INSERT INTO OrderDetails VALUES(511,10440,29,24);
INSERT INTO OrderDetails VALUES(512,10440,61,90);
INSERT INTO OrderDetails VALUES(513,10441,27,50);
INSERT INTO OrderDetails VALUES(514,10442,11,30);
INSERT INTO OrderDetails VALUES(515,10442,54,80);
INSERT INTO OrderDetails VALUES(516,10442,66,60);
INSERT INTO OrderDetails VALUES(517,10443,11,6);
INSERT INTO OrderDetails VALUES(518,10443,28,12);

COMMIT;