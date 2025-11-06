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
INSERT INTO Imagenes (UrlImagen) VALUES 
('https://i.pinimg.com/236x/48/ee/ab/48eeab94003a4450804d9cb33ddf3089.jpg'),
('https://img.freepik.com/foto-gratis/hermosa-joven-doctora-mirando-camara-oficina_1301-7807.jpg?semt=ais_hybrid&w=740&q=80'),
('https://www.shutterstock.com/image-photo/medical-concept-indian-beautiful-female-600nw-1635029716.jpg'),
('https://st3.depositphotos.com/1743476/32257/i/450/depositphotos_322579018-stock-photo-smiling-doctor-standing-on-grey.jpg'),
('https://thumbs.dreamstime.com/b/m%C3%A9dico-mujer-negra-y-retrato-de-sonrisa-para-la-salud-con-seguro-vida-en-el-hospital-bienestar-cara-felicidad-feliz-profesional-270732292.jpg'),
('https://img.freepik.com/foto-gratis/recepcionista-masculino-traje-elegante-horas-trabajo_23-2149714399.jpg'),
('https://cdn.prod.website-files.com/65489618a9e91669c78068e2/67ceb3efb0b55546114645d7_funciones-y-habilidades-de-una-recepcionista-lista-completa.webp'),
('https://plus.unsplash.com/premium_photo-1688572454849-4348982edf7d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmV0cmF0byUyMGRlJTIwcGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000'),
('https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8JTIzcGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000'),
('https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
('https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000');
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
    Estado BIT,
    FOREIGN KEY (IdPermiso) REFERENCES Permisos(IdPermiso)
);
GO
-- INSERT Usuarios
INSERT INTO Usuarios (Email, Contrasenia, IdPermiso, Estado) VALUES
('administrador@hospital.com', 'AdminPass123', 1, 1),
('medico1@hospital.com', 'MedClave1', 2, 1),
('medico2@hospital.com', 'MedClave2', 2, 1),
('medico3@hospital.com', 'MedClave3', 2, 1),
('medico4@hospital.com', 'MedClave4', 2, 1),
('recepcion1@hospital.com', 'RecepClave1', 3, 1),
('recepcion2@hospital.com', 'RecepClave2', 3, 1),
('paciente1@mail.com', 'PacClave1', 4, 1),
('paciente2@mail.com', 'PacClave2', 4, 1),
('paciente3@mail.com', 'PacClave3', 4, 1),
('paciente4@mail.com', 'PacClave4', 4, 1)
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
-- INSERT Personas
INSERT INTO Personas (Nombre, Apellido, Telefono, IdUsuario, IdImagen) VALUES
('Administrador', 'Clínica', 1145678901, 1, 1),
('Ana', 'Martínez', 1156789012, 2, 2),
('Laura', 'Fernández', 1167890123, 3, 3),
('Juan', 'Pérez', 1178901234, 4, 4),
('María', 'López', 1189012345, 5, 5),
('Roberto', 'Silva', 1190123456, 6, 6),
('Sofía', 'Ramírez', 1101234567, 7, 7),
('Valeria', 'Torres', 1112345678, 8, 8),
('Diego', 'Morales', 1123456789, 9, 9),
('Camila', 'Vega', 1134567890, 10, 10),
('Fernando', 'Castro', 1145678902, 11, 11);
GO
-- Tabla Adminitradores
CREATE TABLE Administradores (
    IdAdministrador INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
);
GO
-- INSERT Adminitradores
INSERT INTO Administradores (IdPersona) VALUES
(1);  -- Administrador Clínica
GO
-- Tabla Recepcionistas
CREATE TABLE Recepcionistas (
    IdRecepcionista INT IDENTITY(1,1) PRIMARY KEY,
    IdPersona INT NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
);
GO
-- INSERT Recepcionistas
INSERT INTO Recepcionistas (IdPersona) VALUES
(6), -- Roberto Silva
(7); -- Sofía Ramírez
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
    IdUsuario INT NOT NULL,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO
