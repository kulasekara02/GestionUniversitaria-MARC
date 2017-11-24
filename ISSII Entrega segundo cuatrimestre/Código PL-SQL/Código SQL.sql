DROP TABLE Alumnos CASCADE CONSTRAINTS;
DROP TABLE AlumnosPertenecenAGrupos CASCADE CONSTRAINTS;
DROP TABLE Asignaturas CASCADE CONSTRAINTS;
DROP TABLE AsignaturasPuntuadasConNotas CASCADE CONSTRAINTS;
DROP TABLE AsignaturasImpartidasEnAulas CASCADE CONSTRAINTS;
DROP TABLE AsignaturasPertenecenAGrados CASCADE CONSTRAINTS;
DROP TABLE Aulas CASCADE CONSTRAINTS;
DROP TABLE Becarios CASCADE CONSTRAINTS;
DROP TABLE Becas CASCADE CONSTRAINTS;
DROP TABLE Departamentos CASCADE CONSTRAINTS;
DROP TABLE Despachos CASCADE CONSTRAINTS;
DROP TABLE Eventos CASCADE CONSTRAINTS;
DROP TABLE Expedientes CASCADE CONSTRAINTS;
DROP TABLE Grados CASCADE CONSTRAINTS;
DROP TABLE Grupos CASCADE CONSTRAINTS;
DROP TABLE GruposAsistenAClaseEnAulas CASCADE CONSTRAINTS;
DROP TABLE HorarioProfesores CASCADE CONSTRAINTS;
DROP TABLE Matriculas CASCADE CONSTRAINTS;
DROP TABLE MatriculasContienenAsignaturas CASCADE CONSTRAINTS;
DROP TABLE MatriculasPertenecenAGrados CASCADE CONSTRAINTS;
DROP TABLE Notas CASCADE CONSTRAINTS;
DROP TABLE Profesores CASCADE CONSTRAINTS;
DROP TABLE ProfesoresImpartenAsignaturas CASCADE CONSTRAINTS;
DROP TABLE ProfesoresImpartenEnGrupos CASCADE CONSTRAINTS;
DROP TABLE Tutorias CASCADE CONSTRAINTS;
DROP TABLE Usuarios CASCADE CONSTRAINTS;
 
--Borrado de secuencias
DROP SEQUENCE SEC_Aulas;
DROP SEQUENCE SEC_Departamentos;
DROP SEQUENCE SEC_Despachos;
DROP SEQUENCE SEC_Eventos;
DROP SEQUENCE SEC_Grados;
DROP SEQUENCE SEC_Grupos;
DROP SEQUENCE SEC_HorarioProfesores;
DROP SEQUENCE SEC_Matriculas;
DROP SEQUENCE SEC_Notas;
DROP SEQUENCE SEC_Tutorias;

--Creación de tablas
CREATE TABLE Alumnos(
    DNI CHAR(9),
    Nombre VARCHAR2(20),
    Apellidos VARCHAR2(35),
	Sexo VARCHAR(10),
	Telefono VARCHAR(10),
	Direccion VARCHAR2(200),
	Provincia VARCHAR(20),
	Codigo_Postal VARCHAR(6),
	Modalidad VARCHAR(8),
	Forma_Acceso VARCHAR(50),
	Estado_Beca VARCHAR(30),
    Fecha_Nacimiento DATE,
    Email VARCHAR2(40)
);
 
CREATE TABLE AlumnosPertenecenAGrupos(
    DNI CHAR(9),
    OID_Grup NUMBER
);
 
CREATE TABLE Asignaturas(
    Codigo_Asig INTEGER,
    Nombre VARCHAR2(100),
    Acronimo VARCHAR2(7),
    Creditos NUMBER,
    Periodo VARCHAR2(25),
    Curso INTEGER,
    Tipo VARCHAR2(25),
    OID_Dep NUMBER  
);
 
CREATE TABLE AsignaturasPuntuadasConNotas(
    Codigo_Asig INTEGER,
    OID_N NUMBER
);
 
CREATE TABLE AsignaturasImpartidasEnAulas(
    Codigo_Asig INTEGER,
    OID_A NUMBER,
    Fecha DATE
);
 
CREATE TABLE AsignaturasPertenecenAGrados(
    Codigo_Asig INTEGER,
    OID_G NUMBER
);
 
CREATE TABLE Aulas(
    OID_A NUMBER,
    Nombre VARCHAR2(6),
    Capacidad INTEGER,
    Tipo VARCHAR2(15)
);
 
CREATE TABLE Becarios(
    DNI CHAR(9),
    Codigo_Beca CHAR(8),
    Fecha_Comienzo DATE,
    Fecha_Fin DATE
);
 
CREATE TABLE Becas(
    Codigo_Beca CHAR(8),
    Cuantia_Fija NUMBER,
    Cuantia_Variable NUMBER,
    Tipo VARCHAR2(15)
);
 
CREATE TABLE Departamentos(
    OID_Dep NUMBER,
    Nombre VARCHAR2(50)
);
 
CREATE TABLE Despachos(
    OID_D NUMBER,
    Nombre VARCHAR2(6),
    Capacidad INTEGER
);
 
CREATE TABLE Eventos(
	OID_E NUMBER,
    DNI CHAR(9),
    FECHA DATE,
    NOMBRE VARCHAR2(50)
);

CREATE TABLE Expedientes(
    Codigo_Exp INTEGER,
    DNI CHAR(9)
);
 
CREATE TABLE Grados(
    OID_G NUMBER,
    Nombre VARCHAR2(100)
);
 
CREATE TABLE Grupos(
    OID_Grup NUMBER,
    Nombre VARCHAR2(10)
);
 
CREATE TABLE GruposAsistenAClaseEnAulas(
    OID_Grup NUMBER,
    OID_A NUMBER
);

CREATE TABLE HorarioProfesores(
	OID_H NUMBER,
	DNI CHAR(9),
	Hora_Comienzo_Tutoria VARCHAR2(5),
	Hora_Fin_Tutoria VARCHAR2(5),
	Dia VARCHAR2(10)
);
 
CREATE TABLE Matriculas(
    Codigo_Matric INTEGER,
    Fecha DATE,
    Curso INTEGER,
    DNI CHAR(9)
);
 
CREATE TABLE MatriculasContienenAsignaturas(
    Codigo_Matric INTEGER,
    Codigo_Asig INTEGER
);
 
CREATE TABLE MatriculasPertenecenAGrados(
    Codigo_Matric INTEGER,
    OID_G NUMBER
);
 
CREATE TABLE Notas(
    OID_N NUMBER,
    Valor NUMBER,
    Calificacion VARCHAR2(25),
    Convocatoria VARCHAR2(15),
    Curso INTEGER,
    Fecha DATE,
    Codigo_Exp INTEGER
);
 
CREATE TABLE Profesores(
    DNI CHAR(9),
    Nombre VARCHAR2(20),
    Apellidos VARCHAR2(35),
    Fecha_Nacimiento DATE,
    Email VARCHAR2(40),
    Categoria VARCHAR2(20),
    OID_D NUMBER,
    OID_Dep NUMBER
);
 
CREATE TABLE ProfesoresImpartenAsignaturas(
    DNI CHAR(9),
    Codigo_Asig INTEGER,
    Dedicacion NUMBER
);
 
CREATE TABLE ProfesoresImpartenEnGrupos(
    DNI CHAR(9),
    OID_Grup NUMBER
); 
 
CREATE TABLE Tutorias(
    OID_T NUMBER,
    Fecha DATE,
    Hora_Comienzo VARCHAR2(5),
    Duracion INTEGER,
	Estado VARCHAR(20),
    DNI_Alum CHAR(9),
    DNI_Prof CHAR(9)
);
 
