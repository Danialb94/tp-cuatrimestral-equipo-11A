use master
go
create database TPC_PROG3_EQUIPO_11A
go
use TPC_PROG3_EQUIPO_11A
go
USE TPC_PROG3_EQUIPO_11A
GO

CREATE TABLE [dbo].[Especialidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[DuracionConsulta] [int] NOT NULL);

INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Clínica Médica', 30);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Pediatría', 30);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Cardiología', 45);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Dermatología', 30);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Ginecología', 45);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Traumatología', 45);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Oftalmología', 30);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Neurología', 60);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Psiquiatría', 60);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Otorrinolaringología', 30);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Endocrinología', 45);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Reumatología', 60);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Urología', 45);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Gastroenterología', 60);
INSERT INTO Especialidad (Descripcion, DuracionConsulta) VALUES ('Neumonología', 45);


select * from Especialidad
