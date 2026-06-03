import time
import requests
from config import TELEGRAM_TOKEN, CHAT_ID
from bot_engine import obtener_partidos_livescores

def enviar_mensaje_telegram(mensaje):
    url = f"https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendMessage"
    payload = {"chat_id": CHAT_ID, "text": mensaje}
    try:
        requests.post(url, data=payload, timeout=10)
    except Exception as e:
        print(f"Error Telegram: {e}")

def main():
    print("✅ Daedalus Bot iniciado.")
    enviar_mensaje_telegram("🚀 Daedalus Bot conectado y monitoreando.")
    
    while True:
        partidos = obtener_partidos_livescores()
        print(f"[{time.strftime('%H:%M:%S')}] Escaneo: {len(partidos)} partidos en vivo.")
        
        for p in partidos:
            home = p.get('teams', {}).get('home', {}).get('name', 'N/A')
            away = p.get('teams', {}).get('away', {}).get('name', 'N/A')
            enviar_mensaje_telegram(f"⚽ En vivo: {home} vs {away}")
            
        time.sleep(60)

if __name__ == "__main__":
    main()