CREATE TABLE Usuarios(
    DNI CHAR(9),
    Pass VARCHAR2(50),
    TipoUsuario VARCHAR2(20),
    EsAdministrador NUMBER(1)
);
 
 
--Restricciones NOT NULL
ALTER TABLE Alumnos MODIFY (DNI NOT NULL);
ALTER TABLE AlumnosPertenecenAGrupos MODIFY (DNI NOT NULL);
ALTER TABLE AlumnosPertenecenAGrupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Asignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE Asignaturas MODIFY (Nombre NOT NULL);
ALTER TABLE AsignaturasPuntuadasConNotas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasPuntuadasConNotas MODIFY (OID_N NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (OID_A NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (Fecha NOT NULL);
ALTER TABLE AsignaturasPertenecenAGrados MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasPertenecenAGrados MODIFY (OID_G NOT NULL);
ALTER TABLE Aulas MODIFY (OID_A NOT NULL);
ALTER TABLE Aulas MODIFY (Nombre NOT NULL);
ALTER TABLE Becarios MODIFY (DNI NOT NULL);
ALTER TABLE Becarios MODIFY (Codigo_Beca NOT NULL);
ALTER TABLE Becas MODIFY (Codigo_Beca NOT NULL);
ALTER TABLE Departamentos MODIFY (OID_Dep NOT NULL);
ALTER TABLE Departamentos MODIFY (Nombre NOT NULL);
ALTER TABLE Despachos MODIFY (OID_D NOT NULL);
ALTER TABLE Despachos MODIFY (Nombre NOT NULL);
ALTER TABLE Eventos MODIFY (DNI NOT NULL);
ALTER TABLE Eventos MODIFY (Fecha NOT NULL);
ALTER TABLE Eventos MODIFY (Nombre NOT NULL);
ALTER TABLE Eventos MODIFY (OID_E NOT NULL);
ALTER TABLE Expedientes MODIFY (Codigo_Exp NOT NULL);
ALTER TABLE Expedientes MODIFY (DNI NOT NULL);
ALTER TABLE Grados MODIFY (OID_G NOT NULL);
ALTER TABLE Grados MODIFY (Nombre NOT NULL);
ALTER TABLE Grupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Grupos MODIFY (Nombre NOT NULL);
ALTER TABLE GruposAsistenAClaseEnAulas MODIFY (OID_Grup NOT NULL);
ALTER TABLE GruposAsistenAClaseEnAulas MODIFY (OID_A NOT NULL);
ALTER TABLE HorarioProfesores MODIFY (DNI NOT NULL);
ALTER TABLE Matriculas MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE Matriculas MODIFY (DNI NOT NULL);
ALTER TABLE MatriculasContienenAsignaturas MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE MatriculasContienenAsignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE MatriculasPertenecenAGrados MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE MatriculasPertenecenAGrados MODIFY (OID_G NOT NULL);
ALTER TABLE Notas MODIFY (OID_N NOT NULL);
ALTER TABLE Notas MODIFY (Codigo_Exp NOT NULL);
ALTER TABLE Profesores MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenAsignaturas MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenAsignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE ProfesoresImpartenEnGrupos MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenEnGrupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Tutorias MODIFY (OID_T NOT NULL);
ALTER TABLE Tutorias MODIFY (DNI_Alum NOT NULL);
ALTER TABLE Tutorias MODIFY (Estado NOT NULL);
ALTER TABLE Tutorias MODIFY (DNI_Prof NOT NULL);
ALTER TABLE Usuarios MODIFY (DNI NOT NULL); 
 
--Primary Keys
ALTER TABLE Alumnos ADD CONSTRAINT PK_Alumnos PRIMARY KEY (DNI);
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT PK_AlumPertAGrup PRIMARY KEY (DNI, OID_Grup);
ALTER TABLE Asignaturas ADD CONSTRAINT PK_Asignaturas PRIMARY KEY (Codigo_Asig);
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT PK_AsigPuntConNot PRIMARY KEY (Codigo_Asig, OID_N);
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT PK_AsigImpartEnAulas PRIMARY KEY (Codigo_Asig, OID_A, Fecha);
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT PK_AsigPertAGrad PRIMARY KEY (Codigo_Asig, OID_G);
ALTER TABLE Aulas ADD CONSTRAINT PK_Aulas PRIMARY KEY (OID_A);
ALTER TABLE Becarios ADD CONSTRAINT PK_Becarios PRIMARY KEY (DNI, Codigo_Beca);
ALTER TABLE Becas ADD CONSTRAINT PK_Becas PRIMARY KEY (Codigo_Beca);
ALTER TABLE Departamentos ADD CONSTRAINT PK_Departamentos PRIMARY KEY (OID_Dep);
ALTER TABLE Despachos ADD CONSTRAINT PK_Despachos PRIMARY KEY (OID_D);
ALTER TABLE Eventos ADD CONSTRAINT PK_Eventos PRIMARY KEY (OID_E);
ALTER TABLE Expedientes ADD CONSTRAINT PK_Expedientes PRIMARY KEY (Codigo_Exp);
ALTER TABLE Grados ADD CONSTRAINT PK_Grados PRIMARY KEY (OID_G);
ALTER TABLE Grupos ADD CONSTRAINT PK_Grupos PRIMARY KEY (OID_Grup);
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT PK_GrupAsisAClaseEnAulas PRIMARY KEY (OID_Grup, OID_A);
ALTER TABLE HorarioProfesores ADD CONSTRAINT PK_HorarioProfesores PRIMARY KEY (OID_H);
ALTER TABLE Matriculas ADD CONSTRAINT PK_Matriculas PRIMARY KEY (Codigo_Matric);
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT PK_MatricContAsig PRIMARY KEY (Codigo_Matric, Codigo_Asig);
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT PK_MatricPertAGrad PRIMARY KEY (Codigo_Matric, OID_G);
ALTER TABLE Notas ADD CONSTRAINT PK_Notas PRIMARY KEY (OID_N);
ALTER TABLE Profesores ADD CONSTRAINT PK_Profesores PRIMARY KEY (DNI);
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT PK_ProfImpAsig PRIMARY KEY (DNI, Codigo_Asig);
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT PK_ProfImpEnGrup PRIMARY KEY (DNI, OID_Grup);
ALTER TABLE Tutorias ADD CONSTRAINT PK_Tutorias PRIMARY KEY (OID_T);
ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios PRIMARY KEY (DNI);
 
 
--Alternate Keys
ALTER TABLE Asignaturas ADD CONSTRAINT AK_Asignaturas UNIQUE (Nombre);
ALTER TABLE Aulas ADD CONSTRAINT AK_Aulas UNIQUE (Nombre);
ALTER TABLE Departamentos ADD CONSTRAINT AK_Departamentos UNIQUE (Nombre);
ALTER TABLE Despachos ADD CONSTRAINT AK_Despachos UNIQUE (Nombre);
ALTER TABLE Grados ADD CONSTRAINT AK_Grados UNIQUE (Nombre);
ALTER TABLE Grupos ADD CONSTRAINT AK_Grupos UNIQUE (Nombre);
 
 
--Foreign Keys
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT FK_AlumPertAGrup_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT FK_AlumPertAGrup_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE Asignaturas ADD CONSTRAINT FK_Asignaturas_Dep FOREIGN KEY (OID_Dep) REFERENCES Departamentos (OID_Dep) ON DELETE CASCADE;
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT FK_AsigPuntConNot_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT FK_AsigPuntConNot_Not FOREIGN KEY (OID_N) REFERENCES Notas (OID_N) ON DELETE CASCADE;
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT FK_AsigImpartEnAulas_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT FK_AsigImpartEnAulas_Aulas FOREIGN KEY (OID_A) REFERENCES Aulas (OID_A) ON DELETE CASCADE;
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT FK_AsigPertAGrad_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT FK_AsigPertAGrad_G FOREIGN KEY (OID_G) REFERENCES Grados (OID_G) ON DELETE CASCADE;
ALTER TABLE Becarios ADD CONSTRAINT FK_Becarios_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE Becarios ADD CONSTRAINT FK_Becarios_Becas FOREIGN KEY (Codigo_Beca) REFERENCES Becas (Codigo_Beca) ON DELETE CASCADE;
ALTER TABLE Expedientes ADD CONSTRAINT FK_Expedientes_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT FK_GrupAsisAClaseEnAulas_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT FK_GrupAsisAClaseEnAulas_Aulas FOREIGN KEY (OID_A) REFERENCES Aulas (OID_A) ON DELETE CASCADE;
ALTER TABLE HorarioProfesores ADD CONSTRAINT FK_HorarioProfesores_Prof FOREIGN KEY (DNI) REFERENCES Profesores (DNI) ON DELETE CASCADE;
ALTER TABLE Matriculas ADD CONSTRAINT FK_Matriculas_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT FK_MatricContAsig_Matric FOREIGN KEY (Codigo_Matric) REFERENCES Matriculas (Codigo_Matric) ON DELETE CASCADE;
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT FK_MatricContAsig_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT FK_MatricPertAGrad_Matric FOREIGN KEY (Codigo_Matric) REFERENCES Matriculas (Codigo_Matric) ON DELETE CASCADE;
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT FK_MatricPertAGrad_G FOREIGN KEY (OID_G) REFERENCES Grados (OID_G) ON DELETE CASCADE;
ALTER TABLE Notas ADD CONSTRAINT FK_Notas_Exp FOREIGN KEY (Codigo_Exp) REFERENCES Expedientes (Codigo_Exp) ON DELETE CASCADE;
ALTER TABLE Profesores ADD CONSTRAINT FK_Profesores_D FOREIGN KEY (OID_D) REFERENCES Despachos (OID_D) ON DELETE CASCADE;
ALTER TABLE Profesores ADD CONSTRAINT FK_Profesores_Dep FOREIGN KEY (OID_Dep) REFERENCES Departamentos (OID_Dep) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT FK_ProfImpAsig_Prof FOREIGN KEY (DNI) REFERENCES Profesores (DNI) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT FK_ProfImpAsig_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT FK_ProfImpEnGrup_Prof FOREIGN KEY (DNI) REFERENCES Profesores (DNI) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT FK_ProfImpEnGrup_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE Tutorias ADD CONSTRAINT FK_Tutorias_Alum FOREIGN KEY (DNI_Alum) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE Tutorias ADD CONSTRAINT FK_Tutorias_Prof FOREIGN KEY (DNI_Prof) REFERENCES Profesores (DNI) ON DELETE CASCADE;
 
--Restricciones de tablas
ALTER TABLE Alumnos ADD CONSTRAINT CK_DNI_Alumnos CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT CK_DNI_AlumPertAGrup CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Sexo_Alumnos CHECK (Sexo IN ('Hombre', 'Mujer'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Modalidad_Alumnos CHECK (Modalidad IN ('Español', 'Inglés'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Acceso_Alumnos CHECK (Forma_Acceso IN ('Estudios Postobligatorios', 'Ciclo Formativo de Grado Medio', 'Ciclo Formativo de Grado Superior', 'Grado', 'Mayores de 25 años', 'Mayores de 45 años', 'Otros'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Becas_Alumnos CHECK (Estado_Beca IN ('No soy becario', 'Becario MEC', 'Deportista alto riesgo', 'Discapacitados'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Cod_Asig_Asignaturas CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Periodo_Asignaturas CHECK (Periodo IN ('Anual', 'Primer cuatrimestre', 'Segundo cuatrimestre'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Curso_Asignaturas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Tipo_Asignaturas CHECK (Tipo IN ('Troncal', 'Obligatorio', 'Optativo'));
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT CK_Cod_Asig_AsigPuntConNot CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT CK_Cod_Asig_AsigImpartEnAulas CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT CK_Cod_Asig_AsigPertAGrad CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Aulas ADD CONSTRAINT CK_Tipo_Aulas CHECK (Tipo IN ('Teoría', 'Laboratorio', 'Examen'));
ALTER TABLE Becarios ADD CONSTRAINT CK_DNI_Becarios CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Becarios ADD CONSTRAINT CK_Codigo_Becas_Becarios CHECK (REGEXP_LIKE(Codigo_Beca, '[0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
ALTER TABLE Becarios ADD CONSTRAINT CK_Fechas_Becarios CHECK (TO_DATE(Fecha_Comienzo, 'DD/MM/YYYY') < TO_DATE(Fecha_Fin, 'DD/MM/YYYY'));
ALTER TABLE Becas ADD CONSTRAINT CK_Codigo_Becas CHECK (REGEXP_LIKE(Codigo_Beca, '[0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
ALTER TABLE Becas ADD CONSTRAINT CK_Tipo_Becas CHECK (Tipo IN ('Ordinaria', 'Movilidad', 'Empresa'));
ALTER TABLE Expedientes ADD CONSTRAINT CK_Codigo_Expedientes CHECK (REGEXP_LIKE(Codigo_Exp, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Expedientes ADD CONSTRAINT CK_DNI_Expedientes CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE HorarioProfesores ADD CONSTRAINT CK_Dias_Tutorias CHECK (Dia IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'));
ALTER TABLE Matriculas ADD CONSTRAINT CK_Cod_Matric_Matriculas CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Matriculas ADD CONSTRAINT CK_Curso_Matriculas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT CK_Cod_Matric_MatricContAsig CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT CK_Cod_Asig_MatricContAsig CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT CK_Cod_Matric_MatricPertAGrad CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Notas ADD CONSTRAINT CK_Calificacion_Notas CHECK (Calificacion IN ('Suspenso', 'Aprobado', 'Notable', 'Sobresaliente', 'Matrícula de honor'));
ALTER TABLE Notas ADD CONSTRAINT CK_Convocatoria_Notas CHECK (Convocatoria IN ('Primera', 'Segunda', 'Tercera'));
ALTER TABLE Notas ADD CONSTRAINT CK_Curso_Notas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE Profesores ADD CONSTRAINT CK_DNI_Profesores CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Categoria_Profesores CHECK (Categoria IN ('Catedrático', 'Titular', 'Contratado doctor', 'Colaborador', 'Ayudante doctor', 'Ayudante', 'Interino'));
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT CK_DNI_ProfImpAsig CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT CK_Cod_Asig_ProfImpAsig CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT CK_DNI_ProfImpEnGrup CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_DNI_Alum_Tutorias CHECK (REGEXP_LIKE(DNI_Alum, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_DNI_Prof_Tutorias CHECK (REGEXP_LIKE(DNI_Prof, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_Estado_Tutorias CHECK (Estado IN ('Pendiente', 'Rechazada', 'Aceptada'));
ALTER TABLE Usuarios ADD CONSTRAINT CK_TipoUsuario_Usuarios CHECK (TipoUsuario IN ('Alumno', 'Profesor'));
ALTER TABLE Usuarios ADD CONSTRAINT CK_EsAdministrador_Usuarios CHECK (EsAdministrador IN ('0', '1'));

--Secuencias
CREATE SEQUENCE SEC_Aulas
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Departamentos
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Despachos
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;

CREATE SEQUENCE SEC_Eventos
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Grados
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Grupos
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;

CREATE SEQUENCE SEC_HorarioProfesores
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Notas
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;
 
CREATE SEQUENCE SEC_Tutorias
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;

CREATE SEQUENCE SEC_Matriculas
INCREMENT BY 1
START WITH 1000000
MAXVALUE 999999999999;


--Triggers asociados a secuencias
CREATE OR REPLACE TRIGGER TR_SEC_Aulas
BEFORE INSERT ON Aulas
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Aulas.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_A := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Departamentos
BEFORE INSERT ON Departamentos
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Departamentos.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_Dep := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Despachos
BEFORE INSERT ON Despachos
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Despachos.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_D := valorSec;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_Eventos
BEFORE INSERT ON Eventos 
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Eventos.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_E := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Grados
BEFORE INSERT ON Grados
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Grados.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_G := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Grupos
BEFORE INSERT ON Grupos
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Grupos.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_Grup := valorSec;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_HorarioProfesores
BEFORE INSERT ON HorarioProfesores 
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_HorarioProfesores.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_H := valorSec;
END;
/

CREATE OR REPLACE TRIGGER TR_SEC_Matriculas
BEFORE INSERT ON Matriculas
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Matriculas.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.Codigo_Matric := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Notas
BEFORE INSERT ON Notas
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Notas.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_N := valorSec;
END;
/
 
CREATE OR REPLACE TRIGGER TR_SEC_Tutorias
BEFORE INSERT ON Tutorias
FOR EACH ROW
DECLARE
    valorSec NUMBER := 0;
BEGIN
    SELECT SEC_Tutorias.NEXTVAL INTO valorSec FROM DUAL;
    :NEW.OID_T := valorSec;
END;
/


--Procedimientos y funciones asociadas a las reglas funcionales
--RF-001
CREATE OR REPLACE PROCEDURE PR_Matricular_Asig (v_codigo_matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_codigo_asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE)
IS
BEGIN
    INSERT INTO MatriculasContienenAsignaturas (Codigo_Matric, Codigo_Asig) VALUES (v_codigo_matric, v_codigo_asig);
    COMMIT;
END;
/
 
--RF-002
CREATE OR REPLACE PROCEDURE PR_Anular_Asig (v_codigo_matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_codigo_asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE)
IS
BEGIN
    DELETE FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_codigo_matric AND Codigo_Asig = v_codigo_asig;
    COMMIT;
END;
/
 
--RF-003
CREATE OR REPLACE PROCEDURE PR_Evaluar_Alum (v_codigo_asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE)
IS
BEGIN
    INSERT INTO AsignaturasPuntuadasConNotas (Codigo_Asig, OID_N) VALUES (v_codigo_asig, v_OID_N);
    COMMIT;
END;
/
 
--RF-004
CREATE OR REPLACE PROCEDURE PR_Alum_Matriculado_En_Asig (v_DNI IN Alumnos.DNI%TYPE, v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
    v_EstaMatriculado NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_EstaMatriculado FROM MatriculasContienenAsignaturas WHERE Codigo_Asig = v_codigo_asig AND Codigo_Matric IN (SELECT Codigo_Matric FROM Matriculas WHERE DNI = v_DNI);
    IF v_EstaMatriculado = 1 THEN
        DBMS_OUTPUT.PUT_LINE('El alumno está matriculado en dicha asignatura.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El alumno no está matriculado en dicha asignatura.');
    END IF;
END;    
/
 
--RF-005
CREATE OR REPLACE PROCEDURE PR_CalfMed_Agrup_Por_Asig (v_DNI IN Alumnos.DNI%TYPE)
IS 
    CURSOR C IS
        SELECT Nombre, AVG(Valor) AS Nota_Media FROM Asignaturas NATURAL JOIN AsignaturasPuntuadasConNotas NATURAL JOIN Notas WHERE Codigo_Exp IN (SELECT Codigo_Exp FROM Expedientes WHERE DNI = v_DNI) GROUP BY Nombre;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Asignaturas:', 100) || RPAD('Nota media:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 125, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Nota_Media, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-006
CREATE OR REPLACE PROCEDURE PR_Asig_Orden_Por_Curso (v_DNI IN Alumnos.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Nombre FROM Asignaturas NATURAL JOIN MatriculasContienenAsignaturas WHERE Codigo_Matric IN (SELECT Codigo_Matric FROM Matriculas WHERE DNI = v_DNI) ORDER BY Curso;
    v_NombreAsig Asignaturas.Nombre%TYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_NombreAsig;
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(v_NombreAsig);
    FETCH C INTO v_NombreAsig;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-007
CREATE OR REPLACE PROCEDURE PR_Expediente_Alumno (v_DNI IN Alumnos.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Valor, Calificacion, Convocatoria, Curso, Fecha FROM Notas NATURAL JOIN Expedientes NATURAL JOIN AsignaturasPuntuadasConNotas NATURAL JOIN Asignaturas WHERE Codigo_Exp IN (SELECT Codigo_Exp FROM Expedientes WHERE DNI = v_DNI);
    v_Notas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Notas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Asignaturas:', 25) || RPAD('Nota:', 25) || RPAD('Calificación:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 135, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.Nombre, 25) || RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25));
    FETCH C INTO v_Notas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-008
CREATE OR REPLACE PROCEDURE PR_Asociar_Asignatura_Dep (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE, v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
    v_OID_Dep Asignaturas.OID_Dep%TYPE;
BEGIN
    SELECT OID_Dep INTO v_OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento;
    UPDATE Asignaturas SET OID_Dep = v_OID_Dep WHERE Codigo_Asig = v_codigo_asig;
    COMMIT;
END;
/
 
--RF-009
CREATE OR REPLACE PROCEDURE PR_Asociar_Beca (v_codigo_beca IN Becarios.Codigo_Beca%TYPE, v_DNI IN Becarios.DNI%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE)
IS
BEGIN
    INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_Fecha_Comienzo, v_Fecha_Fin);
    COMMIT;
END;
/
 
--RF-010
CREATE OR REPLACE PROCEDURE PR_Asociar_Duracion_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_DNI IN Becarios.DNI%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE)
IS
    v_Existe NUMBER;
    v_FechaComienzo DATE := SYSDATE;
BEGIN
    SELECT COUNT(*) INTO v_Existe FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_codigo_beca;
    IF v_Existe = 1 THEN
        UPDATE Becarios SET Fecha_Fin = v_Fecha_Fin WHERE DNI = v_DNI AND Codigo_Beca = v_codigo_beca; 
    ELSE
        INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_FechaComienzo, v_Fecha_Fin);
    END IF;
    COMMIT;
END;
/
 
--RF-011
CREATE OR REPLACE PROCEDURE PR_Asociar_Cuantia_Fija_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_cuantia_fija IN Becas.Cuantia_Fija%TYPE)
IS
BEGIN
    UPDATE Becas SET Cuantia_Fija = v_cuantia_fija WHERE Codigo_Beca = v_codigo_beca;
    COMMIT;
END;
/
 
--RF-012
CREATE OR REPLACE PROCEDURE PR_Asociar_Cuantia_Var_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_cuantia_variable IN Becas.Cuantia_Variable%TYPE)
IS
BEGIN
    UPDATE Becas SET Cuantia_Variable = v_cuantia_variable WHERE Codigo_Beca = v_codigo_beca;
    COMMIT;
END;
/
 
--RF-013
CREATE OR REPLACE PROCEDURE PR_Becas_Alumno (v_DNI IN Becarios.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Codigo_Beca, Cuantia_Fija, Cuantia_Variable, Tipo, Fecha_Comienzo, Fecha_Fin FROM Becas NATURAL JOIN BECARIOS WHERE DNI = v_DNI;
    v_Becas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Becas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Código de la beca:', 25) || RPAD('Cuantía fija:', 25) || RPAD('Cuantía variable:', 25) || RPAD('Tipo:', 25) || RPAD('Fecha de comienzo:', 25) || RPAD('Fecha de fin:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Becas.Codigo_Beca, 25) || RPAD(v_Becas.Cuantia_Fija, 25) || RPAD(v_Becas.Cuantia_Variable, 25) || RPAD(v_Becas.Tipo, 25) || RPAD(v_Becas.Fecha_Comienzo, 25) || RPAD(v_Becas.Fecha_Fin, 25));
    FETCH C INTO v_Becas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-014
CREATE OR REPLACE PROCEDURE PR_Alumnos_Matriculados
IS
    CURSOR C IS
        SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email FROM Alumnos;
    v_Alumnos C%ROWTYPE;
    v_TotalAlumnos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_TotalAlumnos FROM Alumnos;
    DBMS_OUTPUT.PUT_LINE(v_TotalAlumnos || ' alumnos matriculados en la universidad.' || CHR(13) || CHR(13));
    OPEN C;
    FETCH C INTO v_Alumnos;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI, 25) || RPAD(v_Alumnos.Nombre, 25) || RPAD(v_Alumnos.Apellidos, 25) || RPAD(v_Alumnos.Fecha_Nacimiento, 25) || RPAD(v_Alumnos.Email, 25));
    FETCH C INTO v_Alumnos;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-015
CREATE OR REPLACE PROCEDURE PR_Profesores_Impartiendo
IS
    CURSOR C IS
        SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores;
    v_Profesores C%ROWTYPE;
    v_TotalProfesores NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_TotalProfesores FROM Profesores;
    DBMS_OUTPUT.PUT_LINE(v_TotalProfesores || ' profesores impartiendo en la universidad.' || CHR(13) || CHR(13));
    OPEN C;
    FETCH C INTO v_Profesores;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
    FETCH C INTO v_Profesores;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-016
CREATE OR REPLACE PROCEDURE PR_Espacios_AgrupPor_Tipo
IS
    CURSOR C1 IS
        SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Teoría';
    CURSOR C2 IS
        SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Laboratorio';
    CURSOR C3 IS
        SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Examen';
    CURSOR C4 IS
        SELECT Nombre, Capacidad FROM Despachos;
    v_EspaciosT C1%ROWTYPE;
    v_EspaciosL C2%ROWTYPE;
    v_EspaciosE C3%ROWTYPE;
    v_EspaciosD C4%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-'));
    DBMS_OUTPUT.PUT_LINE('|Aulas de teoría|');
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-') || CHR(13) || CHR(13));
    OPEN C1;
    FETCH C1 INTO v_EspaciosT;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
    WHILE C1%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosT.Nombre, 25) || RPAD(v_EspaciosT.Capacidad, 25));
    FETCH C1 INTO v_EspaciosT;
    END LOOP;
    CLOSE C1;
    DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 22, '-'));
    DBMS_OUTPUT.PUT_LINE('|Aulas de laboratorio|');
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 22, '-') || CHR(13) || CHR(13));
    OPEN C2;
    FETCH C2 INTO v_EspaciosL;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
    WHILE C2%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosL.Nombre, 25) || RPAD(v_EspaciosL.Capacidad, 25));
    FETCH C2 INTO v_EspaciosL;
    END LOOP;
    CLOSE C2;
    DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-'));
    DBMS_OUTPUT.PUT_LINE('|Aulas de examen|');
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-') || CHR(13) || CHR(13));
    OPEN C3;
    FETCH C3 INTO v_EspaciosE;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
    WHILE C3%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosE.Nombre, 25) || RPAD(v_EspaciosE.Capacidad, 25));
    FETCH C3 INTO v_EspaciosE;
    END LOOP;
    CLOSE C3;
    DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 11, '-'));
    DBMS_OUTPUT.PUT_LINE('|Despachos|');
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 11, '-') || CHR(13) || CHR(13));
    OPEN C4;
    FETCH C4 INTO v_EspaciosD;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
    WHILE C4%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosD.Nombre, 25) || RPAD(v_EspaciosD.Capacidad, 25));
    FETCH C4 INTO v_EspaciosD;
    END LOOP;
    CLOSE C4;
