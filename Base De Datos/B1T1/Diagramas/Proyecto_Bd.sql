DROP DATABASE IF EXISTS Proyectos;
CREATE DATABASE Proyectos;

USE Proyectos;

CREATE TABLE Proyectos (
    ProyectoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    PresupuestoTotal DECIMAL(10, 2) NOT NULL,
    ProgramaFinanciamiento VARCHAR(255),
    FechaInicio DATE NOT NULL,
    FechaFinalizacion DATE NOT NULL,
    Descripcion TEXT
);


CREATE TABLE Profesores (
    ProfesorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    Despacho VARCHAR(255),
    Telefono VARCHAR(20),
    Tipo ENUM('Doctor', 'No Doctor') NOT NULL
);


CREATE TABLE Supervision (
    ProfesorNoDoctorID INT,
    ProfesorDoctorID INT,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    PRIMARY KEY (ProfesorNoDoctorID, ProfesorDoctorID, FechaInicio),
    FOREIGN KEY (ProfesorNoDoctorID) REFERENCES Profesores(ProfesorID),
    FOREIGN KEY (ProfesorDoctorID) REFERENCES Profesores(ProfesorID)
);


CREATE TABLE TrabajoProyectos (
    ProfesorID INT,
    ProyectoID INT,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    PRIMARY KEY (ProfesorID, ProyectoID, FechaInicio),
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
);


CREATE TABLE InvestigadorPrincipal (
    ProyectoID INT,
    ProfesorID INT,
    PRIMARY KEY (ProyectoID),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID),
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);


CREATE TABLE Publicaciones (
    CodigoUnico INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Tipo ENUM('Revista', 'Congreso') NOT NULL
);


CREATE TABLE PublicacionesRevistas (
    CodigoUnico INT PRIMARY KEY,
    Volumen INT,
    Numero INT,
    PaginaInicio INT,
    PaginaFin INT,
    FOREIGN KEY (CodigoUnico) REFERENCES Publicaciones(CodigoUnico)
);


CREATE TABLE PublicacionesCongresos (
    CodigoUnico INT PRIMARY KEY,
    TipoCongreso VARCHAR(255),
    Ciudad VARCHAR(255),
    Pais VARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    Editorial VARCHAR(255),
    FOREIGN KEY (CodigoUnico) REFERENCES Publicaciones(CodigoUnico)
);

INSERT INTO Proyectos (Nombre, PresupuestoTotal, ProgramaFinanciamiento, FechaInicio, FechaFinalizacion, Descripcion)
VALUES ('Proyecto A', 100000.00, 'Programa X', '2023-01-01', '2023-12-31', 'Descripción del Proyecto A');


INSERT INTO Profesores (Nombre, Apellidos, Despacho, Telefono, Tipo)
VALUES ('Juan', 'Perez', 'Despacho 101', '123-456-7890', 'Doctor');
INSERT INTO Profesores (Nombre, Apellidos, Despacho, Telefono, Tipo)
VALUES ('Maria', 'Gomez', 'Despacho 102', '987-654-3210', 'No Doctor');


INSERT INTO Supervision (ProfesorNoDoctorID, ProfesorDoctorID, FechaInicio, FechaFin)
VALUES (2, 1, '2022-01-01', '2022-12-31');

INSERT INTO TrabajoProyectos (ProfesorID, ProyectoID, FechaInicio, FechaFin)
VALUES (1, 1, '2023-02-01', '2023-06-30');
INSERT INTO TrabajoProyectos (ProfesorID, ProyectoID, FechaInicio, FechaFin)
VALUES (2, 1, '2023-03-15', '2023-07-15');


INSERT INTO InvestigadorPrincipal (ProyectoID, ProfesorID)
VALUES (1, 1);


INSERT INTO Publicaciones (Titulo, Tipo)
VALUES ('Artículo en Revista X', 'Revista');
INSERT INTO Publicaciones (Titulo, Tipo)
VALUES ('Presentación en Congreso Y', 'Congreso');


INSERT INTO PublicacionesRevistas (CodigoUnico, Volumen, Numero, PaginaInicio, PaginaFin)
VALUES (1, 10, 3, 45, 60);


INSERT INTO PublicacionesCongresos (CodigoUnico, TipoCongreso, Ciudad, Pais, FechaInicio, FechaFin, Editorial)
VALUES (2, 'Congreso Internacional', 'Ciudad A', 'País Z', '2023-08-15', '2023-08-18', 'Editorial ABC');
 
 