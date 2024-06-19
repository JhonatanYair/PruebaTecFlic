# Usa una imagen base de Node.js
FROM node:alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Compila la aplicación Angular en modo de producción
RUN npm run build --prod

# Expone el puerto 80 en el contenedor
EXPOSE 80

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["npm", "run", "serve:ssr"]
