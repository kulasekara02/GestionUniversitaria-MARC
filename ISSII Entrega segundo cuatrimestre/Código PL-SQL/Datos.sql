SET SERVEROUTPUT ON;

--Tabla Alumnos
BEGIN
PCK_Alumnos.Inicializar;
PCK_Alumnos.Insertar ('Insertar un alumno', '77843402V', 'Rubén', 'Bueno Menéndez', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '93839721C', 'Alfredo', 'Gomez Reyes', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('18/03/1988', 'DD/MM/YYYY'), 'alfredogr@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '07842998K', 'Álvaro', 'Alonso Agenjo', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('17/10/1987', 'DD/MM/YYYY'), 'alvaroaa@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '00548678J', 'Diego', 'Barbero Cano', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('02/11/1985', 'DD/MM/YYYY'), 'diegobc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '35849097D', 'Álvaro', 'Cano García', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('30/07/1995', 'DD/MM/YYYY'), 'alvarocg@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '98523686N', 'Natalia', 'Cereza Arias', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('17/06/1992', 'DD/MM/YYYY'), 'nataliaca@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '07804804F', 'Claudia', 'Frutos Vidal', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('13/03/1993', 'DD/MM/YYYY'), 'claudiafv@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '26810393Y', 'María', 'Sanchez Muñoz', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('10/02/1989', 'DD/MM/YYYY'), 'mariasm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '64427553E', 'Alicia', 'Heredia Gomez', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('15/10/1985', 'DD/MM/YYYY'), 'aliciahg@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '42312153L', 'Ainhoa', 'Santiago Cid', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('23/05/1990', 'DD/MM/YYYY'), 'anhoasc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '77008982Z', 'Naila', 'Muñez Ruiz', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('30/05/1992', 'DD/MM/YYYY'), 'nailamr@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '27576410P', 'Lucia', 'Perez Fuertes', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('01/11/1992', 'DD/MM/YYYY'), 'luciapf@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '70964804Y', 'Natalia', 'Ruiz Camarena', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('13/07/1993', 'DD/MM/YYYY'), 'nataliarc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '67202652X', 'Roberto', 'Bravo Ballesteros', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('23/03/1989', 'DD/MM/YYYY'), 'robertobb@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '63441519K', 'María', 'Reyes Méndez', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('25/09/1987', 'DD/MM/YYYY'), 'mariaym@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '62968537B', 'Iván', 'Agustín Navarro', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('05/02/1988', 'DD/MM/YYYY'), 'ivanan@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '23801240N', 'Paula', 'Baena Blázquez', 'Mujer', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('08/02/1985', 'DD/MM/YYYY'), 'paulabb@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '47966225R', 'Sergio', 'Caballero Cabeza', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('28/10/1991', 'DD/MM/YYYY'), 'sergiocc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '56336094D', 'Juan Antonio', 'Lago Medina', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('03/02/1989', 'DD/MM/YYYY'), 'juanantoniolm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '36081385C', 'Sebastián', 'Páez Vaquero', 'Hombre', '958396035', 'Calle falsa 123', 'Sevilla', '41089', 'Español', 'Estudios Postobligatorios', 'No soy becario', TO_DATE('22/01/1995', 'DD/MM/YYYY'), 'sebastianpv@alum.es', TRUE);
PCK_Alumnos.Consultar;
END;
/

--Tabla Aulas
BEGIN
PCK_Aulas.Inicializar;
PCK_Aulas.Insertar ('Insertar un aula', 'A0.01', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.02', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.03', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.04', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A1.01', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A1.02', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.01', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.02', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.03', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.04', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H1.01', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H1.02', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'F1.01', 30, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'F1.02', 30, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'G1.01', 10, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A3.01', 150, 'Examen', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A3.02', 150, 'Examen', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A4.01', 200, 'Examen', TRUE);
PCK_Aulas.Consultar;
END;
/

--Tabla Becas
BEGIN
PCK_Becas.Inicializar;
PCK_Becas.Insertar ('Insertar una beca', '61700LIW', 2000, 80, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '28194XAM', 1500, 810, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '18537TZN', 2400, 785, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '91440SRA', 1600, 630, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '84676UFX', 3680, 720, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '93073MJH', 2400, 380, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '13617EVK', 1500, 670, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '13617BAU', 6400, 890, 'Empresa', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '07284VPY', 2000, 670, 'Empresa', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '38720AJG', 2500, 540, 'Empresa', TRUE);
PCK_Becas.Consultar;
END;
/

