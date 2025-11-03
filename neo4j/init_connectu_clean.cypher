CREATE (juan:Estudiante {nombre: 'Juan P?rez'});
CREATE (maria:Estudiante {nombre: 'Mar?a L?pez'});
CREATE (carlos:Profesor {nombre: 'Carlos Garc?a'});
CREATE (grupo1:GrupoDeEstudio {nombre: 'Bases de Datos II'});
CREATE (grupo2:GrupoDeEstudio {nombre: 'Programaci?n Web'});
CREATE (curso1:Curso {nombre: 'Bases de Datos II'});
CREATE (curso2:Curso {nombre: 'Programaci?n Web'});

CREATE (juan)-[:SIGUE]->(maria);
CREATE (juan)-[:PERTENECE_A]->(grupo1);
CREATE (maria)-[:PERTENECE_A]->(grupo1);
CREATE (maria)-[:PERTENECE_A]->(grupo2);
CREATE (grupo1)-[:ASOCIADO_A]->(curso1);
CREATE (grupo2)-[:ASOCIADO_A]->(curso2);
CREATE (juan)-[:RECOMIENDA]->(carlos);
CREATE (maria)-[:RECOMIENDA]->(carlos);