END;
/
 
--RF-017
CREATE OR REPLACE PROCEDURE PR_Profesores_Departamento (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores WHERE OID_Dep IN (SELECT OID_DEP FROM Departamentos WHERE Nombre = v_NombreDepartamento);
    v_Profesores C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Profesores;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
    FETCH C INTO v_Profesores;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-018
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Departamento (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Codigo_Asig, Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE OID_Dep IN (SELECT OID_DEP FROM Departamentos WHERE Nombre = v_NombreDepartamento);
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Código:', 25) || RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 240, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Codigo_Asig, 25) || RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-019
CREATE OR REPLACE FUNCTION FN_Grupo_Mas_Alumnos
RETURN VARCHAR2
IS
    v_nombreGrupo Grupos.Nombre%TYPE;
BEGIN
    SELECT Nombre INTO v_nombreGrupo FROM Grupos WHERE OID_Grup IN (SELECT OID_Grup FROM AlumnosPertenecenAGrupos GROUP BY OID_Grup HAVING COUNT(DNI) = (SELECT MAX(COUNT(DNI)) FROM AlumnosPertenecenAGrupos GROUP BY OID_Grup));
    RETURN (v_nombreGrupo);
END;
/
 
--RF-020
CREATE OR REPLACE PROCEDURE PR_Eliminar_Asignatura_Dep (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
BEGIN
    UPDATE Asignaturas SET OID_Dep = NULL WHERE Codigo_Asig = v_codigo_asig;
    COMMIT;
END;
/
 
--RF-021
CREATE OR REPLACE PROCEDURE PR_Asociar_Profesor_Dep (v_DNI IN Profesores.DNI%TYPE, v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
    v_OID_Dep Profesores.OID_Dep%TYPE;
BEGIN
    SELECT OID_Dep INTO v_OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento;
    UPDATE Profesores SET OID_Dep = v_OID_Dep WHERE DNI = v_DNI;
    COMMIT;
END;
/
 
--RF-022
CREATE OR REPLACE PROCEDURE PR_Eliminar_Profesor_Dep (v_DNI IN Profesores.DNI%TYPE)
IS
BEGIN
    UPDATE Profesores SET OID_Dep = NULL WHERE DNI = v_DNI;
    COMMIT;
END;
/
 
--RF-023
CREATE OR REPLACE PROCEDURE PR_Prof_Imparte_Asig (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
    v_ImparteProfesor NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_ImparteProfesor FROM ProfesoresImpartenAsignaturas WHERE Codigo_Asig = v_codigo_asig;
    IF v_ImparteProfesor >= 1 THEN
        DBMS_OUTPUT.PUT_LINE('La asignatura es impartida al menos por un profesor.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La asignatura no es impartida por ningún profesor.');
    END IF;
END;    
/
 
--RF-024
CREATE OR REPLACE PROCEDURE PR_Prof_Imparte_Asigs_Dep (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Codigo_Asig FROM Asignaturas WHERE OID_Dep IN (SELECT OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento);
    v_Asignaturas C%ROWTYPE;
    v_ImparteProfesor NUMBER;
    v_TodasAsignadas BOOLEAN := TRUE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    WHILE C%FOUND LOOP 
        SELECT COUNT(*) INTO v_ImparteProfesor FROM ProfesoresImpartenAsignaturas WHERE Codigo_Asig = v_Asignaturas.Codigo_Asig;
        IF v_ImparteProfesor = 0 THEN
            v_TodasAsignadas := FALSE;
        END IF;
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
    IF v_TodasAsignadas = TRUE THEN
        DBMS_OUTPUT.PUT_LINE('Todas las asignaturas del departamento tienen al menos un profesor asignado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No todas las asignaturas del departamento tienen al menos un profesor asignado.');
    END IF;
END;    
/
 
--RF-025
CREATE OR REPLACE PROCEDURE PR_NumProf_AgrupadosPor_Asig
IS
    CURSOR C IS
        SELECT Nombre, COUNT(DNI) AS NumProfesores FROM ProfesoresImpartenAsignaturas NATURAL JOIN Asignaturas GROUP BY Nombre;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Asignatura:', 100) || RPAD('Número de profesores:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.NumProfesores, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;    
/
 
--RF-026
CREATE OR REPLACE PROCEDURE PR_NumTut_AgrupadosPor_Prof
IS
    CURSOR C IS
        SELECT DNI_Prof, COUNT(OID_T) AS NumTutorias FROM Tutorias GROUP BY DNI_Prof;
    v_Profesores C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Profesores;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI del profesor:', 25) || RPAD('Número de tutorias:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 47, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI_Prof, 25) || RPAD(v_Profesores.NumTutorias, 25));
    FETCH C INTO v_Profesores;
    END LOOP;
    CLOSE C;
END;    
/
 
--RF-027
CREATE OR REPLACE PROCEDURE PR_Profesores_Despacho (v_NombreDespacho IN Despachos.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores WHERE OID_D IN (SELECT OID_D FROM Despachos WHERE Nombre = v_NombreDespacho);
    v_Profesores C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Profesores;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
    FETCH C INTO v_Profesores;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-028
CREATE OR REPLACE PROCEDURE PR_Notas_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
IS
    CURSOR C IS
        SELECT Valor, Calificacion, Convocatoria, Curso, Fecha FROM Notas WHERE Codigo_exp = v_codigo_exp;
    v_Notas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Notas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Valor:', 25) || RPAD('Calificación:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25));
    FETCH C INTO v_Notas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-029
CREATE OR REPLACE FUNCTION FN_NotaMedia_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
RETURN NUMBER
IS
    v_notaMedia Notas.Valor%TYPE;
BEGIN
    SELECT AVG(Valor) INTO v_notaMedia FROM Notas WHERE Codigo_exp = v_codigo_exp;
    RETURN (v_notaMedia);
END;
/
 
--RF-030
CREATE OR REPLACE PROCEDURE PR_Evaluar_Examen (v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_codigo_exp IN Notas.Codigo_exp%TYPE)
IS
BEGIN
    INSERT INTO Notas (Valor, Calificacion, Convocatoria, Curso, Fecha, Codigo_Exp) VALUES (v_Valor, v_Calificacion, v_Convocatoria, v_Curso, v_Fecha, v_codigo_exp);
    COMMIT;
END;
/
 
--RF-031
CREATE OR REPLACE FUNCTION FN_MejorNota_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
RETURN NUMBER
IS
    v_mejorNota Notas.Valor%TYPE;
BEGIN
    SELECT MAX(Valor) INTO v_mejorNota FROM Notas WHERE Codigo_exp = v_codigo_exp;
    RETURN (v_mejorNota);
END;
/
 
--RF-032
CREATE OR REPLACE PROCEDURE PR_AsignaturasOblig_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Obligatorio' OR Tipo = 'Troncal';
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 215, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-033
CREATE OR REPLACE PROCEDURE PR_AsignaturasOpt_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Optativo';
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 215, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-034
CREATE OR REPLACE FUNCTION FN_CreditosOptativos_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
    v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
    SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Optativo';
    RETURN (v_numCreditos);
END;
/
 
--RF-035
CREATE OR REPLACE FUNCTION FN_CreditosObligatorios_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
    v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
    SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Obligatorio';
    RETURN (v_numCreditos);
END;
/
 
--RF-036
CREATE OR REPLACE FUNCTION FN_CreditosTroncales_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
    v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
    SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Troncal';
    RETURN (v_numCreditos);
END;
/
 
--RF-037
CREATE OR REPLACE FUNCTION FN_CreditosTotales_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
    v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
    SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
    RETURN (v_numCreditos);
END;
/
 
--RF-038
CREATE OR REPLACE PROCEDURE PR_Departamentos_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Nombre FROM Departamentos WHERE OID_Dep IN (SELECT OID_Dep FROM Asignaturas NATURAL JOIN AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
    v_Departamentos C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Departamentos;
    DBMS_OUTPUT.PUT_LINE(RPAD('Departamento:', 75));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Departamentos.Nombre, 75));
    FETCH C INTO v_Departamentos;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-039
CREATE OR REPLACE PROCEDURE PR_Profesores_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT DISTINCT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores NATURAL JOIN ProfesoresImpartenAsignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM Asignaturas NATURAL JOIN AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
    v_Profesores C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Profesores;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
    FETCH C INTO v_Profesores;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-040
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Grado_Curso (v_Grado IN Grados.Nombre%TYPE, v_Curso IN Asignaturas.Curso%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Curso = v_Curso;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-041
CREATE OR REPLACE PROCEDURE PR_AsignaturasAnuales_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Periodo = 'Anual';
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-042
CREATE OR REPLACE PROCEDURE PR_Tutorias_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Fecha, Hora_comienzo, Duracion, DNI_Alum FROM Tutorias WHERE DNI_Prof = v_DNI;
    v_Tutorias C%ROWTYPE;
     
BEGIN
    OPEN C;
    FETCH C INTO v_Tutorias;
    DBMS_OUTPUT.PUT_LINE(RPAD('Fecha', 25) || RPAD('Hora de comienzo', 25) || RPAD('Duración', 25) || RPAD('DNI del Alumno que atiende', 27));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 105, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Tutorias.Fecha, 25) || RPAD(v_Tutorias.Hora_comienzo, 25) || RPAD(v_Tutorias.Duracion, 25) || RPAD(v_Tutorias.Dni_Alum, 27));
    FETCH C INTO v_Tutorias;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-043
CREATE OR REPLACE FUNCTION FN_Departamento_Profesor (v_DNI IN Profesores.DNI%TYPE)
RETURN VARCHAR2
IS
    v_Departamento Departamentos.Nombre%TYPE;
BEGIN
    SELECT Nombre INTO v_Departamento FROM Departamentos WHERE OID_DEP IN (SELECT OID_DEP FROM Profesores WHERE DNI = v_DNI);
    RETURN (v_Departamento);
END;
/
 
--RF-044
CREATE OR REPLACE FUNCTION FN_DedicacionTotal_Profesor (v_DNI IN Profesores.DNI%TYPE)
RETURN NUMBER
IS
    v_DedicacionTotal ProfesoresImpartenAsignaturas.Dedicacion%TYPE;
BEGIN
    SELECT SUM(Dedicacion) INTO v_DedicacionTotal FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI;
    RETURN (v_DedicacionTotal);
END;
/
 
--RF-045
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas NATURAL JOIN ProfesoresImpartenAsignaturas WHERE DNI = v_DNI;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-046
CREATE OR REPLACE PROCEDURE PR_Dedicacion_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Dedicacion FROM ProfesoresImpartenAsignaturas NATURAL JOIN Asignaturas WHERE DNI = v_DNI;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Dedicación:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 110, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Dedicacion, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/
 
--RF-047
CREATE OR REPLACE PROCEDURE PR_Categoria_Profesor (v_DNI IN Profesores.DNI%TYPE, v_Categoria IN Profesores.Categoria%TYPE)
IS
BEGIN
    UPDATE Profesores SET Categoria = v_Categoria WHERE DNI = v_DNI;
    COMMIT;
END;
/
 
--RF-048
CREATE OR REPLACE PROCEDURE PR_Adicion_Tutoria (v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_Estado IN Tutorias.Estado%TYPE, v_DNI_Prof IN Profesores.DNI%TYPE, v_DNI_Alum IN Alumnos.DNI%TYPE)
IS
BEGIN
    INSERT INTO Tutorias (Fecha, Hora_Comienzo, Duracion, Estado, DNI_Alum, DNI_Prof) VALUES (v_Fecha, v_Hora_Comienzo, v_Duracion, v_Estado, v_DNI_Prof, v_DNI_Alum);
    COMMIT;
END;
/
 
--RF-049
CREATE OR REPLACE PROCEDURE PR_Eliminar_Tutoria (v_OID_T IN Tutorias.OID_T%TYPE)
IS
BEGIN
    DELETE FROM Tutorias WHERE OID_T = v_OID_T;
    COMMIT;
END;
/
 
--RF-050
CREATE OR REPLACE PROCEDURE PR_Asignar_Profesor_Asignatura (v_DNI IN Profesores.DNI%TYPE, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE)
IS
BEGIN
    INSERT INTO ProfesoresImpartenAsignaturas (DNI, Codigo_Asig, Dedicacion) VALUES (v_DNI, v_Codigo_Asig, v_Dedicacion);
    COMMIT;
END;
/
 
--RF-051
CREATE OR REPLACE PROCEDURE PR_Eliminar_Profesor_Asig (v_DNI IN Profesores.DNI%TYPE, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE)
IS
BEGIN
    DELETE FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
    COMMIT;
END;
/
 
--RF-052
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Aula (v_Aula IN Aulas.Nombre%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE)
IS
    CURSOR C IS
        SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas NATURAL JOIN AsignaturasImpartidasEnAulas WHERE OID_A IN (SELECT OID_A FROM Aulas WHERE Nombre = v_Aula) AND TRUNC(Fecha) = v_Fecha;
    v_Asignaturas C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO v_Asignaturas;
    DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 195, '-'));
    WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
    FETCH C INTO v_Asignaturas;
    END LOOP;
    CLOSE C;
