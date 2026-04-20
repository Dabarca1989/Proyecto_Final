-- =========================================
-- CREAR BASE DE DATOS
-- =========================================
IF DB_ID('SistemaReparaciones') IS NOT NULL
BEGIN
    ALTER DATABASE SistemaReparaciones SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SistemaReparaciones;
END;
GO

CREATE DATABASE SistemaReparaciones;
GO

USE SistemaReparaciones;
GO

-- =========================================
-- TABLA DE USUARIOS
-- =========================================
CREATE TABLE Usuarios(
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL
);
GO

INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
VALUES
('Carlos Ramirez','carlos@email.com','8888-1111'),
('Ana Lopez','ana@email.com','8888-2222'),
('Luis Morales','luis@email.com','8888-3333'),
('Maria Castro','maria@email.com','8888-4444'),
('Pedro Vargas','pedro@email.com','8888-5555');
GO

-- =========================================
-- TABLA DE TECNICOS
-- =========================================
CREATE TABLE Tecnicos (
    TecnicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100),
    CorreoElectronico VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL,
    Estado VARCHAR(20)
);
GO

INSERT INTO Tecnicos (Nombre, Especialidad, Telefono, CorreoElectronico, Estado)
VALUES
('Juan Perez','Laptop','8888-9001','juan@taller.com','Disponible'),
('Laura Gomez','Hardware','8888-9002','laura@taller.com','Disponible'),
('Carlos Vega','Software','8888-9003','vega@taller.com','Disponible'),
('Mario Soto','Impresoras','8888-9004','mario@taller.com','Disponible'),
('Andres Ruiz','Redes','8888-9005','andres@taller.com','Disponible');
GO

-- =========================================
-- TABLA DE EQUIPOS
-- =========================================
CREATE TABLE Equipos (
    EquipoID INT IDENTITY(1,1) PRIMARY KEY,
    TipoEquipo VARCHAR(50) NOT NULL,
    Marca VARCHAR(50),
    Modelo VARCHAR(100),
    NumeroSerie VARCHAR(50),
    UsuarioID INT NOT NULL,

    CONSTRAINT FK_Equipos_Usuarios
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
GO

INSERT INTO Equipos (TipoEquipo, Marca, Modelo, NumeroSerie, UsuarioID)
VALUES
('Laptop','Dell','XPS 13','SN001',1),
('Laptop','HP','Pavilion 15','SN002',2),
('PC','Lenovo','ThinkCentre','SN003',3),
('Laptop','Apple','MacBook Air','SN004',4),
('Impresora','Epson','EcoTank L3250','SN005',5);
GO

-- =========================================
-- TABLA DE REPARACIONES
-- =========================================
CREATE TABLE Reparaciones(
    ReparacionID INT IDENTITY(1,1) PRIMARY KEY,
    EquipoID INT NOT NULL,
    FechaSolicitud DATETIME NOT NULL,
    DescripcionProblema VARCHAR(255),
    Estado VARCHAR(20) DEFAULT 'Pendiente',

    CONSTRAINT FK_Reparaciones_Equipos
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);
GO

INSERT INTO Reparaciones (EquipoID, FechaSolicitud, DescripcionProblema)
VALUES
(1, GETDATE(), 'No enciende'),
(2, GETDATE(), 'Pantalla rota'),
(3, GETDATE(), 'Ruido extraño en ventilador'),
(4, GETDATE(), 'Bateria no carga'),
(5, GETDATE(), 'No imprime correctamente');
GO

-- =========================================
-- TABLA DE ASIGNACIONES
-- =========================================
CREATE TABLE Asignaciones(
    AsignacionID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT NOT NULL,
    TecnicoID INT NOT NULL,
    FechaAsignacion DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Asignaciones_Reparaciones
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),

    CONSTRAINT FK_Asignaciones_Tecnicos
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);
GO

INSERT INTO Asignaciones (ReparacionID, TecnicoID)
VALUES
(1,1),
(2,2),
(3,3),
(4,1),
(5,4);
GO

-- =========================================
-- TABLA DE DETALLES DE REPARACION
-- =========================================
CREATE TABLE DetallesReparacion(
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT NOT NULL,
    Diagnostico VARCHAR(255),
    AccionesRealizadas VARCHAR(255),
    FechaInicio DATETIME,
    FechaFin DATETIME,
    Costo DECIMAL(10,2),

    CONSTRAINT FK_Detalles_Reparaciones
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);
GO

