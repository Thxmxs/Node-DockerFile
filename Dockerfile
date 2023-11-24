#Montamos linux con node
FROM --platform=linux/amd64 node:19.2-alpine3.16

#CD app dentro del container
WORKDIR /app

#Copia todo lo del directorio actual en el directorio /app del container
COPY . .

#Instalar las dependencias
RUN npm install

#Realizar testing
RUN npm run test

#Eliminar archivos y directorios no necesarios en PROD
RUN rm -rf tests && rm -rf node_modules

#Unicamente las dependencias de prod
RUN npm install --prod

#Iniciamos backend
CMD [ "node", "app.js" ]

# ahora vamos a la termina y ejecutamos ddocker build -t thxmxs/cron-ticker:mapache .
# Corremos la imagen docker container run cron-ticker+
