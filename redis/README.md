# Práctica Redis – ConnectU

## Descripción
Esta práctica implementa ejemplos de uso de **Redis** para la plataforma ConnectU. Se abordan dos casos principales:

1. **Últimos 5 cursos visitados por un estudiante** utilizando **listas (LIST)**.  
2. **Grupos más populares** utilizando **sorted sets (ZSET)**.

Redis es una base de datos en memoria, rápida y eficiente, ideal para manejar datos de alta frecuencia de lectura y escritura como historial de visitas o popularidad de grupos.

---

## Estructura de datos propuesta

### 1. Últimos 5 cursos visitados
- **Clave:** `usuario:<id_estudiante>:ultimos_cursos`
- **Tipo:** LIST  
- **Descripción:** Guarda los cursos visitados por un estudiante en orden de visita más reciente.  
- **Ejemplo de clave:** `usuario:123:ultimos_cursos`

### 2. Grupos más populares
- **Clave:** `grupos_populares`
- **Tipo:** ZSET (Sorted Set)  
- **Descripción:** Almacena los grupos de estudio con un score que indica su popularidad.  
- **Ejemplo de clave:** `grupos_populares`

---

## Comandos de Redis utilizados

### Últimos 5 cursos visitados
```redis
LPUSH usuario:123:ultimos_cursos "Bases de Datos II"
LPUSH usuario:123:ultimos_cursos "Programacion Web"
LPUSH usuario:123:ultimos_cursos "Matematica Discreta"
LPUSH usuario:123:ultimos_cursos "Fisica I"
LPUSH usuario:123:ultimos_cursos "Quimica General"
LTRIM usuario:123:ultimos_cursos 0 4
LRANGE usuario:123:ultimos_cursos 0 4

### Grupos más populares
```redis
ZINCRBY grupos_populares 3 "Grupo Bases de Datos II"
ZINCRBY grupos_populares 2 "Grupo Programacion Web"
ZINCRBY grupos_populares 5 "Grupo Matematica Discreta"
ZREVRANGE grupos_populares 0 2 WITHSCORES

