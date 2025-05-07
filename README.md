# Ejemplo de MariaDB implementado en NodeRED
### Cómo usarlo
Primero levantar el docker de Node-RED
```bash
docker network create iot
docker run -itd -p 1880:1880 --network iot --name mynodered nodered/node-red
```
Correr docker-compose.yaml
```bash
docker compose up
```
Ingresar a Node-RED: [http://localhost:1880](http://localhost:1880)
Ingresar a adminer:  [http://localhost:8080](http://localhost:8080)

En la pagina de Node-RED conectar los bloques y asegurarse de poner las IP's correctas de los contenedores
Para conectar la base de datos MariaDB utilizar el bloque mysql que se obtiene al instalar dentro de Manage palette: "node-red-node-mysql"
![image](https://github.com/user-attachments/assets/0542c183-103a-4587-b754-b55aa42ab06c)
Los bloques de izquierda a derecha son:
inject - function - mysql - debug
Editar el bloque mysql con la IP del container, puerto 3306 y la base de datos a trabajar/visualizar.
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