END;
/


--Función auxiliar
CREATE OR REPLACE FUNCTION ASSERT_EQUALS (v_Salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2
IS
BEGIN
    IF v_Salida = salidaEsperada THEN
        RETURN 'ÉXITO';
    ELSE
        RETURN 'FALLO';
    END IF;
END;
/
 
--Cabeceras de paquetes
--Tabla Alumnos
CREATE OR REPLACE PACKAGE PCK_Alumnos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Sexo IN Alumnos.Sexo%TYPE, v_Telefono IN Alumnos.Telefono%TYPE, v_Direccion IN Alumnos.Direccion%TYPE, v_Provincia IN Alumnos.Provincia%TYPE, v_Codigo_Postal IN Alumnos.Codigo_Postal%TYPE, v_Modalidad IN Alumnos.Modalidad%TYPE, v_Forma_Acceso IN Alumnos.Forma_Acceso%TYPE, v_Estado_Beca IN Alumnos.Estado_Beca%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Sexo IN Alumnos.Sexo%TYPE, v_Telefono IN Alumnos.Telefono%TYPE, v_Direccion IN Alumnos.Direccion%TYPE, v_Provincia IN Alumnos.Provincia%TYPE, v_Codigo_Postal IN Alumnos.Codigo_Postal%TYPE, v_Modalidad IN Alumnos.Modalidad%TYPE, v_Forma_Acceso IN Alumnos.Forma_Acceso%TYPE, v_Estado_Beca IN Alumnos.Estado_Beca%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla AlumnosPertenecenAGrupos
CREATE OR REPLACE PACKAGE PCK_AlumnosPertenecenAGrupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Asignaturas
CREATE OR REPLACE PACKAGE PCK_Asignaturas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla AsignaturasPuntuadasConNotas
CREATE OR REPLACE PACKAGE PCK_AsigPuntuadasConNotas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla AsignaturasImpartidasEnAulas
CREATE OR REPLACE PACKAGE PCK_AsigImpartidasEnAulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla AsignaturasPertenecenAGrados
CREATE OR REPLACE PACKAGE PCK_AsigPertenecenAGrados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Aulas
CREATE OR REPLACE PACKAGE PCK_Aulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Becarios
CREATE OR REPLACE PACKAGE PCK_Becarios
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Becas
CREATE OR REPLACE PACKAGE PCK_Becas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Departamentos
CREATE OR REPLACE PACKAGE PCK_Departamentos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Despachos
CREATE OR REPLACE PACKAGE PCK_Despachos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Eventos
CREATE OR REPLACE PACKAGE PCK_Eventos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Eventos.DNI%TYPE, v_FECHA IN Eventos.FECHA%TYPE, v_NOMBRE IN Eventos.NOMBRE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_E IN Eventos.OID_E%TYPE, v_DNI IN Eventos.DNI%TYPE, v_FECHA IN Eventos.FECHA%TYPE, v_NOMBRE IN Eventos.NOMBRE%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_E IN Eventos.OID_E%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Expedientes
CREATE OR REPLACE PACKAGE PCK_Expedientes
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Grados
CREATE OR REPLACE PACKAGE PCK_Grados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Grupos
CREATE OR REPLACE PACKAGE PCK_Grupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla GruposAsistenAClaseEnAulas
CREATE OR REPLACE PACKAGE PCK_GruposAsistenAClaseEnAulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla HorarioProfesores
CREATE OR REPLACE PACKAGE PCK_HorarioProfesores
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN HorarioProfesores.DNI%TYPE, v_Hora_Comienzo_Tutoria IN HorarioProfesores.Hora_Comienzo_Tutoria%TYPE, v_Hora_Fin_Tutoria IN HorarioProfesores.Hora_Fin_Tutoria%TYPE, v_Dia IN HorarioProfesores.Dia%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_H IN HorarioProfesores.OID_H%TYPE, v_DNI IN HorarioProfesores.DNI%TYPE, v_Hora_Comienzo_Tutoria IN HorarioProfesores.Hora_Comienzo_Tutoria%TYPE, v_Hora_Fin_Tutoria IN HorarioProfesores.Hora_Fin_Tutoria%TYPE, v_Dia IN HorarioProfesores.Dia%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_H IN HorarioProfesores.OID_H%TYPE, salidaEsperada BOOLEAN);
END;
/

 
--Tabla Matriculas
CREATE OR REPLACE PACKAGE PCK_Matriculas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla MatriculasContienenAsignaturas
CREATE OR REPLACE PACKAGE PCK_MatriculasContienenAsig
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla MatriculasPertenecenAGrados
CREATE OR REPLACE PACKAGE PCK_MatricPertenecenAGrados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Notas
CREATE OR REPLACE PACKAGE PCK_Notas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Profesores
CREATE OR REPLACE PACKAGE PCK_Profesores
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla ProfesoresImpartenAsignaturas
CREATE OR REPLACE PACKAGE PCK_ProfesoresImpartenAsig
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla ProfesoresImpartenEnGrupos
CREATE OR REPLACE PACKAGE PCK_ProfesoresImpartenEnGrupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/
 
