# Indicaciones de Instalacion para CRUD-Compras-Productos

---

## Tecnologias Utilizadas

- Backend: Laravel y PHP 8.2+
- Frontend: Vue 3 y Tailwind CSS
- Base de Datos: MySQL 8.0
- Generacion de Excel: phpoffice/phpspreadsheet
- Peticiones HTTP: Axios
- Bundler: Vite

---

## Requisitos Previos

Se tiene que instalar lo siguiente para poder correr el proyecto:

- PHP 8.2+ ' https://windows.php.net/download (el archivo: VS17 x64 Non Thread Safe (para windows)) ' (se tiene que extraer dentro de C:\php su contenido)
- Composer ' https://getcomposer.org '
- Node.js y npm ' https://nodejs.org '
- MySQL 8.0 junto con MySQL Workbench ' https://dev.mysql.com/downloads/installer ' (se descarga MySQL y dentro de la instalacion se hace personalizada y se selecciona Workbench)
- Git ' https://git-scm.com ' (para navegar entre ramas y usar el comando clone y asi)

---

## Extensiones de PHP requeridas

hay que abrir el archivo php.ini (extraido el php en C:\php) y buscar con 'ctrl+f' que las siguientes extensiones no tengan el punto y coma ; al inicio para activarlas: - extension=gd

- extension=zip
- extension=mbstring
- extension=fileinfo
- extension=pdo_mysql
- extension=openssl

---

## Pasos de Instalacion

1. Hay que clonar el repositorio:
   ' git clone https://github.com/BraulioPy/boletiland-crud.git ' ()

2. Hay que entrar a la carpeta del proyecto:
   ' cd boletiland-crud '

3. Hay que Abrir MySQL Workbench y conectarse al servidor local. Ir a File > Open SQL Script, seleccionar el archivo boletiland_crud.sql que esta en la raiz del proyecto y ejecutalo con el boton del rayo. Esto crea la base de datos con todas sus tablas y datos de ejemplo.

4. Hay que Copiar el archivo de configuracion:
   ' cp .env.example .env ' (en terminal dentro de la raiz del proyecto)

5. Se debe de Abrir el archivo .env recien creado y editar las siguientes variables con las credenciales del MySQL:
    - DB_HOST=127.0.0.1
    - DB_PORT=3306
    - DB_DATABASE=boletiland_crud
    - DB_USERNAME=root
    - DB_PASSWORD=tu_contrasena_MySQL
6. Hay Instalar las dependencias de PHP (dentro de una terminal en la raiz del proyecto):
   ' composer install '

7. Hay que Generar la clave de seguridad de la aplicacion (dentro de una terminal en la raiz del proyecto):
   ' php artisan key:generate '

8. Hay Instala las dependencias de JavaScript (dentro de una terminal en la raiz del proyecto):
   ' npm install '

9. Se deben de Abrir dos terminales en la raiz del proyecto y correr uno en cada una:
   Terminal 1:
   ' npm run dev '

    Terminal 2:
    ' php artisan serve '

10. Hay que abrir el navegador y entrar a la direccion que se muestra en la terminal 2, con ctrl+click arriba del link de la terminal

Nota: las dos terminales deben estar activas al mismo tiempo. Si el backend no esta corriendo los endpoints no funcionaran.
