# Usa la imagen oficial de Python como base
FROM python:3.8-slim

# Establece el directorio de trabajo
WORKDIR /app
# Copia el directorio de la aplicación al contenedor
COPY . /app
# Instala las dependencias de Python
RUN apt-get update && apt-get install -y build-essential pkg-config libmariadb-dev curl
RUN pip install -r requirements.txt

# Expone el puerto 5000
EXPOSE 5000
# Ejecuta la aplicación Flask
CMD ["python", "app.py"]
