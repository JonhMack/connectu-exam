// ============================
// 1️⃣ Limpiar la base de datos
// ============================
MATCH (n) DETACH DELETE n;

// ============================
// 2️⃣ Crear nodos
// ============================

// Estudiantes
CREATE (juan:Estudiante {nombre:'Juan Perez'});
CREATE (maria:Estudiante {nombre:'Maria Lopez'});

// Profesor
CREATE (carlos:Profesor {nombre:'Carlos Garcia'});

// Grupos de estudio
CREATE (grupo1:GrupoDeEstudio {nombre:'Grupo Bases de Datos II'});
CREATE (grupo2:GrupoDeEstudio {nombre:'Grupo Programacion Web'});

// Cursos
CREATE (curso1:Curso {nombre:'Bases de Datos II'});
CREATE (curso2:Curso {nombre:'Programacion Web'});

// ============================
// 3️⃣ Crear relaciones
// ============================

// Relaciones de pertenencia a grupos
MATCH (juan:Estudiante {nombre:'Juan Perez'}), (grupo1:GrupoDeEstudio {nombre:'Grupo Bases de Datos II'})
CREATE (juan)-[:PERTENECE_A]->(grupo1);

MATCH (maria:Estudiante {nombre:'Maria Lopez'}), (grupo1:GrupoDeEstudio {nombre:'Grupo Bases de Datos II'})
CREATE (maria)-[:PERTENECE_A]->(grupo1);

MATCH (maria:Estudiante {nombre:'Maria Lopez'}), (grupo2:GrupoDeEstudio {nombre:'Grupo Programacion Web'})
CREATE (maria)-[:PERTENECE_A]->(grupo2);

// Relaciones grupos asociados a cursos
MATCH (grupo1:GrupoDeEstudio {nombre:'Grupo Bases de Datos II'}), (curso1:Curso {nombre:'Bases de Datos II'})
CREATE (grupo1)-[:ASOCIADO_A]->(curso1);

MATCH (grupo2:GrupoDeEstudio {nombre:'Grupo Programacion Web'}), (curso2:Curso {nombre:'Programacion Web'})
CREATE (grupo2)-[:ASOCIADO_A]->(curso2);

// Relaciones de seguimiento
MATCH (juan:Estudiante {nombre:'Juan Perez'}), (maria:Estudiante {nombre:'Maria Lopez'})
CREATE (juan)-[:SIGUE]->(maria);

// Relaciones de recomendación
MATCH (juan:Estudiante {nombre:'Juan Perez'}), (carlos:Profesor {nombre:'Carlos Garcia'})
CREATE (juan)-[:RECOMIENDA]->(carlos);

MATCH (maria:Estudiante {nombre:'Maria Lopez'}), (carlos:Profesor {nombre:'Carlos Garcia'})
CREATE (maria)-[:RECOMIENDA]->(carlos);

// ============================
// 4️⃣ Consultas finales
// ============================

// 4.1 Compañeros de Juan Perez
MATCH (juan:Estudiante {nombre:'Juan Perez'})-[:PERTENECE_A]->(g:GrupoDeEstudio)<-[:PERTENECE_A]-(companero:Estudiante)
WHERE companero.nombre <> 'Juan Perez'
RETURN DISTINCT companero.nombre AS Companero;

// 4.2 Cantidad de recomendaciones al profesor Carlos Garcia
MATCH (e:Estudiante)-[:RECOMIENDA]->(p:Profesor {nombre:'Carlos Garcia'})
RETURN p.nombre AS Profesor, count(e) AS total_recomendaciones;

// 4.3 Grupos asociados a un curso específico (ejemplo: Bases de Datos II)
MATCH (g:GrupoDeEstudio)-[:ASOCIADO_A]->(c:Curso {nombre:'Bases de Datos II'})
RETURN g.nombre AS Grupo, c.nombre AS Curso;