--Tabla Departamentos
BEGIN
PCK_Departamentos.Inicializar;
PCK_Departamentos.Insertar ('Insertar un departamento', 'Administración Empresas y C.I.M. (Mark.)', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Anatomía y Embriología Humana', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Arquitectura y Tecnolog. de Computadores', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Biología Celular', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Bioquímica Médica y Biología Molecular', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Cirugía', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Electrónica y Electromagnetismo', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Estadística e Investigación Operativa', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Filosofía del Derecho', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Física Aplicada I', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Física de la Materia Condensada', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Fisiología Médica y Biofísica', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Genética', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ingeniería Aeroespacial y Mecánica de Fluidos', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ingeniería de Sistemas y Automática', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ingeniería y Ciencia de los Materiales y del Transporte', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Lenguajes y Sistemas Informáticos', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Matemática Aplicada I', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Mecánica de Medios Contínuos, Teoría de Estructuras', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Medicina Preventiva y Salud Pública', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Organización Industrial y Gestión Empr. I', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Organización Industrial y Gestión Empr. II', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Tecnología Electrónica', TRUE);
PCK_Departamentos.Consultar;
END;
/

--Tabla Despachos
BEGIN
PCK_Despachos.Inicializar;
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.20', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.21', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.22', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.23', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.20', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.21', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.22', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.23', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G0.20', 1, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G0.21', 1, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G1.20', 2, TRUE);
PCK_Despachos.Consultar;
END;
/

--Tabla Grados
BEGIN
PCK_Grados.Inicializar;
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Ingeniería de Computadores', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Ingeniería del Software', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Tecnologías Informáticas', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería de la Salud', TRUE);
PCK_Grados.Consultar;
END;
/

--Tabla Grupos
BEGIN
PCK_Grupos.Inicializar;
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 1', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 2', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 3', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 4', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 5', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 6', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 7', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 8', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 9', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 10', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 11', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 12', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 13', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 14', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 15', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 16', TRUE);
PCK_Grupos.Consultar;
END;
/

--Tabla AlumnosPertenecenAGrupos
BEGIN
PCK_AlumnosPertenecenAGrupos.Inicializar;
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 4, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '93839721C', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07842998K', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07842998K', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '00548678J', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '35849097D', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '98523686N', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '98523686N', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07804804F', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 3, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '64427553E', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '36081385C', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '56336094D', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '47966225R', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '23801240N', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '63441519K', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '67202652X', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '70964804Y', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '77008982Z', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '63441519K', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '93839721C', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '56336094D', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '64427553E', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '35849097D', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '77008982Z', 7, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 7, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '47966225R', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '36081385C', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '00548678J', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '77843402V', 3, TRUE);
PCK_AlumnosPertenecenAGrupos.Consultar;
END;
/

--Tabla Asignaturas
BEGIN
PCK_Asignaturas.Inicializar;
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050004, 'Fundamentos Físicos de la Informática', 'FFI', 6, 'Primer cuatrimestre', 1, 'Troncal', 1, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050040, 'Integración de Sistemas Físicos e Informáticos', 'ISFI', 6, 'Primer cuatrimestre', 4, 'Optativo', 1, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050029, 'Aplicaciones de Soft Computing', 'ASC', 6, 'Segundo cuatrimestre', 4, 'Optativo', 2, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050012, 'Lógica Informática', 'LI', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 3, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050024, 'Inteligencia Artificial', 'IA', 6, 'Primer cuatrimestre', 3, 'Obligatorio', 3, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050015, 'Arquitectura de Computadores', 'AC', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 4, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050001, 'Fundamentos de Programación', 'FP', 12, 'Anual', 1, 'Troncal', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050010, 'Análisis y Diseño de Datos y Algoritmos', 'ADDA', 12, 'Anual', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050011, 'Introducción a la Ingeniería del Software y los Sistemas de Información', 'IISSI', 12, 'Anual', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050014, 'Sistemas Operativos', 'SO', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050016, 'Arquitectura e Integración de Sistemas Software', 'AISS', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050018, 'Diseño y Pruebas', 'DP', 12, 'Anual', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050019, 'Proceso Software y Gestión', 'PSG', 12, 'Anual', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050020, 'Ingeniería de Requisitos', 'IR', 6, 'Primer cuatrimestre', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050026, 'Prácticas Externas', 'PE', 6, 'Segundo cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050027, 'Acceso Inteligente a la Información', 'AII', 6, 'Primer cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050032, 'Evolución y Gestión de la Configuración', 'EGC', 6, 'Primer cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050035, 'Planificación y Gestión de Proyectos Informáticos', 'PGPI', 6, 'Segundo cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050039, 'Ingeniería del Software y Práctica Profesional', 'ISPP', 6, 'Primer cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050043, 'Seguridad en Sistemas Informáticos y en Internet', 'SSII', 6, 'Segundo cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050007, 'Álgebra Lineal y Numérica', 'ALN', 6, 'Segundo cuatrimestre', 1, 'Troncal', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050017, 'Matemática Discreta', 'MD', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050002, 'Cálculo Infinitesimal y Numérico', 'CIN', 6, 'Primer cuatrimestre', 1, 'Troncal', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050003, 'Circuitos Electrónicos Digitales', 'CED', 6, 'Primer cuatrimestre', 1, 'Troncal', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050009, 'Estructura de Computadores', 'EDC', 6, 'Segundo cuatrimestre', 1, 'Troncal', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050013, 'Redes de Computadores', 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050041, 'Optimización de Sistemas', 'OS', 6, 'Primer cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Consultar;
END;
/

