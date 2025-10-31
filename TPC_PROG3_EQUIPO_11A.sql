-- Crear base de datos
USE master;
GO
CREATE DATABASE TPC_PROG3_EQUIPO_11A;
GO
USE TPC_PROG3_EQUIPO_11A;
GO

-- Tabla Permiso
CREATE TABLE Permiso (
    IdPermiso INT IDENTITY(1,1) PRIMARY KEY,
    Rol VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100) NULL
);

INSERT INTO Permiso (Rol, Descripcion) VALUES
('Administrador', 'Acceso total al sistema'),
('Medico', 'Acceso a agenda, pacientes y consultas'),
('Recepcionista', 'Acceso a turnos y gestión de pacientes'),
('Paciente', 'Acceso limitado a sus datos y turnos');

-- Tabla Usuario
CREATE TABLE Usuario (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL,
    Contrasenia VARCHAR(50) NOT NULL,
    IdPermiso INT NOT NULL,
    FOREIGN KEY (IdPermiso) REFERENCES Permiso(IdPermiso)
);

-- Tabla Persona
CREATE TABLE Persona (
    IdPersona INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NULL,
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    IdAdministrador INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);

-- Tabla Recepcionista
CREATE TABLE Recepcionista (
    IdRecepcionista INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);

-- Tabla Especialidad
CREATE TABLE Especialidad (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL,
    DuracionConsulta INT NOT NULL
);

-- Inserts de Especialidad
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

-- Tabla Horario
CREATE TABLE Horario (
    IdHorario INT IDENTITY(1,1) PRIMARY KEY,
    DiasSemana VARCHAR(100) NULL,
    HoraEntrada INT NOT NULL,
    HoraSalida INT NOT NULL
);

-- Tabla Medico
CREATE TABLE Medico (
    IdMedico INT IDENTITY(1,1) PRIMARY KEY,
    Matricula VARCHAR(20) NOT NULL,
    IdPersona INT NOT NULL,
    IdHorario INT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona),
    FOREIGN KEY (IdHorario) REFERENCES Horario(IdHorario)
);

-- Tabla de relación Medico-Especialidad (muchos a muchos)
CREATE TABLE MedicoEspecialidad (
    IdMedico INT NOT NULL,
    IdEspecialidad INT NOT NULL,
    PRIMARY KEY (IdMedico, IdEspecialidad),
    FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico),
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad(Id)
);

-- Tabla Imagen
CREATE TABLE Imagen (
    IdImagen INT IDENTITY(1,1) PRIMARY KEY,
    UrlImagen VARCHAR(200) NOT NULL
);

-- Tabla Paciente
CREATE TABLE Paciente (
    IdPaciente INT IDENTITY(1,1) PRIMARY KEY,
    TipoDocumento VARCHAR(20) NOT NULL,
    Documento VARCHAR(20) NOT NULL,
    Domicilio VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Cobertura VARCHAR(50) NULL,
    IdPersona INT NOT NULL,
    IdImagen INT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona),
    FOREIGN KEY (IdImagen) REFERENCES Imagen(IdImagen)
);

-- Tabla Turno
CREATE TABLE Turno (
    IdTurno INT IDENTITY(1,1) PRIMARY KEY,
    IdPaciente INT NOT NULL,
    IdMedico INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    Motivo VARCHAR(100) NULL,
    Observaciones VARCHAR(200) NULL,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente),
    FOREIGN KEY (IdMedico) REFERENCES Medico(IdMedico)
);

-- Tabla HistoriaClinica
CREATE TABLE HistoriaClinica (
    IdHistoriaClinica INT IDENTITY(1,1) PRIMARY KEY,
    IdTurno INT NOT NULL,
    Diagnostico VARCHAR(200) NULL,
    Tratamiento VARCHAR(200) NULL,
    FOREIGN KEY (IdTurno) REFERENCES Turno(IdTurno)
);
