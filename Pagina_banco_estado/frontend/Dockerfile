# Usa una imagen oficial de Nginx como base
FROM nginx:latest

# Elimina el archivo de configuración predeterminado de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Expone el puerto 80
EXPOSE 8000
