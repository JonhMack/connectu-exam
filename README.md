Este repositorio contiene los scripts necesarios para la creación y gestión de una base de datos de ejemplo denominada ConnectU, implementada en Neo4j. El objetivo es proporcionar una estructura de nodos y relaciones que permita realizar consultas representativas del modelo de datos.

Contenido del Script

Limpieza de la base de datos:

Se eliminan todos los nodos y relaciones existentes, permitiendo iniciar la base de datos desde un estado limpio.

Creación de nodos:

Estudiantes: Juan Perez, Maria Lopez

Profesor: Carlos Garcia

Grupos de estudio: Grupo Bases de Datos II, Grupo Programacion Web

Cursos: Bases de Datos II, Programacion Web

Creación de relaciones:

PERTENECE_A: Relaciona estudiantes con los grupos de estudio a los que pertenecen.

ASOCIADO_A: Relaciona grupos de estudio con los cursos correspondientes.

SIGUE: Representa la relación de seguimiento entre estudiantes.

RECOMIENDA: Representa la recomendación de estudiantes hacia un profesor.

Consultas de ejemplo:

Obtención de los compañeros de grupo de un estudiante específico (Juan Perez).

Conteo del número de recomendaciones recibidas por un profesor (Carlos Garcia).

Visualización de los grupos asociados a un curso determinado.

Instrucciones de ejecución

Acceder al shell interactivo de Neo4j mediante Docker:

docker exec -it neo4j-connectu cypher-shell -u neo4j -p password123

Copiar y pegar el contenido completo del script en el shell.

Presionar Enter para ejecutar los comandos y crear los nodos y relaciones.

Ejecutar las consultas de ejemplo para verificar que los datos se han creado correctamente.