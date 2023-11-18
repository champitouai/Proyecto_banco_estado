from flask import Flask, render_template, request, redirect, url_for, flash, session, send_from_directory
import logging
from flask_session import Session
from flask_mysqldb import MySQL
import hashlib
import re 

app = Flask(__name__)
app.secret_key = "hola"

# Configuración de la sesión
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configuración de la base de datos
app.config["MYSQL_HOST"] = "database"
app.config["MYSQL_USER"] = "LeonSKennedy"
app.config["MYSQL_PASSWORD"] = "Chocapic3312"
app.config["MYSQL_DB"] = "compras"
app.config["MYSQL_PORT"] = 3306
mysql = MySQL(app)

# Configurar la URL base para los archivos estáticos y las plantillas
app.config['STATIC_URL_PATH'] = '/static'
app.config['TEMPLATE_FOLDER'] = '/templates'

# Función para obtener una conexión a la base de datos
def get_db():
    return mysql.connection
#Fucniones para evitar inyecciones SQL
def validateContra(hash_contrasena):
    if not hash_contrasena:
        return False
    lengthValid = 3 <= len(hash_contrasena) <= 80
    return lengthValid

def validateEmail(correo):
    if not correo:
        return False
    # format validation
    regex = re.compile(r'^[\w\.]+@([\w]+\.)+[\w]{2,3}$')
    formatValid = regex.match(correo)
    lengthValid = len(correo) <= 80

    # return logic AND of validations.
    return bool(formatValid) and lengthValid


# Rutas para servir archivos estáticos y plantillas desde el contenedor de frontend
@app.route('/static/<path:filename>')
def serve_static(filename):
    return send_from_directory('/usr/share/nginx/html/static/', filename)

@app.route('/templates/<path:filename>')
def serve_template(filename):
    return send_from_directory('/usr/share/nginx/html/templates/', filename)

# Rutas de tu aplicación
@app.route('/')
def index():
    if 'loggedin' in session:
        return render_template('index.html')  
    else:
        return redirect(url_for('login'))

@app.route('/logout', methods=['GET'])
def clear_session():
    if 'loggedin' in session:
        session.pop('loggedin', None)
        return redirect(url_for('login'))
    else:
        return redirect(url_for('index'))

@app.route('/sistema_alertas')
def sistema_de_alertas():
    if 'loggedin' not in session:
        return redirect(url_for('login'))
    return render_template('Sistema_Alertas.html')

@app.route('/sistema_monitoreo')
def sistema_de_monitoreo():
    if 'loggedin' not in session:
        return redirect(url_for('login'))
    return render_template('Sistema_Monitoreo.html')    

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        error = [] 
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        if not validateContra(contrasena):
            error.append("El formato de contraseña no es válido.")
        if not validateEmail(correo):
            error.append("El email ingresado no es válido.")
        if error:
            for e in error:
                flash(e)
        else:       
            hash_contrasena = hashlib.sha256(contrasena.encode("utf-8")).hexdigest()
            usuarios = inicio(correo, hash_contrasena)
            if usuarios and usuarios[0][2] == correo and usuarios[0][3] == hash_contrasena:
                session['loggedin'] = True
                session['usuarios'] = usuarios
                return redirect(url_for('index'))
            else:
                flash('Por favor, verifica tus credenciales de inicio de sesión')
                return redirect(url_for('login'))
    return render_template('login.html')

def inicio(correo, contrasena):
    sql = "SELECT * FROM usuarios WHERE correo = %s AND contraseña = %s;"
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute(sql, (correo, contrasena))
    usuarios = cursor.fetchall()
    cursor.close()
    return usuarios
@app.route('/inicio1')
def inicio1():
    sql = "SELECT * FROM usuarios;"
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute(sql)
    usuarios = cursor.fetchall()
    cursor.close()
    return usuarios

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
