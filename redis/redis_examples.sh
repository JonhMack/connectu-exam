#!/bin/bash
# Ejemplos de comandos Redis para la práctica ConnectU

# ==========================================
# Parte 1: Últimos 5 cursos visitados por un estudiante
# ==========================================

# Supongamos que el estudiante tiene ID 123
# Se agregan cursos en orden de visita más reciente
LPUSH usuario:123:ultimos_cursos "Bases de Datos II"
LPUSH usuario:123:ultimos_cursos "Programacion Web"
LPUSH usuario:123:ultimos_cursos "Matematica Discreta"
LPUSH usuario:123:ultimos_cursos "Fisica I"
LPUSH usuario:123:ultimos_cursos "Quimica General"

# Mantener solo los 5 últimos cursos
LTRIM usuario:123:ultimos_cursos 0 4

# Consultar los últimos 5 cursos
LRANGE usuario:123:ultimos_cursos 0 4

# ==========================================
# Parte 2: Los 3 grupos más populares
# ==========================================

# Supongamos que hay un ZSET que almacena la popularidad de los grupos
# Incrementamos visitas de los grupos
ZINCRBY grupos_populares 3 "Grupo Bases de Datos II"
ZINCRBY grupos_populares 2 "Grupo Programacion Web"
ZINCRBY grupos_populares 5 "Grupo Matematica Discreta"

# Obtener los 3 grupos más populares con su score
ZREVRANGE grupos_populares 0 2 WITHSCORES
