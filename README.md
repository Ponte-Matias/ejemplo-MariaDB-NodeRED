# Ejemplo de MariaDB implementado en NodeRED
### Cómo usarlo
Primero levantar el docker de Node-RED
```bash
docker network create iot
docker run -itd -p 1880:1880 --network iot --name mynodered nodered/node-red
```
Correr docker-compose.yaml (notar que no es necesario utilizar adminer, es simplemente para poder visualizar en un entorno visual la base de datos, si se desea, borrar/comentar las lineas si no se quiere utilizar adminer)
```bash
docker compose up
```
Ingresar a Node-RED: [http://localhost:1880](http://localhost:1880)
Ingresar a adminer:  [http://localhost:8080](http://localhost:8080)

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

Luego en el bloque function poner:
msg.topic = "SELECT * FROM <tabla_a_visualizar>";
return msg;
Luego al apretar el boton de inject, veremos en el debug los datos de la tabla
```bash
docker inspect nombre_docker | grep IPAddress
```
Si se quiere ingresar al docker de mariadb:
```bash
docker exec -it nombre-del-contenedor bash
mariadb -u root -p  # para ingresar con usuario/password, root/example
```


