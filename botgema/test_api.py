import requests
import urllib3
from config import API_KEY

# Desactiva advertencias SSL
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def probar_conexion():
    # URL básica de fixtures
    url = f"https://api.isportsapi.com/v1/football/fixtures?api_key={API_KEY}"
    
    print(f"--- DIAGNÓSTICO DE API ---")
    print(f"URL: {url}")
    
    try:
        response = requests.get(url, timeout=15, verify=False)
        print(f"Código de estado: {response.status_code}")
        
        if response.status_code == 200:
            print("¡Conexión exitosa! Los datos recibidos son:")
            # Imprime los primeros 500 caracteres de la respuesta
            print(response.text[:500])
        else:
            print("Error: El servidor no respondió con éxito.")
            print(response.text) # Aquí veremos exactamente qué dice la API
            
    except Exception as e:
        print(f"Error técnico al conectar: {e}")

if __name__ == "__main__":
    probar_conexion()