INSERT INTO DetallesReparacion
(ReparacionID, Diagnostico, AccionesRealizadas, FechaInicio, FechaFin, Costo)
VALUES
(1,'Fuente de poder dañada','Cambio de fuente',GETDATE(),GETDATE(),120.00),
(2,'Pantalla fracturada','Reemplazo de pantalla',GETDATE(),GETDATE(),200.00);
GO

-- =========================================
-- PROCEDIMIENTO ALMACENADO: REGISTRAR REPARACION
-- =========================================
CREATE PROCEDURE sp_RegistrarReparacion
    @EquipoID INT,
    @FechaSolicitud DATETIME,
    @DescripcionProblema VARCHAR(255)
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, DescripcionProblema)
    VALUES (@EquipoID, @FechaSolicitud, @DescripcionProblema);
END;
GO

-- =========================================
-- PROCEDIMIENTO ALMACENADO: ASIGNAR TECNICO
-- =========================================
CREATE PROCEDURE sp_AsignarTecnico
    @ReparacionID INT,
    @TecnicoID INT
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, GETDATE());

    UPDATE Reparaciones
    SET Estado = 'En Proceso'
    WHERE ReparacionID = @ReparacionID;
END;
GO

-- =========================================
-- TRIGGER PARA COMPLETAR LA REPARACION
-- =========================================
CREATE TRIGGER trg_CompletarReparacion
ON DetallesReparacion
AFTER INSERT
AS
BEGIN
    UPDATE Reparaciones
    SET Estado = 'Completado'
    WHERE ReparacionID IN (
        SELECT ReparacionID
        FROM inserted
    );
END;
GO

-- =========================================
-- CONSULTAS INNER JOIN
-- =========================================
SELECT U.Nombre, E.Modelo
FROM Usuarios U
INNER JOIN Equipos E
    ON U.UsuarioID = E.UsuarioID;
GO

SELECT 
    U.Nombre AS Usuario,
    E.Modelo AS ModeloEquipo,
    T.Nombre AS Tecnico
FROM Usuarios U
INNER JOIN Equipos E
    ON U.UsuarioID = E.UsuarioID
INNER JOIN Reparaciones R
    ON E.EquipoID = R.EquipoID
INNER JOIN Asignaciones A
    ON R.ReparacionID = A.ReparacionID
INNER JOIN Tecnicos T
    ON A.TecnicoID = T.TecnicoID;
GO

SELECT U.Nombre AS Usuario, E.Modelo
FROM Usuarios U
INNER JOIN Equipos E
    ON U.UsuarioID = E.UsuarioID
INNER JOIN Reparaciones R
    ON E.EquipoID = R.EquipoID;
GO

-- =========================================
-- ESTADISTICAS POR TECNICO
-- =========================================
SELECT
    T.Nombre AS Tecnico,
    COUNT(A.ReparacionID) AS TotalReparaciones
FROM Tecnicos T
INNER JOIN Asignaciones A
    ON T.TecnicoID = A.TecnicoID
GROUP BY T.Nombre;
GO

-- =========================================
-- FILTRO POR MODELO USANDO WHERE
-- =========================================
SELECT E.Modelo, R.FechaSolicitud
FROM Equipos E
INNER JOIN Reparaciones R
    ON E.EquipoID = R.EquipoID
WHERE E.Modelo = 'XPS 13'
  AND R.FechaSolicitud >= DATEADD(MONTH, -1, GETDATE());
GO

-- =========================================
-- VALIDACION FINAL
-- =========================================
SELECT * FROM Usuarios;
SELECT * FROM Equipos;
SELECT * FROM Tecnicos;
SELECT * FROM Reparaciones;
SELECT * FROM Asignaciones;
SELECT * FROM DetallesReparacion;

SELECT ReparacionID, Estado
FROM Reparaciones;
GO

USE SistemaReparaciones;

ALTER TABLE DetallesReparacion
ADD FechaFin DATETIME;

USE SistemaReparaciones;

INSERT INTO DetallesReparacion
(ReparacionID, Diagnostico, AccionesRealizadas, FechaInicio, FechaFin, Costo)
VALUES
(1, 'Fuente de poder dañada', 'Cambio de fuente', GETDATE(), GETDATE(), 120.00),
(2, 'Pantalla fracturada', 'Reemplazo de pantalla', GETDATE(), GETDATE(), 200.00);

