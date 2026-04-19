PROYECTO: Sistema de Reparaciones – Instrucciones de Trabajo en Equipo

---

## OBJETIVO GENERAL

El sistema ya cuenta con toda la funcionalidad implementada (conexión a base de datos y consultas).
El objetivo del equipo es mejorar la INTERFAZ VISUAL (UI) sin alterar la lógica existente.

Cada integrante trabajará en una rama independiente y será responsable de mejorar la apariencia de una sección del sistema.

---

## REGLAS GENERALES (OBLIGATORIO)

1. NO modificar la lógica del backend (.aspx.cs)

   * No cambiar consultas SQL
   * No modificar métodos como LlenarGrid()

2. SOLO trabajar en:

   * Archivos .aspx (interfaz)
   * Estilos visuales (colores, orden, diseño)

3. No trabajar directamente en la rama MAIN

4. Cada integrante debe trabajar en su propia rama

5. Antes de hacer push:

   * Verificar que la página sigue funcionando
   * No romper navegación ni botones

---

## ESTRUCTURA DE RAMAS

Cada integrante debe crear su rama con el siguiente formato:

feature-nombre

Ejemplos:

* feature-usuarios
* feature-equipos
* feature-tecnicos
* feature-reparaciones
* feature-asignaciones
* feature-detalles

---

## ASIGNACIÓN DE TRABAJO

Integrante 1:
Página: bodega.aspx (Usuarios)
Responsabilidad:

* Mejorar diseño de tabla
* Ajustar títulos
* Ordenar contenido visual

Integrante 2:
Página: Producto.aspx (Equipos)
Responsabilidad:

* Mejorar visualización del GridView
* Agregar mejor distribución de datos

Integrante 3:
Página: Tecnicos.aspx
Responsabilidad:

* Mejorar presentación de información
* Aplicar estilos consistentes

Integrante 4:
Página: Reparaciones.aspx
Responsabilidad:

* Mejorar visualización de datos
* Hacer más legible la información

Integrante 5:
Página: Asignaciones.aspx
Responsabilidad:

* Mejorar estructura visual
* Alinear datos correctamente

Integrante 6:
Página: Detalles.aspx
Responsabilidad:

* Mejorar presentación de detalles
* Aplicar formato claro a fechas y costos

---

## MEJORAS VISUALES ESPERADAS

Cada integrante debe aplicar al menos:

1. Mejorar GridView
   Ejemplo:

   * Bordes visibles
   * Color en encabezado
   * Espaciado entre celdas

2. Títulos claros

   * Usar <h1> o <h2>
   * Alinear correctamente

3. Botón “Volver al menú”

   * Que sea visible y consistente

4. Orden visual

   * Espacios entre elementos
   * No dejar todo pegado

5. Consistencia

   * Mantener el mismo estilo en toda la página

---

## FLUJO DE TRABAJO

1. Clonar repositorio

2. Crear rama:
   git checkout -b feature-nombre

3. Realizar cambios SOLO en UI

4. Guardar y probar localmente

5. Subir cambios:
   git add .
   git commit -m "Mejoras visuales en [pagina]"
   git push origin feature-nombre

6. El líder (main) revisará y hará merge

---

## CRITERIOS DE ACEPTACIÓN

Para aprobar cambios:

* La página debe seguir funcionando
* No debe haber errores
* La navegación debe mantenerse
* Debe haber mejora visual clara

---

## NOTA FINAL

Este proyecto prioriza:

1. FUNCIONALIDAD (ya completada)
2. PRESENTACIÓN (trabajo del equipo)

No se busca lógica nueva, solo mejorar la experiencia visual del sistema.

---

## FIN DEL DOCUMENTO