--Tabla Tutorias
CREATE OR REPLACE PACKAGE PCK_Tutorias
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_Estado IN Tutorias.Estado%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_Estado IN Tutorias.Estado%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Usuarios
CREATE OR REPLACE PACKAGE PCK_Usuarios
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, v_Pass IN Usuarios.Pass%TYPE, v_TipoUsuario IN Usuarios.TipoUsuario%TYPE, v_EsAdministrador IN Usuarios.EsAdministrador%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, v_Pass IN Usuarios.Pass%TYPE, v_TipoUsuario IN Usuarios.TipoUsuario%TYPE, v_EsAdministrador IN Usuarios.EsAdministrador%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/
 
 
--Cuerpos de paquetes
--Tabla Alumnos
CREATE OR REPLACE PACKAGE BODY PCK_Alumnos
IS
    CURSOR C IS
        SELECT * FROM Alumnos;
    v_Salida BOOLEAN := TRUE;
    v_Alumnos Alumnos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Alumnos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Alumnos;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Sexo:', 25) || RPAD('Teléfono:', 25) || RPAD('Dirección:', 25) || RPAD('Provincia:', 25) || RPAD('Código postal:', 25) || RPAD('Modalidad:', 25) || RPAD('Forma de acceso:', 25) || RPAD('Estado de beca:', 25) || RPAD('Fecha_Nacimiento:', 25) || RPAD('Email:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 350, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI, 25) || RPAD(v_Alumnos.Nombre, 25) || RPAD(v_Alumnos.Apellidos, 25) || RPAD(v_Alumnos.Sexo, 25) || RPAD(v_Alumnos.Telefono, 25) || RPAD(v_Alumnos.Direccion, 25) || RPAD(v_Alumnos.Provincia, 25) || RPAD(v_Alumnos.Codigo_Postal, 25) || RPAD(v_Alumnos.Modalidad, 25) || RPAD(v_Alumnos.Estado_Beca, 25) || RPAD(v_Alumnos.Fecha_Nacimiento, 25) || RPAD(v_Alumnos.Email, 25));
        FETCH C INTO v_Alumnos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Sexo IN Alumnos.Sexo%TYPE, v_Telefono IN Alumnos.Telefono%TYPE, v_Direccion IN Alumnos.Direccion%TYPE, v_Provincia IN Alumnos.Provincia%TYPE, v_Codigo_Postal IN Alumnos.Codigo_Postal%TYPE, v_Modalidad IN Alumnos.Modalidad%TYPE, v_Forma_Acceso IN Alumnos.Forma_Acceso%TYPE, v_Estado_Beca IN Alumnos.Estado_Beca%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Alumnos (DNI, Nombre, Apellidos, Sexo, Telefono, Direccion, Provincia, Codigo_Postal, Modalidad, Forma_Acceso, Estado_Beca, Fecha_Nacimiento, Email) VALUES (v_DNI, v_Nombre, v_Apellidos, v_Sexo, v_Telefono, v_Direccion, v_Provincia, v_Codigo_Postal, v_Modalidad, v_Forma_Acceso, v_Estado_Beca, v_Fecha_Nacimiento, v_Email);
        SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI = v_DNI;
        IF v_Alumnos.Nombre != v_Nombre AND v_Alumnos.Apellidos != v_Apellidos AND v_Alumnos.Sexo != v_Sexo AND v_Alumnos.Telefono != v_Telefono AND v_Alumnos.Direccion != v_Direccion AND v_Alumnos.Provincia != v_Provincia AND v_Alumnos.Codigo_Postal != v_Codigo_Postal AND v_Alumnos.Modalidad != v_Modalidad AND v_Alumnos.Forma_Acceso != v_Forma_Acceso AND v_Alumnos.Estado_Beca != v_Estado_Beca AND v_Alumnos.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Alumnos.Email != v_Email THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Sexo IN Alumnos.Sexo%TYPE, v_Telefono IN Alumnos.Telefono%TYPE, v_Direccion IN Alumnos.Direccion%TYPE, v_Provincia IN Alumnos.Provincia%TYPE, v_Codigo_Postal IN Alumnos.Codigo_Postal%TYPE, v_Modalidad IN Alumnos.Modalidad%TYPE, v_Forma_Acceso IN Alumnos.Forma_Acceso%TYPE, v_Estado_Beca IN Alumnos.Estado_Beca%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Alumnos SET Nombre = v_Nombre, Apellidos = v_Apellidos, Sexo = v_Sexo, Telefono = v_Telefono, Direccion = v_Direccion, Provincia = v_Provincia, Codigo_Postal = v_Codigo_Postal, Modalidad = v_Modalidad, Forma_Acceso = v_Forma_Acceso, Estado_Beca = v_Estado_Beca, Fecha_Nacimiento = v_Fecha_Nacimiento, Email = v_Email WHERE DNI = v_DNI;
        SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI = v_DNI;
        IF v_Alumnos.Nombre != v_Nombre AND v_Alumnos.Apellidos != v_Apellidos AND v_Alumnos.Sexo != v_Sexo AND v_Alumnos.Telefono != v_Telefono AND v_Alumnos.Direccion != v_Direccion AND v_Alumnos.Provincia != v_Provincia AND v_Alumnos.Codigo_Postal != v_Codigo_Postal AND v_Alumnos.Modalidad != v_Modalidad AND v_Alumnos.Forma_Acceso != v_Forma_Acceso AND v_Alumnos.Estado_Beca != v_Estado_Beca AND v_Alumnos.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Alumnos.Email != v_Email THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAlumnos NUMBER := 0;
    BEGIN
        DELETE FROM Alumnos WHERE DNI = v_DNI;
        SELECT COUNT(*) INTO v_NumAlumnos FROM Alumnos WHERE DNI = v_DNI;
        IF v_NumAlumnos != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla AlumnosPertenecenAGrupos
CREATE OR REPLACE PACKAGE BODY PCK_AlumnosPertenecenAGrupos
IS
    CURSOR C IS
        SELECT * FROM AlumnosPertenecenAGrupos;
    v_Salida BOOLEAN := TRUE;
    v_AlumnosPertenecenAGrupos AlumnosPertenecenAGrupos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM AlumnosPertenecenAGrupos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_AlumnosPertenecenAGrupos;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('OID_Grup:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_AlumnosPertenecenAGrupos.DNI, 25) || RPAD(v_AlumnosPertenecenAGrupos.OID_Grup, 25));
        FETCH C INTO v_AlumnosPertenecenAGrupos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO AlumnosPertenecenAGrupos (DNI, OID_Grup) VALUES (v_DNI, v_OID_grup);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAlumnosPertenecenAGrupos NUMBER := 0;
    BEGIN
        DELETE FROM AlumnosPertenecenAGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        SELECT COUNT(*) INTO v_NumAlumnosPertenecenAGrupos FROM AlumnosPertenecenAGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        IF v_NumAlumnosPertenecenAGrupos != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Asignaturas
CREATE OR REPLACE PACKAGE BODY PCK_Asignaturas
IS
    CURSOR C IS
        SELECT * FROM Asignaturas;
    v_Salida BOOLEAN := TRUE;
    v_Asignaturas Asignaturas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Asignaturas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Asignaturas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('Nombre:', 75) || RPAD('Acronimo:', 25) || RPAD('Creditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25) || RPAD('OID_Dep:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 250, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Codigo_Asig, 25) || RPAD(v_Asignaturas.Nombre, 75) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25) || RPAD(v_Asignaturas.OID_Dep, 25));
        FETCH C INTO v_Asignaturas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Asignaturas (Codigo_Asig, Nombre, Acronimo, Creditos, Periodo, Curso, Tipo, OID_Dep) VALUES (v_Codigo_Asig, v_Nombre, v_Acronimo, v_Creditos, v_Periodo, v_Curso, v_Tipo, v_OID_Dep);
        SELECT * INTO v_Asignaturas FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        IF (v_Asignaturas.Nombre != v_Nombre AND v_Asignaturas.Acronimo != v_Acronimo AND v_Asignaturas.Creditos != v_Creditos AND v_Asignaturas.Periodo != v_Periodo AND v_Asignaturas.Curso != v_Curso AND v_Asignaturas.Tipo != v_Tipo AND v_Asignaturas.OID_Dep != v_OID_Dep) THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2,v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Asignaturas SET Nombre = v_Nombre, Acronimo = v_Acronimo, Creditos = v_Creditos, Periodo = v_Periodo, Curso = v_Curso, Tipo = v_Tipo, OID_Dep = v_OID_Dep WHERE Codigo_Asig = v_Codigo_asig;
        SELECT * INTO v_Asignaturas FROM Asignaturas WHERE  Codigo_Asig = v_Codigo_asig;
        IF v_Asignaturas.Nombre != v_Nombre AND v_Asignaturas.Acronimo != v_Acronimo AND v_Asignaturas.Creditos != v_Creditos AND v_Asignaturas.Periodo != v_Periodo AND v_Asignaturas.Curso = v_Curso AND v_Asignaturas.Tipo = v_Tipo AND v_Asignaturas.OID_Dep = v_OID_Dep  THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAsignaturas NUMBER := 0;
    BEGIN
        DELETE FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        SELECT COUNT(*) INTO v_NumAsignaturas FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        IF v_NumAsignaturas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla AsignaturasPuntuadasConNotas
CREATE OR REPLACE PACKAGE BODY PCK_AsigPuntuadasConNotas
IS
    CURSOR C IS
        SELECT * FROM AsignaturasPuntuadasConNotas;
    v_Salida BOOLEAN := TRUE;
    v_AsignaturasPuntuadasConNotas AsignaturasPuntuadasConNotas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM AsignaturasPuntuadasConNotas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_AsignaturasPuntuadasConNotas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_N:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_AsignaturasPuntuadasConNotas.Codigo_Asig, 25) || RPAD(v_AsignaturasPuntuadasConNotas.OID_N, 25) );
        FETCH C INTO v_AsignaturasPuntuadasConNotas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO AsignaturasPuntuadasConNotas (Codigo_Asig, OID_N) VALUES (v_Codigo_Asig, v_OID_N);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAsigPuntuadasConNotas NUMBER := 0;
    BEGIN
        DELETE FROM AsignaturasPuntuadasConNotas WHERE Codigo_Asig = v_Codigo_Asig AND OID_N = v_OID_N;
        SELECT COUNT(*) INTO v_NumAsigPuntuadasConNotas FROM AsignaturasPuntuadasConNotas WHERE Codigo_Asig = v_Codigo_Asig AND OID_N = v_OID_N;
        IF v_NumAsigPuntuadasConNotas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla AsignaturasImpartidasEnAulas
