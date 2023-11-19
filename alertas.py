import pandas as pd
import pymysql

DB_NAME = "compras"
DB_USERNAME = "LeonSKennedy"
DB_PASSWORD = "Chocapic3312"
DB_HOST = "127.0.0.1"
DB_PORT = 3306
DB_CHARSET = "utf8"

def get_conn():
    conn = pymysql.connect(
        db=DB_NAME,
        user=DB_USERNAME,
        passwd=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
        charset=DB_CHARSET
    )
    return conn

def extract_and_save_to_xlsx():
    # Establece la conexión a la base de datos
    conn = get_conn()

    # Crea un DataFrame de pandas con los datos de la tabla contrato_fecha
    query = """
    SELECT
        G.*,
        C.*,
        CF.*
    FROM
        gestor AS G
    INNER JOIN compras AS CO ON G.Gestor = CO.Gestor
    INNER JOIN contratos AS C ON CO.ID_categoria = C.ID_categoria
    INNER JOIN contrato_fecha AS CF ON C.ID_fecha_contrato = CF.ID_fecha_contrato;
    """
    df = pd.read_sql_query(query, conn)

    # Guarda los datos en un archivo XLSX
    df.to_excel("contrato_fecha.xlsx", index=False)
    # Para Guardar el archivo XLSX en una carpeta específica en el escritorio
    # df.to_excel("C:/Users/TuUsuario/Escritorio/MiCarpeta/contrato_fecha.xlsx", index=False)

    # Cierra la conexión a la base de datos
    conn.close()

    print("Los datos se han exportado a contrato_fecha.xlsx")

# Llama a la función para extraer y guardar los datos en un archivo XLSX
extract_and_save_to_xlsx()
