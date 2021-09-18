# En este caso, todo el proceso de build (hasta el próximo FROM) se
# considerará como una fase. De esta manera, se puede acceder desde la
# fase posterior a lo que la fase anterior generó (archivos, configuraciones,
# dependencias, etc). Toda la primera fase se cotendrá en "prebuild".
FROM node:12 as prebuild

COPY ["package.json", "package-lock.json", "/usr/src/"]

WORKDIR /usr/src

# Descargando primero dependencias de producción y luego de desarrollo para
# aprovechar Docker Sheets Caché.
RUN npm install --only=production

COPY [".", "/usr/src/"]

RUN npm install --only=development

RUN npm run test

# Ahora, crear una nueva imagen que vuelva a instalar las dependencias (las cuales
# aprovechará que están cacheadas) y copiando solo la versión de distribución del
# código
FROM node:12

COPY ["package.json", "package-lock.json", "/usr/src/"]

WORKDIR /usr/src

RUN npm install --only=production

COPY --from=prebuild ["/usr/src/dist", "/usr/src/"]

CMD ["npm", "run", "start"]