CREATE OR REPLACE PACKAGE BODY PCK_AsigImpartidasEnAulas
IS
    CURSOR C IS
        SELECT * FROM AsignaturasImpartidasEnAulas;
    v_Salida BOOLEAN := TRUE;
    v_AsignaturasImpartidasEnAulas AsignaturasImpartidasEnAulas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM AsignaturasImpartidasEnAulas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_AsignaturasImpartidasEnAulas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_A:', 25) || RPAD('Fecha:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_AsignaturasImpartidasEnAulas.Codigo_Asig, 25) || RPAD(v_AsignaturasImpartidasEnAulas.OID_A, 25) || RPAD(v_AsignaturasImpartidasEnAulas.Fecha, 25));
        FETCH C INTO v_AsignaturasImpartidasEnAulas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO AsignaturasImpartidasEnAulas (Codigo_Asig, OID_A, Fecha) VALUES (v_Codigo_Asig, v_OID_A, v_Fecha);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAsigImpartidasEnAulas NUMBER := 0;
    BEGIN
        DELETE FROM AsignaturasImpartidasEnAulas WHERE Codigo_Asig = v_Codigo_Asig AND OID_A = v_OID_A AND Fecha = v_Fecha;
        SELECT COUNT(*) INTO v_NumAsigImpartidasEnAulas FROM AsignaturasImpartidasEnAulas WHERE Codigo_Asig = v_Codigo_Asig AND OID_A = v_OID_A AND Fecha = v_Fecha;
        IF v_NumAsigImpartidasEnAulas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
        ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla AsignaturasPertenecenAGrados
CREATE OR REPLACE PACKAGE BODY PCK_AsigPertenecenAGrados
IS
    CURSOR C IS
        SELECT * FROM AsignaturasPertenecenAGrados;
    v_Salida BOOLEAN := TRUE;
    v_AsigPertenecenAGrados AsignaturasPertenecenAGrados%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM AsignaturasPertenecenAGrados;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_AsigPertenecenAGrados;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_G', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_AsigPertenecenAGrados.Codigo_Asig, 25) || RPAD(v_AsigPertenecenAGrados.OID_G, 25));
        FETCH C INTO v_AsigPertenecenAGrados;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO AsignaturasPertenecenAGrados (Codigo_Asig, OID_G) VALUES (v_Codigo_Asig, v_OID_G);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAsigPertenecenAGrados NUMBER := 0;
    BEGIN
        DELETE FROM AsignaturasPertenecenAGrados WHERE Codigo_Asig = v_Codigo_Asig AND OID_G = v_OID_G;
        SELECT COUNT(*) INTO v_NumAsigPertenecenAGrados FROM AsignaturasPertenecenAGrados WHERE Codigo_Asig = v_Codigo_Asig AND OID_G = v_OID_G;
        IF v_NumAsigPertenecenAGrados != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
        ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Aulas
CREATE OR REPLACE PACKAGE BODY PCK_Aulas
IS
    CURSOR C IS
        SELECT * FROM Aulas;
    v_Salida BOOLEAN := TRUE;
    v_Aulas Aulas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Aulas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Aulas;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_A:', 25) ||RPAD('Nombre:', 25) || RPAD('Capacidad:', 25) || RPAD('Tipo:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Aulas.OID_A, 25) || RPAD(v_Aulas.Nombre, 25) || RPAD(v_Aulas.Capacidad, 25) || RPAD(v_Aulas.Tipo, 25) );
        FETCH C INTO v_Aulas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_A Aulas.OID_A%TYPE;
    BEGIN
        INSERT INTO Aulas (Nombre, Capacidad, Tipo) VALUES (v_Nombre, v_Capacidad, v_Tipo);
        v_OID_A := SEC_Aulas.CURRVAL;
        SELECT * INTO v_Aulas FROM Aulas WHERE OID_A = v_OID_A;
        IF v_Aulas.Nombre != v_Nombre AND v_Aulas.Capacidad != v_Capacidad AND v_Aulas.Tipo != v_Tipo THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Aulas SET Nombre = v_Nombre, Capacidad = v_Capacidad, Tipo = v_Tipo WHERE OID_A = v_OID_A;
        SELECT * INTO v_Aulas FROM Aulas WHERE OID_A = v_OID_A;
        IF v_Aulas.Nombre != v_Nombre AND v_Aulas.Capacidad != v_Capacidad AND v_Aulas.Tipo != v_Tipo THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAulas NUMBER := 0;
    BEGIN
        DELETE FROM AULAS WHERE OID_A = v_OID_A;
        SELECT COUNT(*) INTO v_NumAulas FROM Aulas WHERE OID_A = v_OID_A;
        IF v_NumAulas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Becarios
CREATE OR REPLACE PACKAGE BODY PCK_Becarios
IS
    CURSOR C IS
        SELECT * FROM Becarios;
    v_Salida BOOLEAN := TRUE;
    v_Becarios Becarios%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Becarios;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Becarios;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Codigo_Beca:', 25) || RPAD('Fecha_Comienzo:', 25) || RPAD('Fecha_Fin:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Becarios.DNI, 25) || RPAD(v_Becarios.Codigo_Beca, 25) || RPAD(v_Becarios.Fecha_Comienzo, 25) || RPAD(v_Becarios.Fecha_Fin, 25));
        FETCH C INTO v_Becarios;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_Fecha_Comienzo, v_Fecha_Fin);
        SELECT * INTO v_Becarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
        IF v_Becarios.Fecha_Comienzo != v_Fecha_Comienzo AND v_Becarios.Fecha_Fin != v_Fecha_Fin THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Becarios SET Fecha_Comienzo=v_Fecha_Comienzo, Fecha_Fin=v_Fecha_Fin WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
        SELECT * INTO v_Becarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
        IF v_Becarios.Fecha_Comienzo != v_Fecha_Comienzo AND v_Becarios.Fecha_Fin != v_Fecha_Fin THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumBecarios NUMBER := 0;
    BEGIN
        DELETE FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
        SELECT COUNT(*) INTO v_NumBecarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
        IF v_NumBecarios != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Becas
CREATE OR REPLACE PACKAGE BODY PCK_Becas
IS
    CURSOR C IS
        SELECT * FROM Becas;
    v_Salida BOOLEAN := TRUE;
    v_Becas Becas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Becas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Becas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Beca:', 25) || RPAD('Cuantia_Fija:', 25) || RPAD('Cuantia_Variable:', 25) || RPAD('Tipo:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
        WHILE C%FOUND LOOP 
        DBMS_OUTPUT.PUT_LINE(RPAD(v_Becas.Codigo_Beca, 25) || RPAD(v_Becas.Cuantia_Fija, 25) || RPAD(v_Becas.Cuantia_Variable, 25) || RPAD(v_Becas.Tipo, 25));
        FETCH C INTO v_Becas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Becas (Codigo_Beca, Cuantia_Fija, Cuantia_Variable, Tipo) VALUES (v_Codigo_Beca, v_Cuantia_Fija, v_Cuantia_Variable, v_Tipo);
        SELECT * INTO v_Becas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
        IF v_Becas.Cuantia_Fija != v_Cuantia_Fija AND v_Becas.Cuantia_Variable = v_Cuantia_Variable AND v_Becas.Tipo = v_Tipo THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Becas SET Cuantia_Fija = v_Cuantia_Fija, Cuantia_Variable = v_Cuantia_Variable, Tipo = v_Tipo WHERE Codigo_Beca = v_Codigo_Beca;
        SELECT * INTO v_Becas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
        IF v_Becas.Cuantia_Fija != v_Cuantia_Fija AND v_Becas.Cuantia_Variable = v_Cuantia_Variable AND v_Becas.Tipo = v_Tipo THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumBecas NUMBER := 0;
    BEGIN
        DELETE FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
        SELECT COUNT(*) INTO v_NumBecas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
        IF v_NumBecas  != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Departamentos
CREATE OR REPLACE PACKAGE BODY PCK_Departamentos
IS
    CURSOR C IS
        SELECT * FROM Departamentos;
    v_Salida BOOLEAN := TRUE;
    v_Departamentos Departamentos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Departamentos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Departamentos;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_Dep:', 25) || RPAD('Nombre:', 50));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Departamentos.OID_Dep, 25) || RPAD(v_Departamentos.Nombre, 50));
        FETCH C INTO v_Departamentos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_Dep Departamentos.OID_Dep%TYPE;
    BEGIN
        INSERT INTO Departamentos (Nombre) VALUES (v_Nombre);
        v_OID_Dep := SEC_Departamentos.CURRVAL;
        SELECT * INTO v_Departamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
        IF v_Departamentos.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Departamentos SET Nombre = v_Nombre WHERE OID_Dep = v_OID_Dep;
        SELECT * INTO v_Departamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
        IF v_Departamentos.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumDepartamentos NUMBER := 0;
    BEGIN
        DELETE FROM Departamentos WHERE OID_Dep = v_OID_Dep;
        SELECT COUNT(*) INTO v_NumDepartamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
        IF v_NumDepartamentos  != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Despachos
CREATE OR REPLACE PACKAGE BODY PCK_Despachos
IS
    CURSOR C IS
        SELECT * FROM Despachos;
    v_Salida BOOLEAN := TRUE;
    v_Despachos Despachos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Despachos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Despachos;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_D:', 25) || RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Despachos.OID_D, 25) || RPAD(v_Despachos.Nombre, 25) || RPAD(v_Despachos.Capacidad, 25));
        FETCH C INTO v_Despachos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_D Despachos.OID_D%TYPE;
    BEGIN
        INSERT INTO Despachos (Nombre, Capacidad) VALUES (v_Nombre, v_Capacidad);
        v_OID_D := SEC_Despachos.CURRVAL;
        SELECT * INTO v_Despachos FROM Despachos WHERE OID_D = v_OID_D;
        IF v_Despachos.Nombre != v_Nombre AND v_Despachos.Capacidad != v_Capacidad THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Despachos SET Nombre = v_Nombre, Capacidad = v_Capacidad WHERE OID_D = v_OID_D;
        SELECT * INTO v_Despachos FROM Despachos WHERE OID_D = v_OID_D;
        IF v_Despachos.Nombre != v_Nombre AND v_Despachos.Capacidad != v_Capacidad THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumDespachos NUMBER := 0;
    BEGIN
        DELETE FROM Despachos WHERE OID_D = v_OID_D;
        SELECT COUNT(*) INTO v_NumDespachos FROM Despachos WHERE OID_D = v_OID_D;
        IF v_NumDespachos  != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla Eventos
CREATE OR REPLACE PACKAGE BODY PCK_Eventos
IS
	CURSOR C IS
		SELECT * FROM Eventos;
	v_Salida BOOLEAN := TRUE;
	v_Eventos Eventos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Eventos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Eventos;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_E:', 25) || RPAD('DNI:', 25) || RPAD('FECHA:', 25) || RPAD('NOMBRE:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Eventos.OID_E, 25) || RPAD(v_Eventos.DNI, 25) || RPAD(v_Eventos.FECHA, 25) || RPAD(v_Eventos.NOMBRE, 25));
		FETCH C INTO v_Eventos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Eventos.DNI%TYPE, v_FECHA IN Eventos.FECHA%TYPE, v_NOMBRE IN Eventos.NOMBRE%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_E Eventos.OID_E%TYPE;
	BEGIN
		INSERT INTO Eventos (DNI, FECHA, NOMBRE) VALUES (v_DNI, v_FECHA, v_NOMBRE);
		v_OID_E := SEC_Eventos.CURRVAL;
		SELECT * INTO v_Eventos FROM Eventos WHERE OID_E = v_OID_E;
		IF v_Eventos.DNI != v_DNI AND v_Eventos.FECHA != v_FECHA AND v_Eventos.NOMBRE != v_NOMBRE THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_E IN Eventos.OID_E%TYPE, v_DNI IN Eventos.DNI%TYPE, v_FECHA IN Eventos.FECHA%TYPE, v_NOMBRE IN Eventos.NOMBRE%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Eventos SET DNI = v_DNI, FECHA = v_FECHA, NOMBRE = v_NOMBRE WHERE OID_E = v_OID_E;
		SELECT * INTO v_Eventos FROM Eventos WHERE OID_E = v_OID_E;
		IF v_Eventos.DNI != v_DNI AND v_Eventos.FECHA != v_FECHA AND v_Eventos.NOMBRE != v_NOMBRE THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_E IN Eventos.OID_E%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumEventos NUMBER := 0;
	BEGIN
		DELETE FROM Eventos WHERE OID_E = v_OID_E;
		SELECT COUNT(*) INTO v_NumEventos FROM Eventos WHERE OID_E = v_OID_E;
		IF v_NumEventos != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/
 
