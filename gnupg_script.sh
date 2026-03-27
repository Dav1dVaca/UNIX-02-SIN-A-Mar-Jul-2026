uname -a # da informacion acerca del ordenador
which gpg #ubicacion del binario de gpg
gpg --version #me da la version e informacion adicional 
gpg --full-generate-key # genero las llaves publicas y privadas 
gpg --list-key # muestra todas las claves gpg publicas
gpg --armor --export # exporta una clave publica gpg de un formato de texto
gpg --list-secret-keys --keyid-format-long # listar las claves gpg secretas privadas 
gpg --armor --export-secret-keys 1A2D50F7F787AE3A # exporta tu clave privada asociada al Id enviado 
gpg --armor --export davidsvaca07@gmail.com > mi_llave_publica.asc # exporta la llave asociada al correo
gpg --import llavepublica.asc llave-publica.asc # importa la llave de mi compa 
$ echo "rubias o morenas"> doc_no_cifrado.txt # creamos un archivo con mensaje 
gpg --output doc_cifrado.txt --encrypt --recipient adriangarciasnchez@gmail.com doc_no_cifrado.txt # toma el archivo y lo cifra usando la llave publica del destinatario
gpg --decrypt cifradoadrian.txt # decifra el mensaje de mi amigo
gpg --clearsign cifradoadrian.txt # toma un archivo y lo firma digitalmente y crea un nuevo archivo
gpg --sign cifradoadrian.txt.asc # firma el archivo digitalmente
gpg --detach-sign cifradoadrian.txt.asc # crea una firma separada del archivo
gpg --verify cifradoadrian.txt.asc # verifica la firma digital del celar sign
gpg --edit-key adriangarciasnchez@gmail.com trust-4-save # abre el modo de edicion de una clase y posteriormente solicita permisos de confibilidad
gpg --sign-key adriangarciasnchez@gmail.com # pone mi firma en la llave de mi compa
gpg --encrypt --sign adriangarciasnchez@gmail.com cifradoadrian.txt # cifra el archivo usando la llave publica de mi compa
gpg --decrypt cifradoadrian.txt.asc # decifra el mensaje de mi compa