-- Crear base de datos
USE master;
GO
CREATE DATABASE TPC_PROG3_EQUIPO_11A;
GO
USE TPC_PROG3_EQUIPO_11A;
GO
-- Tabla Imagenes
CREATE TABLE Imagenes (
    IdImagen INT IDENTITY(1,1) PRIMARY KEY,
    UrlImagen VARCHAR(200) NOT NULL
);
GO
-- Tabla Permisos
CREATE TABLE Permisos (
    IdPermiso INT IDENTITY(1,1) PRIMARY KEY,
    Rol VARCHAR(50) NOT NULL UNIQUE,
    Descripcion VARCHAR(100) NULL
);
GO
-- INSERT Permisos
INSERT INTO Permisos (Rol, Descripcion) VALUES
('Administrador', 'Acceso total al sistema'),
('Medico', 'Acceso a agenda, pacientes y consultas'),
('Recepcionista', 'Acceso a turnos y gestión de pacientes'),
('Paciente', 'Acceso limitado a sus datos y turnos');
GO
-- Tabla Usuarios
CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contrasenia VARCHAR(50) NOT NULL,
    IdPermiso INT NOT NULL,
    FOREIGN KEY (IdPermiso) REFERENCES Permisos(IdPermiso)
);
GO
-- INSERT Usuarios
INSERT INTO Usuarios (Email, Contrasenia, IdPermiso) VALUES
('administrador@hospital.com', 'AdminPass123', 1),
('medico.general@hospital.com', 'DoctorSecure', 2),
('recepcion@hospital.com', 'RecepClave', 3),
('paciente1@mail.com', 'MiContrasena', 4),
('paciente2@mail.com', 'MiContrasena', 4),
('otro.medico@hospital.com', 'Medico2025', 2);
GO
-- Tabla Personas
CREATE TABLE Personas (
    IdPersona INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono INT,
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
    IdImagen INT,
    FOREIGN KEY (IdImagen) REFERENCES Imagenes(IdImagen)
);
GO
-- Tabla Adminitradores
CREATE TABLE Administradores (
    IdAdministrador INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
);
GO
-- Tabla Recepcionistas
CREATE TABLE Recepcionistas (
    IdRecepcionista INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
);
GO
-- Tabla Especialidades
CREATE TABLE Especialidades (
    IdEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL UNIQUE,
    DuracionConsulta INT NOT NULL
);
GO
-- INSERT Especialidades
INSERT INTO Especialidades (Descripcion, DuracionConsulta) VALUES 
('Clínica Médica', 30),
('Pediatría', 30),
('Cardiología', 45),
('Dermatología', 30),
('Ginecología', 45),
('Traumatología', 45),
('Oftalmología', 30),
('Neurología', 60),
('Psiquiatría', 60),
('Otorrinolaringología', 30),
('Endocrinología', 45),
('Reumatología', 60),
('Urología', 45),
('Gastroenterología', 60),
('Neumonología', 45);
GO
-- Tabla Estados
CREATE TABLE Estados (
    IdEstado INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL UNIQUE
);
GO
-- INSERT Estados
INSERT INTO Estados (Descripcion) VALUES 
('Atendido'),
('Pendiente'),
('Cancelado por Clínica'),
('Cancelado por Paciente');
GO
-- Tabla Coberturas
CREATE TABLE Coberturas (
    IdCobertura INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL UNIQUE
);
GO
-- INSERT Coberturas
INSERT INTO Coberturas (Descripcion) VALUES 
('Accord Salud'),
('Avalian'),
('Galeano'),
('Medifé'),
('Medicus'),
('Osde'),
('Pami'),
('Swiss Medical');
GO
-- Tabla Medicos
CREATE TABLE Medicos (
    IdMedico INT IDENTITY(1,1) PRIMARY KEY,
    Matricula VARCHAR(20) NOT NULL,
    IdImagen INT NULL,
    IdUsuario INT NOT NULL,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario),
    FOREIGN KEY (IdImagen) REFERENCES Imagenes(IdImagen)
);
GO
-- Tabla Horarios
CREATE TABLE Horarios (
    IdHorario INT IDENTITY(1,1) PRIMARY KEY,
    DiaSemana TINYINT,
    HorarioEntrada TIME,
    HorarioSalida TIME
);
GO
-- Tabla MedicosHorarios
CREATE TABLE MedicosHorarios (
    IdMedico INT,
    IdHorario INT,
    PRIMARY KEY (IdMedico, IdHorario),
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FOREIGN KEY (IdHorario) REFERENCES Horarios(IdHorario)
);
GO
-- Tabla MedicosEspecialidades
CREATE TABLE MedicosEspecialidades (
    IdMedico INT,
    IdEspecialidad INT,
    PRIMARY KEY (IdMedico, IdEspecialidad),
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidades(IdEspecialidad)
);
GO
-- Tabla TiposDocumento
CREATE TABLE TiposDocumento (
    IdTipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(20) NOT NULL UNIQUE
);
GO
-- INSERT TiposDocumento
INSERT INTO TiposDocumento (Descripcion) VALUES 
('DNI'),
('Pasaporte');
GO
-- Tabla Pacientes
CREATE TABLE Pacientes (
    IdPaciente INT IDENTITY(1,1) PRIMARY KEY,
    IdTipoDocumento INT NOT NULL,
    FOREIGN KEY (IdTipoDocumento) REFERENCES TiposDocumento(IdTipoDocumento),
    Documento INT NOT NULL,
    Domicilio VARCHAR(20) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona),
    IdCobertura INT,
    FOREIGN KEY (IdCobertura) REFERENCES Coberturas(IdCobertura)
);
GO
-- Tabla Turnos
CREATE TABLE Turnos (
    IdTurno INT IDENTITY(1,1) PRIMARY KEY,
    IdPaciente INT,
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
    IdMedico INT NOT NULL,
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FechaTurno DATETIME NOT NULL,
    IdEstado INT NOT NULL,
    Diagnostico VARCHAR(200),
    Observacion VARCHAR(1000),
    FOREIGN KEY (IdEstado) REFERENCES Estados(IdEstado)

);
GO
-- Tabla CondicionesBase
CREATE TABLE CondicionesBase (
    IdCondicion INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(20) NOT NULL UNIQUE
);
GO
-- Tabla Alergias
CREATE TABLE Alergias (
    IdAlergia INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(20) NOT NULL UNIQUE
);
GO
-- Tabla PacientesCondiciones
CREATE TABLE PacientesCondiciones (
    IdPaciente INT,
    IdCondicion INT,
    PRIMARY KEY (IdPaciente, IdCondicion),
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
    FOREIGN KEY (IdCondicion) REFERENCES CondicionesBase(IdCondicion)
);
GO
-- Tabla PacientesAlergias
CREATE TABLE PacientesAlergias (
    IdPaciente INT,
    IdAlergia INT,
    PRIMARY KEY (IdPaciente, IdAlergia),
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
    FOREIGN KEY (IdAlergia) REFERENCES Alergias(IdAlergia)
);