--Tabla Expedientes
CREATE OR REPLACE PACKAGE BODY PCK_Expedientes
IS
    CURSOR C IS
        SELECT * FROM Expedientes;
    v_Salida BOOLEAN := TRUE;
    v_Expedientes Expedientes%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Expedientes;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Expedientes;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Exp:', 25) || RPAD('DNI:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Expedientes.Codigo_Exp, 25) || RPAD(v_Expedientes.DNI, 25));
        FETCH C INTO v_Expedientes;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Expedientes (Codigo_Exp, DNI) VALUES (v_Codigo_Exp, v_DNI);
        SELECT * INTO v_Expedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
        IF v_Expedientes.DNI != v_DNI THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Expedientes SET DNI = v_DNI WHERE Codigo_Exp = v_Codigo_Exp;
        SELECT * INTO v_Expedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
        IF v_Expedientes.DNI != v_DNI THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumExpedientes NUMBER := 0;
    BEGIN
        DELETE FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
        SELECT COUNT(*) INTO v_NumExpedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
        IF v_NumExpedientes != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Grados
CREATE OR REPLACE PACKAGE BODY PCK_Grados
IS
    CURSOR C IS
        SELECT * FROM Grados;
    v_Salida BOOLEAN := TRUE;
    v_Grados Grados%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Grados;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Grados;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_G:', 25) || RPAD('Nombre:', 55));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 80, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Grados.OID_G, 25) || RPAD(v_Grados.Nombre, 55));
        FETCH C INTO v_Grados;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_G Grados.OID_G%TYPE;
    BEGIN
        INSERT INTO Grados (Nombre) VALUES (v_Nombre);
        v_OID_G := SEC_Grados.CURRVAL;
        SELECT * INTO v_Grados FROM Grados WHERE OID_G = v_OID_G;
        IF v_Grados.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Grados SET Nombre = v_Nombre WHERE OID_G = v_OID_G;
        SELECT * INTO v_Grados FROM Grados WHERE OID_G = v_OID_G;
        IF v_Grados.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumGrados NUMBER := 0;
    BEGIN
        DELETE FROM Grados WHERE OID_G = v_OID_G;
        SELECT COUNT(*) INTO v_NumGrados FROM Grados WHERE OID_G = v_OID_G;
        IF v_NumGrados != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Grupos
CREATE OR REPLACE PACKAGE BODY PCK_Grupos
IS
    CURSOR C IS
        SELECT * FROM Grupos;
    v_Salida BOOLEAN := TRUE;
    v_Grupos Grupos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Grupos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Grupos;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_Grup:', 25) || RPAD('Nombre:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Grupos.OID_Grup, 25) || RPAD(v_Grupos.Nombre, 25));
        FETCH C INTO v_Grupos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_Grup NUMBER;
    BEGIN
        INSERT INTO Grupos (Nombre) VALUES (v_Nombre);
        v_OID_Grup := SEC_Grupos.CURRVAL;
        SELECT * INTO v_Grupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
        IF v_Grupos.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Grupos SET Nombre = v_Nombre WHERE OID_Grup = v_OID_Grup;
        SELECT * INTO v_Grupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
        IF v_Grupos.Nombre != v_Nombre THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumGrupos NUMBER := 0;
    BEGIN
        DELETE FROM Grupos WHERE OID_Grup = v_OID_Grup;
        SELECT COUNT(*) INTO v_NumGrupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
        IF v_NumGrupos != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla GruposAsistenAClaseEnAulas
CREATE OR REPLACE PACKAGE BODY PCK_GruposAsistenAClaseEnAulas
IS
    CURSOR C IS
        SELECT * FROM GruposAsistenAClaseEnAulas;
    v_Salida BOOLEAN := TRUE;
    v_GruposAsistenAClaseEnAulas GruposAsistenAClaseEnAulas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM GruposAsistenAClaseEnAulas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_GruposAsistenAClaseEnAulas;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_Grup:', 25) || RPAD('OID_A:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_GruposAsistenAClaseEnAulas.OID_Grup, 25) || RPAD(v_GruposAsistenAClaseEnAulas.OID_A, 25) );
        FETCH C INTO v_GruposAsistenAClaseEnAulas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO GruposAsistenAClaseEnAulas (OID_Grup, OID_A) VALUES (v_OID_Grup, v_OID_A);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumGrupAsistenAClaseEnAulas NUMBER := 0;
    BEGIN
        DELETE FROM GruposAsistenAClaseEnAulas WHERE OID_Grup = v_OID_Grup AND OID_A = v_OID_A;
        SELECT COUNT(*) INTO v_NumGrupAsistenAClaseEnAulas FROM GruposAsistenAClaseEnAulas WHERE OID_Grup = v_OID_Grup AND OID_A = v_OID_A;
        IF v_NumGrupAsistenAClaseEnAulas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla HorarioProfesores
CREATE OR REPLACE PACKAGE BODY PCK_HorarioProfesores
IS
	CURSOR C IS
		SELECT * FROM HorarioProfesores;
	v_Salida BOOLEAN := TRUE;
	v_HorarioProfesores HorarioProfesores%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM HorarioProfesores;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_HorarioProfesores;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_H:', 25) || RPAD('DNI:', 25) || RPAD('Hora de comienzo de la tutoría:', 25) || RPAD('Hora de fin de la tutoría:', 25) || RPAD('Día:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 150, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_HorarioProfesores.OID_H, 25) || RPAD(v_HorarioProfesores.DNI, 25) || RPAD(v_HorarioProfesores.Hora_Comienzo_Tutoria, 25) || RPAD(v_HorarioProfesores.Hora_Fin_Tutoria, 25) || RPAD(v_HorarioProfesores.Dia, 25));
		FETCH C INTO v_HorarioProfesores;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN HorarioProfesores.DNI%TYPE, v_Hora_Comienzo_Tutoria IN HorarioProfesores.Hora_Comienzo_Tutoria%TYPE, v_Hora_Fin_Tutoria IN HorarioProfesores.Hora_Fin_Tutoria%TYPE, v_Dia IN HorarioProfesores.Dia%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_H HorarioProfesores.OID_H%TYPE;
	BEGIN
		INSERT INTO HorarioProfesores (DNI, Hora_Comienzo_Tutoria, Hora_Fin_Tutoria, Dia) VALUES (v_DNI, v_Hora_Comienzo_Tutoria, v_Hora_Fin_Tutoria, v_Dia);
		v_OID_H := SEC_HorarioProfesores.CURRVAL;
		SELECT * INTO v_HorarioProfesores FROM HorarioProfesores WHERE OID_H = v_OID_H;
		IF v_HorarioProfesores.DNI != v_DNI AND v_HorarioProfesores.Hora_Comienzo_Tutoria != v_Hora_Comienzo_Tutoria AND v_HorarioProfesores.Hora_Fin_Tutoria != v_Hora_Fin_Tutoria AND v_HorarioProfesores.Dia != v_Dia THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_H IN HorarioProfesores.OID_H%TYPE, v_DNI IN HorarioProfesores.DNI%TYPE, v_Hora_Comienzo_Tutoria IN HorarioProfesores.Hora_Comienzo_Tutoria%TYPE, v_Hora_Fin_Tutoria IN HorarioProfesores.Hora_Fin_Tutoria%TYPE, v_Dia IN HorarioProfesores.Dia%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE HorarioProfesores SET DNI = v_DNI, Hora_Comienzo_Tutoria = v_Hora_Comienzo_Tutoria, Hora_Fin_Tutoria = v_Hora_Fin_Tutoria, Dia = v_Dia WHERE OID_H = v_OID_H;
		SELECT * INTO v_HorarioProfesores FROM HorarioProfesores WHERE OID_H = v_OID_H;
		IF v_HorarioProfesores.DNI != v_DNI AND v_HorarioProfesores.Hora_Comienzo_Tutoria != v_Hora_Comienzo_Tutoria AND v_HorarioProfesores.Hora_Fin_Tutoria != v_Hora_Fin_Tutoria AND v_HorarioProfesores.Dia != v_Dia THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_H IN HorarioProfesores.OID_H%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumHorarioProfesores NUMBER := 0;
	BEGIN
		DELETE FROM HorarioProfesores WHERE OID_H = v_OID_H;
		SELECT COUNT(*) INTO v_NumHorarioProfesores FROM HorarioProfesores WHERE OID_H = v_OID_H;
		IF v_NumHorarioProfesores != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/
 
