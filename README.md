# serversmb
Este repositorio contiene todo lo necesario para poder construir una imagen de Docker que despliega un servidor SMB y sirve una ruta ("**/shared**") a través de dicho protocolo.

## Generar la imagen

```sh
$ docker build ./dockerFile -t serversmb
```

## Arrancar un contenedor

Si has construido localmente la imagen, el comando que debes utilizar es:
```sh
$ docker run -d -p 445:445 --name serversmb -v /path/local:/shared serversmb
```
Si no quieres construirte la imagen, puedes utilizar una ya construida que se encuentra publicada en [Docker hub](https://hub.docker.com/r/informaticodelaverno/serversmb).

Para crear un contenedor de esta imagen  (Compartiendo "**/path/local**" vía SMB), hay que ejecutar:
```sh
$ docker run -d -p 445:445 --name serversmb -v /path/local:/shared informaticodelaverno/serversmb
```
## Montar el directorio expuesto por el contenedor
El contenedor siempre expone el path "**/shared**", así que para montar ese path el comando a lanzar es el siguiente:
```sh
$ mount -t cifs -o username=guest,password="" //IPDelContenedor/shared /path/local/de/montaje
```
For example:
```sh
$ mount -t cifs -o username=guest,password="" //172.17.0.2/shared /path/local/de/montaje
```
# Notas
- "**cifs-utils**" en ocasiones tiene que estar instalado para habilitar el soporte para montar SMB.
```sh
$ apt-get install cifs-utils
```
