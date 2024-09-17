# Stage 1: Compile and Build angular codebase
FROM node as build
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app

# ARG para decidir si se ejecutan los tests
ARG RUN_TESTS=false
# Ejecuta los tests de cobertura si la variable RUN_TESTS está habilitada
RUN if [ "$RUN_TESTS" = "true" ]; then npm run test -- --code-coverage --watch=false; fi

RUN npm run build 

# Stage 2, use the compiled app, ready for production with Nginx
FROM nginx
COPY --from=build /app/dist/sample-angular-app/browser /usr/share/nginx/html
#Changing default config 
COPY ./nginx/default.conf  /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]