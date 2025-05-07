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
```bash
docker inspect nombre_docker | grep IPAddress
```
Si se quiere ingresar al docker de mariadb:
```bash
docker exec -it nombre-del-contenedor bash
mariadb -u root -p  # para ingresar con usuario/password, root/example
```


