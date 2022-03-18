# Prácticas en Docker

Ordenadas de menor a mayor dificultad.

### Indice
- **/my-first-image**. Creando una imagen.
- **/node-app-example**. Introducción a Docker Compose.
    - Revisión general de sintaxis de docker-compose.yml.
    - Comando de arranque: SHELL FORM vs EXEC FORM.
    - Montando Named Volume y Bind Mount para reflejar el directorio de trabajo con el directorio del contenedor.
    - Conectando dos contenedores a través de una red virtual local.
    - Usos deñ archivo .dockerignore.
- **/executable-image**. Creando una imagen que pueda crear contenedores ejecutables.
    - ENTRYPOINT vs CMD.
- **/multi-stage**. Configuración de entorno de desarrollo y producción en Docker. Creación de imágenes por etapas múltiples (multi-stage).
    - Archivos dockerfile y .dockerignore en entornos de desarrollo y producción.