--Tabla Expedientes
BEGIN
PCK_Expedientes.Inicializar;
PCK_Expedientes.Insertar ('Insertar un expediente', 84656361, '93839721C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 94814291, '07842998K', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 72715608, '27576410P', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 24992812, '00548678J', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 66217035, '56336094D', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 67367181, '64427553E', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 42079230, '62968537B', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 30004413, '42312153L', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 85838415, '67202652X', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 19955161, '77008982Z', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 95326106, '00548678J', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 64586570, '70964804Y', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 44748275, '63441519K', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 67032771, '70964804Y', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 78208070, '23801240N', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 53909587, '23801240N', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 12226352, '56336094D', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 78002608, '27576410P', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 17361731, '36081385C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 61654321, '62968537B', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 83665705, '93839721C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 32407767, '36081385C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 42794228, '67202652X', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 56238959, '77843402V', TRUE);
PCK_Expedientes.Consultar;
END;
/

--Tabla Notas
BEGIN
PCK_Notas.Inicializar;
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,4'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,5'), 'Aprobado', 'Segunda', 2, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 42794228, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('4,5'), 'Suspenso', 'Tercera', 3, TO_DATE('03/12/2017', 'DD/MM/YYYY'), 32407767, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,2'), 'Notable', 'Segunda', 4, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,9'), 'Notable', 'Primera', 3, TO_DATE('24/01/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('1,6'), 'Suspenso', 'Tercera', 1, TO_DATE('02/12/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('1'), 'Suspenso', 'Segunda', 1, TO_DATE('02/09/2017', 'DD/MM/YYYY'), 17361731, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,3'), 'Aprobado', 'Tercera', 1, TO_DATE('03/12/2017', 'DD/MM/YYYY'), 78002608, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('2'), 'Suspenso', 'Primera', 2, TO_DATE('23/01/2017', 'DD/MM/YYYY'), 12226352, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,5'), 'Sobresaliente', 'Tercera', 3, TO_DATE('04/12/2017', 'DD/MM/YYYY'), 53909587, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9'), 'Sobresaliente', 'Segunda', 1, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 78208070, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Segunda', 3, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 44748275, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,2'), 'Aprobado', 'Primera', 2, TO_DATE('22/01/2017', 'DD/MM/YYYY'), 95326106, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('0'), 'Suspenso', 'Segunda', 1, TO_DATE('05/09/2017', 'DD/MM/YYYY'), 64586570, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,5'), 'Aprobado', 'Tercera', 2, TO_DATE('05/12/2017', 'DD/MM/YYYY'), 64586570, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('3,5'), 'Suspenso', 'Primera', 3, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 95326106, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,1'), 'Sobresaliente', 'Segunda', 1, TO_DATE('04/09/2017', 'DD/MM/YYYY'), 19955161, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,6'), 'Aprobado', 'Primera', 1, TO_DATE('28/01/2017', 'DD/MM/YYYY'), 42079230, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,2'), 'Notable', 'Segunda', 4, TO_DATE('06/09/2017', 'DD/MM/YYYY'), 85838415, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Primera', 4, TO_DATE('29/01/2017', 'DD/MM/YYYY'), 66217035, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,8'), 'Sobresaliente', 'Tercera', 2, TO_DATE('06/12/2017', 'DD/MM/YYYY'), 66217035, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('2,5'), 'Suspenso', 'Segunda', 3, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 67032771, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,4'), 'Sobresaliente', 'Primera', 2, TO_DATE('30/01/2017', 'DD/MM/YYYY'), 72715608, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,9'), 'Aprobado', 'Segunda', 1, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 84656361, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,2'), 'Sobresaliente', 'Tercera', 2, TO_DATE('06/12/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('7,4'), 'Notable', 'Segunda', 2, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 12226352, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Segunda', 1, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('3'), 'Suspenso', 'Segunda', 1, TO_DATE('06/09/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,5'), 'Aprobado', 'Tercera', 2, TO_DATE('19/12/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Consultar;
END;
/

--Tabla AsignaturasPuntuadasConNotas
BEGIN
PCK_AsigPuntuadasConNotas.Inicializar;
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050024, 4, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050018, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 14, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050043, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050003, 16, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050014, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050010, 22, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050012, 21, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050001, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050026, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 10, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050015, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050027, 9, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050032, 7, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050039, 8, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050001, 7, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 8, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 20, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050002, 28, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050020, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050043, 9, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050010, 27, TRUE);
PCK_AsigPuntuadasConNotas.Consultar;
END;
/

--Tabla AsignaturasImpartidasEnAulas
BEGIN
PCK_AsigImpartidasEnAulas.Inicializar;
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 1, TO_DATE('07/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 7, TO_DATE('15/11/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 3, TO_DATE('16/12/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 5, TO_DATE('16/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 6, TO_DATE('24/09/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 2, TO_DATE('03/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 1, TO_DATE('05/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 9, TO_DATE('06/12/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 5, TO_DATE('07/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050015, 1, TO_DATE('07/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050015, 7, TO_DATE('20/01/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050002, 4, TO_DATE('26/11/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050002, 1, TO_DATE('30/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050001, 3, TO_DATE('23/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050001, 2, TO_DATE('07/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050012, 6, TO_DATE('02/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050012, 1, TO_DATE('01/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Consultar;
END;
/

--Tabla AsignaturasPertenecenAGrados
BEGIN
PCK_AsigPertenecenAGrados.Inicializar;
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050004, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050004, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050043, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050043, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050035, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050035, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050012, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050012, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050029, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050026, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050027, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050040, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050041, 1, TRUE);
PCK_AsigPertenecenAGrados.Consultar;
END;
/

--Tabla Becarios
BEGIN
PCK_Becarios.Inicializar;
PCK_Becarios.Insertar ('Insertar un becario', '93839721C', '61700LIW', TO_DATE('07/10/2016', 'DD/MM/YYYY'), TO_DATE('23/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '07842998K', '18537TZN', TO_DATE('08/11/2016', 'DD/MM/YYYY'), TO_DATE('26/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '67202652X', '18537TZN', TO_DATE('15/09/2016', 'DD/MM/YYYY'), TO_DATE('05/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '27576410P', '93073MJH', TO_DATE('03/11/2016', 'DD/MM/YYYY'), TO_DATE('24/06/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '67202652X', '38720AJG', TO_DATE('13/12/2016', 'DD/MM/YYYY'), TO_DATE('27/01/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '70964804Y', '07284VPY', TO_DATE('17/10/2016', 'DD/MM/YYYY'), TO_DATE('28/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '47966225R', '18537TZN', TO_DATE('27/09/2016', 'DD/MM/YYYY'), TO_DATE('29/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '00548678J', '13617BAU', TO_DATE('14/11/2016', 'DD/MM/YYYY'), TO_DATE('14/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '64427553E', '84676UFX', TO_DATE('23/12/2016', 'DD/MM/YYYY'), TO_DATE('05/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '00548678J', '84676UFX', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Consultar;
END;
/

--Tabla GruposAsistenAClaseEnAulas
BEGIN
PCK_GruposAsistenAClaseEnAulas.Inicializar;
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 1, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 3, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 4, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 5, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 6, 3, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 7, 3, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 8, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 1, 7, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 4, 6, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 5, 5, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 7, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 9, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 10, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 9, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Consultar;
END;
/

--Tabla Matriculas
BEGIN
PCK_Matriculas.Inicializar;
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, '93839721C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('03/09/2016', 'DD/MM/YYYY'), 2, '07842998K', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('05/09/2016', 'DD/MM/YYYY'), 1, '00548678J', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('10/09/2016', 'DD/MM/YYYY'), 3, '35849097D', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('03/09/2016', 'DD/MM/YYYY'), 1, '98523686N', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('01/09/2016', 'DD/MM/YYYY'), 4, '93839721C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '07804804F', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('06/09/2016', 'DD/MM/YYYY'), 2, '26810393Y', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('03/09/2016', 'DD/MM/YYYY'), 3, '42312153L', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('08/09/2016', 'DD/MM/YYYY'), 1, '42312153L', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('02/09/2016', 'DD/MM/YYYY'), 2, '27576410P', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('11/09/2016', 'DD/MM/YYYY'), 4, '64427553E', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('05/09/2016', 'DD/MM/YYYY'), 1, '07804804F', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('08/09/2016', 'DD/MM/YYYY'), 3, '77008982Z', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('04/09/2016', 'DD/MM/YYYY'), 1, '62968537B', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('08/09/2016', 'DD/MM/YYYY'), 3, '47966225R', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '23801240N', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('01/09/2016', 'DD/MM/YYYY'), 3, '36081385C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('02/09/2016', 'DD/MM/YYYY'), 1, '67202652X', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', TO_DATE('02/09/2016', 'DD/MM/YYYY'), 1, '77843402V', TRUE);
PCK_Matriculas.Consultar;
END;
/

--Tabla MatriculasPertenecenAGrados
BEGIN
PCK_MatricPertenecenAGrados.Inicializar;
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000001, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000002, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000003, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000004, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000005, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000001, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000002, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000004, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000006, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000005, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000007, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000008, 3, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000009, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000010, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000003, 3, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1000006, 1, TRUE);
PCK_MatricPertenecenAGrados.Consultar;
END;
/

--Tabla MatriculasContienenAsignaturas
BEGIN
PCK_MatriculasContienenAsig.Inicializar;
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050029, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050015, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050019, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000001, 2050026, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050007, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050027, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050011, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000002, 2050043, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000003, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000003, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000003, 2050002, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000003, 2050001, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000003, 2050010, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000006, 2050017, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000006, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000006, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000006, 2050014, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000006, 2050020, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050026, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050020, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050011, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050024, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050043, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050027, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050029, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000005, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050012, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050015, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050010, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050011, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050014, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050016, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050018, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050017, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050007, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050002, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050003, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050009, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050013, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050020, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1000019, 2050040, TRUE);
PCK_MatriculasContienenAsig.Consultar;
END;
/

--Tabla Profesores
BEGIN
PCK_Profesores.Inicializar;
PCK_Profesores.Insertar ('Insertar un profesor', '53712051J', 'Rosa María', 'Acien Zuruta', TO_DATE('12/02/1988', 'DD/MM/YYYY'), 'rosamariaaz@gmail.com', 'Catedrático', 1, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75098488S', 'Daniel', 'Amate Garrido', TO_DATE('22/03/1976', 'DD/MM/YYYY'), 'danielag@gmail.com', 'Titular', 2, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '45295530C', 'José', 'Benayas Perez', TO_DATE('10/07/1967', 'DD/MM/YYYY'), 'josebp@gmail.com', 'Contratado doctor', 3, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '78035832Y', 'Susana', 'Bernabe Casanova', TO_DATE('04/07/1968', 'DD/MM/YYYY'), 'susanabc@gmail.com', 'Colaborador', 7, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '78035130V', 'Irene', 'Bernal Ruiz', TO_DATE('04/09/1980', 'DD/MM/YYYY'), 'irenebr@gmail.com', 'Ayudante', 9, 9, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75238658T', 'Magdalena', 'Carrera Benitez', TO_DATE('06/03/1974', 'DD/MM/YYYY'), 'magdalenacb@gmail.com', 'Ayudante doctor', 1, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75258403B', 'Natalia', 'Casas García', TO_DATE('17/08/1962', 'DD/MM/YYYY'), 'nataliacg@gmail.com', 'Interino', 5, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75243008A', 'Encarnación', 'Cortes Ibáñez', TO_DATE('18/05/1964', 'DD/MM/YYYY'), 'encarnacionci@gmail.com', 'Contratado doctor', 5, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75257344X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 5, 7, TRUE);
PCK_Profesores.Consultar;
END;
/

--Tabla ProfesoresImpartenAsignaturas
BEGIN
PCK_ProfesoresImpartenAsig.Inicializar;
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050001, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75257344X', 2050010, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '45295530C', 2050011, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75238658T', 2050026, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75258403B', 2050019, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035130V', 2050003, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050043, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75257344X', 2050011, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '45295530C', 2050010, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050039, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050041, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050014, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050035, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050001, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050010, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050011, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050043, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050039, 6, TRUE);
PCK_ProfesoresImpartenAsig.Consultar;
END;
/

--Tabla ProfesoresImpartenEnGrupos
BEGIN
PCK_ProfesoresImpartenEnGrupos.Inicializar;
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 4, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 6, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 8, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 7, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 10, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 14, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 6, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 5, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 8, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '75258403B', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '75258403B', 1, TRUE);
PCK_ProfesoresImpartenEnGrupos.Consultar;
END;
/

--Tabla Tutorias
BEGIN
PCK_Tutorias.Inicializar;
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '8:00', 20, 'Pendiente', '93839721C', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '8:30', 20, 'Pendiente', '07842998K', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '9:40', 20, 'Pendiente', '27576410P', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('29/06/2017', 'DD/MM/YYYY'), '17:30', 20, 'Pendiente', '62968537B', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('29/06/2017', 'DD/MM/YYYY'), '17:50', 20, 'Pendiente', '93839721C', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('29/06/2017', 'DD/MM/YYYY'), '18:00', 20, 'Pendiente', '93839721K', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('30/06/2017', 'DD/MM/YYYY'), '8:10', 20, 'Pendiente', '93839721P', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('30/06/2017', 'DD/MM/YYYY'), '8:40', 20, 'Pendiente', '93839721B', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('17/11/2016', 'DD/MM/YYYY'), '18:30', 25, 'Pendiente', '07842998K', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('19/12/2016', 'DD/MM/YYYY'), '8:00', 20, 'Pendiente', '27576410P', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('21/02/2017', 'DD/MM/YYYY'), '09:30', 10, 'Pendiente', '07842998K', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '16:00', 30, 'Pendiente', '62968537B', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '12:50', 25, 'Pendiente', '62968537B', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '12:50', 25, 'Pendiente', '77843402V', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '16:30', 25, 'Aceptada', '77843402V', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('27/06/2017', 'DD/MM/YYYY'), '12:00', 25, 'Rechazada', '77843402V', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('27/06/2017', 'DD/MM/YYYY'), '17:40', 25, 'Pendiente', '77843402V', '45295530C', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('27/06/2017', 'DD/MM/YYYY'), '17:10', 25, 'Pendiente', '77843402V', '45295530C', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('29/06/2017', 'DD/MM/YYYY'), '17:20', 25, 'Aceptada', '77843402V', '45295530C', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('30/06/2017', 'DD/MM/YYYY'), '8:20', 25, 'Aceptada', '77843402V', '45295530C', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('03/07/2017', 'DD/MM/YYYY'), '8:50', 25, 'Aceptada', '77843402V', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('03/07/2017', 'DD/MM/YYYY'), '16:40', 25, 'Rechazada', '77843402V', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('06/07/2017', 'DD/MM/YYYY'), '17:10', 25, 'Rechazada', '77843402V', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('04/07/2017', 'DD/MM/YYYY'), '12:30', 25, 'Pendiente', '77843402V', '78035130V', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('06/07/2017', 'DD/MM/YYYY'), '18:20', 25, 'Pendiente', '77843402V', '78035130V', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('07/07/2017', 'DD/MM/YYYY'), '8:00', 25, 'Aceptada', '77843402V', '78035130V', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('10/07/2017', 'DD/MM/YYYY'), '9:50', 25, 'Aceptada', '77843402V', '75238658T', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('10/07/2017', 'DD/MM/YYYY'), '16:50', 25, 'Pendiente', '77843402V', '75238658T', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('14/07/2017', 'DD/MM/YYYY'), '9:00', 25, 'Rechazada', '77843402V', '75238658T', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('13/07/2017', 'DD/MM/YYYY'), '17:10', 25, 'Pendiente', '77843402V', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('14/07/2017', 'DD/MM/YYYY'), '8:50', 25, 'Aceptada', '77843402V', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('26/06/2017', 'DD/MM/YYYY'), '9:00', 25, 'Pendiente', '77843402V', '75243008A', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('27/06/2017', 'DD/MM/YYYY'), '12:30', 25, 'Pendiente', '77843402V', '75243008A', TRUE);

PCK_Tutorias.Consultar;
END;
/

--Tabla Usuarios
BEGIN
PCK_Usuarios.Inicializar;
PCK_Usuarios.Insertar ('Insertar un usuario', '77843402V', 'PruebaAlum1234', 'Alumno', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '78035832Y', 'PruebaProf1234', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '93839721C', 'Suspenso', 'Alumno', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '07842998K', 'Suspenso', 'Alumno', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '00548678J', 'Suspenso', 'Alumno', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '53712051J', 'Guapo', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '45295530C', 'PruebaAdmin1234', 'Profesor', 1, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '78035130V', 'Guapo', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '75238658T', 'Guapo', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '75258403B', 'Guapo', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '75243008A', 'Guapo', 'Profesor', 0, TRUE);
PCK_Usuarios.Insertar ('Insertar un usuario', '75257344X', 'PruebaAdmin1234' ,'Profesor', 1, TRUE);
PCK_Usuarios.Consultar;
END;
/

--Tabla HorarioProfesores
BEGIN
PCK_HorarioProfesores.Inicializar;
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '12:00', '13:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '9:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '12:00', '13:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '17:00', '18:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '17:00', '18:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '18:00', '19:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '53712051J', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '12:00', '13:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '9:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '12:00', '13:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '17:00', '18:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '17:00', '18:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '18:00', '19:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '45295530C', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035832Y', '8:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035832Y', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035832Y', '17:00', '19:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035832Y', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035130V', '12:00', '13:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035130V', '17:00', '18:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035130V', '17:00', '18:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035130V', '18:00', '19:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '78035130V', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75238658T', '12:00', '13:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75238658T', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75238658T', '9:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75238658T', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '12:00', '13:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '9:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '12:00', '13:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '17:00', '18:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '17:00', '18:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '18:00', '19:00', 'Jueves', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75258403B', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75243008A', '12:00', '13:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75243008A', '16:00', '17:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75243008A', '9:00', '10:00', 'Lunes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75243008A', '12:00', '13:00', 'Martes', TRUE);
PCK_HorarioProfesores.Insertar ('Insertar un horario de tutoría de un profesor', '75243008A', '8:00', '9:00', 'Viernes', TRUE);
PCK_HorarioProfesores.Consultar;
END;
/

--Tabla Eventos
BEGIN
PCK_Eventos.Inicializar;
PCK_Eventos.Insertar ('Insertar un evento', '77843402V', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Defensa ISSI', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '77843402V', TO_DATE('11/6/2018', 'DD/MM/YYYY'), 'Examen MD', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '77843402V', TO_DATE('15/6/2018', 'DD/MM/YYYY'), 'Repaso Arquitectura', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '77843402V', TO_DATE('20/6/2018', 'DD/MM/YYYY'), 'Comprar Leche', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '77843402V', TO_DATE('22/6/2018', 'DD/MM/YYYY'), 'Examen ADDA a las 9pm', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '93839721C', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Defensa ISSI', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '07842998K', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Defensa ISSI', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '00548678J', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Defensa ISSI', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '26810393Y', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Aprobar Grupo MARK', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '26810393Y', TO_DATE('4/6/2018', 'DD/MM/YYYY'), 'Revisar Nota Grupo MARK', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '26810393Y', TO_DATE('5/6/2018', 'DD/MM/YYYY'), 'Cambiar nota Grupo MARK a MATRICULA', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '26810393Y', TO_DATE('8/6/2018', 'DD/MM/YYYY'), 'Comprar tinta Impresora', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('29/5/2018', 'DD/MM/YYYY'), 'Suspender al grupo 3', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('30/5/2018', 'DD/MM/YYYY'), 'Comprar tiza', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('30/5/2018', 'DD/MM/YYYY'), 'Repasar Actividad 12b', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('4/6/2018', 'DD/MM/YYYY'), 'Responder Correo de Camila', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('20/6/2018', 'DD/MM/YYYY'), 'Ignorar Correo de Ruben', TRUE);
PCK_Eventos.Insertar ('Insertar un evento', '70964804Y', TO_DATE('20/6/2018', 'DD/MM/YYYY'), 'Poner Matricula Grupo Mark', TRUE);
PCK_Eventos.Consultar;
END;
/

