# Ejemplo de MariaDB implementado en NodeRED
### Cómo usarlo
Primero crear la network donde se van a comunicar los containers
```bash
docker network create iot
```
Correr docker-compose.yaml (notar que no es necesario utilizar adminer, es simplemente para poder visualizar en un entorno visual la base de datos, si se desea, borrar/comentar las lineas si no se quiere utilizar adminer)
```bash
docker compose up
```
Ingresar a Node-RED: [http://localhost:1880](http://localhost:1880)
Ingresar a adminer:  [http://localhost:8080](http://localhost:8080)

Si se desea ingresar a la base de datos a través de Adminer, en el campo server deben poner el nombre del contenedor, en este caso: mydb

![image](https://github.com/user-attachments/assets/d3f17c55-5ad8-4d62-ba4d-0017bc6af694)

Notar que ya se brinda una base de datos con una tabla pequeña de ejemplo.
Database: iotdb
Tabla: sensors

En la pagina de Node-RED conectar los bloques y asegurarse de poner las IP's correctas de los contenedores
Para conectar la base de datos MariaDB utilizar el bloque mysql que se obtiene al instalar dentro de Manage palette: "node-red-node-mysql"

![image](https://github.com/user-attachments/assets/0542c183-103a-4587-b754-b55aa42ab06c)

Los bloques de izquierda a derecha son:
inject - function - mysql - debug.
Editar el bloque mysql (haciendo doble click) con la IP del container, puerto 3306 y la base de datos a trabajar/visualizar, debe quedar de la siguiente forma:

![image](https://github.com/user-attachments/assets/e1b7bdd6-5923-4be9-8289-a2f8952c026e)

Para averiguar la IP del contenedor se puede hacer:
```bash
docker inspect nombre_docker | grep IPAddress
```

Luego en el bloque function poner:
```sql
msg.topic = "SELECT * FROM sensors";
return msg;
```
Una vez configurado todo, presionar el botón de Deploy arriba a la derecha y abrir la sección de debug (también arriba a la derecha).
Luego al apretar el boton de inject, veremos en el debug los datos de la tabla.

Si se quiere ingresar a la terminal del Docker de MariaDB para utilizar los comandos manualmente, hacer:
```bash
docker exec -it nombre-del-contenedor bash
mariadb -u root -p  # para ingresar con usuario/password, root/example
```

### Conclusión
Con esta simple implementación en Node-RED se pueden lograr grandes proyectos automatizando la recolección de datos o agregar datos a tablas de distintos tipos. Además si se combina con protocolos como MQTT podremos implementar más herramientas para trabajar con IOT.
