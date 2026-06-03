import requests
from config import API_KEY

def obtener_partidos_livescores():
    url = "https://v3.football.api-sports.io/fixtures"
    querystring = {"live": "all"}
    headers = {
        'x-apisports-key': API_KEY,
        'x-rapidapi-host': 'v3.football.api-sports.io'
    }
    
    try:
        response = requests.get(url, headers=headers, params=querystring, timeout=15)
        response.raise_for_status()
        return response.json().get('response', [])
    except Exception as e:
        print(f"Error: {e}")
        return []