-- INSERT Medicos
INSERT INTO Medicos (Matricula, IdUsuario, IdPersona) VALUES
('MN-12345', 2, 2),   -- Dra. Ana Martínez
('MN-23456', 3, 3),   -- Dra. Laura Fernández
('MN-34567', 4, 4), -- Dr. Juan Pérez
('MN-45678', 5, 5); -- Dra. María López
GO
-- Tabla Horarios
CREATE TABLE Horarios (
    IdHorario INT IDENTITY(1,1) PRIMARY KEY,
    DiaSemana TINYINT,
    HorarioEntrada TIME,
    HorarioSalida TIME
);
GO
-- INSERT Horarios
INSERT INTO Horarios (DiaSemana, HorarioEntrada, HorarioSalida) VALUES
(1, '08:00', '12:00'), -- Lunes mañana
(1, '14:00', '18:00'), -- Lunes tarde
(2, '08:00', '12:00'), -- Martes mañana
(2, '14:00', '18:00'), -- Martes tarde
(3, '08:00', '12:00'), -- Miércoles mañana
(3, '14:00', '18:00'), -- Miércoles tarde
(4, '08:00', '12:00'), -- Jueves mañana
(4, '14:00', '18:00'), -- Jueves tarde
(5, '08:00', '12:00'), -- Viernes mañana
(5, '14:00', '18:00'); -- Viernes tarde
GO
-- Tabla MedicosHorariosEspecialidades
CREATE TABLE MedicosHorariosEspecialidades (
    IdMedico INT,
    IdHorario INT,
    IdEspecialidad INT,
    PRIMARY KEY (IdMedico, IdHorario, IdEspecialidad),
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FOREIGN KEY (IdHorario) REFERENCES Horarios(IdHorario),
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidades(IdEspecialidad)
);
GO
-- INSERT MedicosHorariosEspecialidades
INSERT INTO MedicosHorariosEspecialidades (IdMedico, IdHorario, IdEspecialidad) VALUES
(1, 1, 1),  -- Lunes mañana - Dra. Ana Martínez, Clínica Médica
(1, 5, 3),  -- Miércoles mañana - Dra. Ana Martínez, Cardiología
(1, 9, 1),  -- Viernes mañana - Dra. Ana Martínez, Clínica Médica
(2, 4, 2),  -- Martes tarde - Dra. Laura Fernández, Pediatría
(2, 8, 2),  -- Jueves tarde - Dra. Laura Fernández, Pediatría
(3, 2, 4),  -- Lunes tarde - Dr. Juan Pérez, Dermatología
(3, 6, 9),  -- Miércoles tarde - Dr. Juan Pérez, Psiquiatría
(4, 3, 6),  -- Martes mañana - Dra. María López, Traumatología
(4, 7, 6),  -- Jueves mañana - Dra. María López, Traumatología
(4, 10, 6);  -- Viernes tarde - Dra. María López, Traumatología
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
-- INSERT Pacientes
INSERT INTO Pacientes (IdTipoDocumento, Documento, Domicilio, FechaNacimiento, IdPersona, IdCobertura) VALUES
(1, 38456789, 'Av. Corrientes 1234', '1985-03-15', 8, 6),  -- Valeria Torres - Osde
(1, 42567890, 'Calle Falsa 567', '1992-07-22', 9, 3),      -- Diego Morales - Galeano
(1, 35678901, 'San Martín 890', '1980-11-30', 10, 1),       -- Camila Vega - Accord Salud
(1, 40789012, 'Belgrano 1122', '1988-05-18', 11, 5);       -- Fernando Castro - Medicus
GO
-- Tabla Turnos
CREATE TABLE Turnos (
    IdTurno INT IDENTITY(1,1) PRIMARY KEY,
    IdPaciente INT,
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
    IdMedico INT NOT NULL,
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FechaTurno DATETIME NOT NULL,
    Diagnostico VARCHAR(200),
    Observacion VARCHAR(1000),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estados(IdEstado),
    IdEspecialidad INT NOT NULL,
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidades(IdEspecialidad)
);
GO
INSERT INTO Turnos (IdPaciente, IdMedico, FechaTurno, IdEstado, Diagnostico, Observacion, IdEspecialidad) VALUES
(1, 1, '2025-10-29 08:00:00', 1, 'Control de hipertensión arterial', 'Paciente controlado, continuar con medicación actual', 1),
-- Valeria Torres, Dra. Ana Martinez
(2, 2, '2025-10-30 15:00:00', 2, NULL, NULL, 2),
-- Diego Morales, Dra. Laura Fernández
(3, 3, '2025-12-1 17:00:00', 1, 'Dermatitis alérgica', 'Se prescribe tratamiento tópico', 4),
-- Camila Vega, Dr. Juan Pérez
(4, 4, '2024-10-25 09:00:00', 4, NULL, NULL, 6),
-- Fernando Castro, Dra. María López
(1, 1, '2024-12-3 10:00:00', 2, NULL, NULL, 3);
-- Valeria Torres, Dra. Ana Martinez
GO
-- Tabla CondicionesBase
CREATE TABLE CondicionesBase (
    IdCondicion INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(20) NOT NULL UNIQUE
);
GO
-- INSERT CondicionesBase
INSERT INTO CondicionesBase (Descripcion) VALUES
('Hipertensión'),
('Diabetes Tipo 2'),
('Asma'),
('Obesidad');
GO
-- Tabla Alergias
CREATE TABLE Alergias (
    IdAlergia INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(20) NOT NULL UNIQUE
);
GO
-- INSERT Alergias
INSERT INTO Alergias (Descripcion) VALUES
('Penicilina'),
('Látex');
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
-- INSERT PacientesCondiciones
INSERT INTO PacientesCondiciones (IdPaciente, IdCondicion) VALUES
(1, 1), -- Hipertensión - Valeria Torres
(2, 2), -- Diabetes Tipo 2 - Diego Morales
(2, 4), -- Obesidad - Diego Morales
(3, 3); -- Asma - Camila Vega
GO
-- Tabla PacientesAlergias
CREATE TABLE PacientesAlergias (
    IdPaciente INT,
    IdAlergia INT,
    PRIMARY KEY (IdPaciente, IdAlergia),
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
    FOREIGN KEY (IdAlergia) REFERENCES Alergias(IdAlergia)
);
GO
-- INSERT PacientesAlergias
INSERT INTO PacientesAlergias (IdPaciente, IdAlergia) VALUES
(1, 1), -- Penicilina - Valeria Torres
(1, 2), -- Latex - Valeria Torres
(4,2); -- Latex - Fernando Castro