--Tabla Matriculas
CREATE OR REPLACE PACKAGE BODY PCK_Matriculas
IS
    CURSOR C IS
        SELECT * FROM Matriculas;
    v_Salida BOOLEAN := TRUE;
    v_Matriculas Matriculas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Matriculas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Matriculas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('Fecha:', 25)||RPAD('Curso:', 25)||RPAD('DNI:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Matriculas.Codigo_Matric, 25) || RPAD(v_Matriculas.Fecha, 25)|| RPAD(v_Matriculas.Curso, 25)|| RPAD(v_Matriculas.DNI, 25));
        FETCH C INTO v_Matriculas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
		v_Codigo_Matric Matriculas.Codigo_Matric%TYPE;
    BEGIN
        INSERT INTO Matriculas (Fecha, Curso, DNI) VALUES (v_Fecha, v_Curso, v_DNI);
		v_Codigo_Matric := SEC_Matriculas.CURRVAL;
        SELECT * INTO v_Matriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
        IF v_Matriculas.Fecha != v_Fecha AND v_Matriculas.Curso != v_Curso AND v_Matriculas.DNI != v_DNI THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Matriculas SET Fecha = v_Fecha, Curso = v_Curso, DNI = v_DNI WHERE Codigo_Matric = v_Codigo_Matric;
        SELECT * INTO v_Matriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
        IF v_Matriculas.Fecha != v_Fecha AND v_Matriculas.Curso != v_Curso AND v_Matriculas.DNI != v_DNI THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumMatriculas NUMBER := 0;
    BEGIN
        DELETE FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
        SELECT COUNT(*) INTO v_NumMatriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
        IF v_NumMatriculas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla MatriculasContienenAsignaturas
CREATE OR REPLACE PACKAGE BODY PCK_MatriculasContienenAsig
IS
    CURSOR C IS
        SELECT * FROM MatriculasContienenAsignaturas;
    v_Salida BOOLEAN := TRUE;
    v_MatriculasContienenAsig MatriculasContienenAsignaturas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM MatriculasContienenAsignaturas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_MatriculasContienenAsig;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('Codigo_Asig:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_MatriculasContienenAsig.Codigo_Matric, 25) || RPAD(v_MatriculasContienenAsig.Codigo_Asig, 25) );
        FETCH C INTO v_MatriculasContienenAsig;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO MatriculasContienenAsignaturas (Codigo_Matric, Codigo_Asig) VALUES (v_Codigo_Matric, v_Codigo_Asig);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumMatriculasContienenAsig NUMBER := 0;
    BEGIN
        DELETE FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_Codigo_Matric AND Codigo_Asig = v_Codigo_Asig;
        SELECT COUNT(*) INTO v_NumMatriculasContienenAsig FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_Codigo_Matric AND Codigo_Asig = v_Codigo_Asig;
        IF v_NumMatriculasContienenAsig != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla MatriculasPertenecenAGrados
CREATE OR REPLACE PACKAGE BODY PCK_MatricPertenecenAGrados
IS
    CURSOR C IS
        SELECT * FROM MatriculasPertenecenAGrados;
    v_Salida BOOLEAN := TRUE;
    v_MatriculasContienenAsig MatriculasPertenecenAGrados%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM MatriculasPertenecenAGrados;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_MatriculasContienenAsig;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('OID_G:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_MatriculasContienenAsig.Codigo_Matric, 25) || RPAD(v_MatriculasContienenAsig.OID_G, 25) );
        FETCH C INTO v_MatriculasContienenAsig;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO MatriculasPertenecenAGrados (Codigo_Matric, OID_G) VALUES (v_Codigo_Matric, v_OID_G);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumMatricPertenecenAGrados NUMBER := 0;
    BEGIN
        DELETE FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = v_Codigo_Matric AND OID_G = v_OID_G;
        SELECT COUNT(*) INTO v_NumMatricPertenecenAGrados FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = v_Codigo_Matric AND OID_G = v_OID_G;
        IF v_NumMatricPertenecenAGrados != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Notas
CREATE OR REPLACE PACKAGE BODY PCK_Notas
IS
    CURSOR C IS
        SELECT * FROM Notas;
    v_Salida BOOLEAN := TRUE;
    v_Notas Notas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Notas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Notas;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_N:', 25) || RPAD('Valor:', 25) || RPAD('Calificacion:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25) || RPAD('Codigo_Exp:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.OID_N, 25) || RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25) || RPAD(v_Notas.Codigo_Exp, 25));
        FETCH C INTO v_Notas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_N Notas.OID_N%TYPE;
    BEGIN
        INSERT INTO Notas (Valor, Calificacion, Convocatoria, Curso, Fecha, Codigo_Exp) VALUES (v_Valor, v_Calificacion, v_Convocatoria, v_Curso, v_Fecha, v_Codigo_Exp);
        v_OID_N := SEC_Notas.CURRVAL;
        SELECT * INTO v_Notas FROM Notas WHERE OID_N = v_OID_N;
        IF v_Notas.Valor != v_Valor AND v_Notas.Calificacion != v_Calificacion AND v_Notas.Convocatoria != v_Convocatoria AND v_Curso != v_Curso AND v_Notas.Fecha != v_Fecha AND v_Notas.Codigo_Exp != v_Codigo_Exp THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Notas SET Valor = v_Valor, Calificacion = v_Calificacion, Convocatoria = v_Convocatoria, Curso = v_Curso, Fecha = v_Fecha, Codigo_Exp = v_Codigo_Exp WHERE OID_N = v_OID_N;
        SELECT * INTO v_Notas FROM Notas WHERE OID_N = v_OID_N;
        IF v_Notas.Valor != v_Valor AND v_Notas.Calificacion != v_Calificacion AND v_Notas.Convocatoria != v_Convocatoria AND v_Curso != v_Curso AND v_Notas.Fecha != v_Fecha AND v_Notas.Codigo_Exp != v_Codigo_Exp THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumNotas NUMBER := 0;
    BEGIN
        DELETE FROM Notas WHERE OID_N = v_OID_N;
        SELECT COUNT(*) INTO v_NumNotas FROM Notas WHERE OID_N = v_OID_N;
        IF v_NumNotas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Profesores
CREATE OR REPLACE PACKAGE BODY PCK_Profesores
IS
    CURSOR C IS
        SELECT * FROM Profesores;
    v_Salida BOOLEAN := TRUE;
    v_Profesores Profesores%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Profesores;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Profesores;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha_Nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25) || RPAD('OID_D:', 25) || RPAD('OID_Dep:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25) || RPAD(v_Profesores.OID_D, 25) || RPAD(v_Profesores.OID_Dep, 25));
        FETCH C INTO v_Profesores;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Profesores (DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria, OID_D, OID_Dep) VALUES (v_DNI, v_Nombre, v_Apellidos, v_Fecha_Nacimiento, v_Email, v_Categoria, v_OID_D, v_OID_Dep);
        SELECT * INTO v_Profesores FROM Profesores WHERE DNI = v_DNI;
        IF v_Profesores.Nombre != v_Nombre AND v_Profesores.Apellidos != v_Apellidos AND v_Profesores.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Profesores.Email != v_Email AND v_Profesores.Categoria != v_Categoria AND v_Profesores.OID_D != v_OID_D AND v_Profesores.OID_Dep != v_OID_Dep THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Profesores SET Nombre = v_Nombre, Apellidos = v_Apellidos, Fecha_Nacimiento = v_Fecha_Nacimiento, Email = v_Email, Categoria = v_Categoria, OID_D = v_OID_D, OID_Dep = v_OID_Dep WHERE DNI = v_DNI;
        SELECT * INTO v_Profesores FROM Profesores WHERE DNI = v_DNI;
        IF v_Profesores.Nombre != v_Nombre AND v_Profesores.Apellidos != v_Apellidos AND v_Profesores.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Profesores.Email != v_Email AND v_Profesores.Categoria != v_Categoria AND v_Profesores.OID_D != v_OID_D AND v_Profesores.OID_Dep != v_OID_Dep THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumProfesores NUMBER := 0;
    BEGIN
        DELETE FROM Profesores WHERE DNI = v_DNI;
        SELECT COUNT(*) INTO v_NumProfesores FROM Profesores WHERE DNI = v_DNI;
        IF v_NumProfesores != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla ProfesoresImpartenAsignaturas
CREATE OR REPLACE PACKAGE BODY PCK_ProfesoresImpartenAsig
IS
    CURSOR C IS
        SELECT * FROM ProfesoresImpartenAsignaturas;
    v_Salida BOOLEAN := TRUE;
    v_ProfesoresAsig ProfesoresImpartenAsignaturas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM ProfesoresImpartenAsignaturas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_ProfesoresAsig;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Codigo_Asig:', 25)|| RPAD('Dedicacion:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_ProfesoresAsig.DNI, 25) || RPAD(v_ProfesoresAsig.Codigo_Asig, 25)|| RPAD(v_ProfesoresAsig.Dedicacion, 25));
        FETCH C INTO v_ProfesoresAsig;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO ProfesoresImpartenAsignaturas (DNI, Codigo_Asig, Dedicacion) VALUES (v_DNI, v_Codigo_Asig, v_Dedicacion);
        SELECT * INTO v_ProfesoresAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        IF v_ProfesoresAsig.Dedicacion != v_Dedicacion THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE ProfesoresImpartenAsignaturas SET Dedicacion = v_Dedicacion WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        SELECT * INTO v_ProfesoresAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        IF v_ProfesoresAsig.Dedicacion != v_Dedicacion THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumProfesoresImpartenAsig NUMBER := 0;
    BEGIN
        DELETE FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        SELECT COUNT(*) INTO v_NumProfesoresImpartenAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        IF v_NumProfesoresImpartenAsig != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla ProfesoresImpartenEnGrupos
CREATE OR REPLACE PACKAGE BODY PCK_ProfesoresImpartenEnGrupos
IS
    CURSOR C IS
        SELECT * FROM ProfesoresImpartenEnGrupos;
    v_Salida BOOLEAN := TRUE;
    v_ProfesoresImpartenEnGrupos ProfesoresImpartenEnGrupos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM ProfesoresImpartenEnGrupos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_ProfesoresImpartenEnGrupos;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('OID_Grup:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_ProfesoresImpartenEnGrupos.DNI, 25) || RPAD(v_ProfesoresImpartenEnGrupos.OID_Grup, 25) );
        FETCH C INTO v_ProfesoresImpartenEnGrupos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO ProfesoresImpartenEnGrupos (DNI, OID_Grup) VALUES (v_DNI, v_OID_Grup);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumProfImpartenEnGrupos NUMBER := 0;
    BEGIN
        DELETE FROM ProfesoresImpartenEnGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        SELECT COUNT(*) INTO v_NumProfImpartenEnGrupos FROM ProfesoresImpartenEnGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        IF v_NumProfImpartenEnGrupos != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
 
--Tabla Tutorias
CREATE OR REPLACE PACKAGE BODY PCK_Tutorias
IS
    CURSOR C IS
        SELECT * FROM Tutorias;
    v_Salida BOOLEAN := TRUE;
    v_Tutorias Tutorias%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Tutorias;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Tutorias;
        DBMS_OUTPUT.PUT_LINE(RPAD('OID_T:', 25) || RPAD('Fecha:', 25) || RPAD('Hora_Comienzo:', 25) || RPAD('Duracion:', 25) || RPAD('Estado:', 25)  || RPAD('DNI_Alum:', 25) || RPAD('DNI_Prof:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Tutorias.OID_T, 25) || RPAD(v_Tutorias.Fecha, 25) || RPAD(v_Tutorias.Hora_Comienzo, 25) || RPAD(v_Tutorias.Duracion, 25 )|| RPAD(v_Tutorias.Estado, 25) || RPAD(v_Tutorias.DNI_Alum, 25) || RPAD(v_Tutorias.DNI_Prof, 25));
        FETCH C INTO v_Tutorias;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_Estado IN Tutorias.Estado%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN)
    IS
        v_OID_T Tutorias.OID_T%TYPE;
    BEGIN
        INSERT INTO Tutorias (Fecha, Hora_Comienzo, Duracion, Estado, DNI_Alum, DNI_Prof) VALUES (v_Fecha, v_Hora_Comienzo, v_Duracion, v_Estado, v_DNI_Alum, v_DNI_Prof);
        v_OID_T := SEC_Tutorias.CURRVAL;
        SELECT * INTO v_Tutorias FROM Tutorias WHERE OID_T = v_OID_T;
        IF v_Tutorias.Fecha != v_Fecha AND v_Tutorias.Hora_Comienzo != v_Hora_Comienzo AND v_Tutorias.Duracion != v_Duracion AND v_Tutorias.Estado != v_Estado AND v_Tutorias.DNI_Alum != v_DNI_Alum AND v_Tutorias.DNI_Prof != v_DNI_Prof THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_Estado IN Tutorias.Estado%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Tutorias SET Fecha = v_Fecha, Hora_Comienzo = v_Hora_Comienzo, Duracion = v_Duracion, Estado = v_Estado, DNI_Alum = v_DNI_Alum, DNI_Prof = v_DNI_Prof WHERE OID_T = v_OID_T;
        SELECT * INTO v_Tutorias FROM Tutorias WHERE OID_T = v_OID_T;
        IF v_Tutorias.Fecha != v_Fecha AND v_Tutorias.Hora_Comienzo != v_Hora_Comienzo AND v_Tutorias.Duracion != v_Duracion AND v_Tutorias.Estado != v_Estado AND v_Tutorias.DNI_Alum != v_DNI_Alum AND v_Tutorias.DNI_Prof != v_DNI_Prof THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumTutorias NUMBER := 0;
    BEGIN
        DELETE FROM Tutorias WHERE OID_T = v_OID_T;
        SELECT COUNT(*) INTO v_NumTutorias FROM Tutorias WHERE OID_T = v_OID_T;
        IF v_NumTutorias != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla Usuarios
CREATE OR REPLACE PACKAGE BODY PCK_Usuarios
IS
    CURSOR C IS
        SELECT * FROM Usuarios;
    v_Salida BOOLEAN := TRUE;
    v_Usuarios Usuarios%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Usuarios;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Usuarios;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Pass:', 25) || RPAD('Tipo Usuario:', 25) || RPAD('Es Administrador:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Usuarios.DNI, 25) || RPAD(v_Usuarios.Pass, 25) || RPAD(v_Usuarios.TipoUsuario, 25) || RPAD(v_Usuarios.EsAdministrador, 25) );
        FETCH C INTO v_Usuarios;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, v_Pass IN Usuarios.Pass%TYPE, v_TipoUsuario IN Usuarios.TipoUsuario%TYPE, v_EsAdministrador IN Usuarios.EsAdministrador%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Usuarios (DNI, Pass, TipoUsuario, EsAdministrador) VALUES (v_DNI, v_Pass, v_TipoUsuario, v_EsAdministrador);
        SELECT * INTO v_Usuarios FROM Usuarios WHERE DNI = v_DNI;
        IF v_Usuarios.Pass != v_Pass AND v_Usuarios.TipoUsuario != v_TipoUsuario AND v_Usuarios.EsAdministrador != v_EsAdministrador THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, v_Pass IN Usuarios.Pass%TYPE, v_TipoUsuario IN Usuarios.TipoUsuario%TYPE, v_EsAdministrador IN Usuarios.EsAdministrador%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Usuarios SET Pass = v_Pass, TipoUsuario = v_TipoUsuario, EsAdministrador = v_EsAdministrador WHERE DNI = v_DNI;
        SELECT * INTO v_Usuarios FROM Usuarios WHERE DNI = v_DNI;
        IF v_Usuarios.Pass != v_Pass AND v_Usuarios.TipoUsuario != v_TipoUsuario AND v_Usuarios.EsAdministrador != v_EsAdministrador THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Usuarios.DNI%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumUsuarios NUMBER := 0;
    BEGIN
        DELETE FROM Usuarios WHERE DNI = v_DNI;
        SELECT COUNT(*) INTO v_NumUsuarios FROM Usuarios WHERE DNI = v_DNI;
        IF v_NumUsuarios != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/
