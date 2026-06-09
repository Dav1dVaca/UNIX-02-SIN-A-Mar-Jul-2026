#!/bin/bash
# ejecutar script pasando nombre y apellido como argumentos
./exercise1.sh David Vaca
#dar permisos al archivo
chmod +x exercise1.sh
#!/bin/bash

# Asignar los argumentos a variables
NOMBRE=$1
APELLIDO=$2

# Crear (o sobreescribir) el archivo output.txt
# Escribir la fecha actual en formato DD-MM-YYYY
date +"%d-%m-%Y" > output.txt

# Escribir el nombre completo en output.txt (usamos >> para añadir al final)
echo "$NOMBRE $APELLIDO" >> output.txt

# Hacer una copia de seguridad llamada backup.txt
cp output.txt backup.txt

# Imprimir el contenido del archivo en la terminal
cat output.txt