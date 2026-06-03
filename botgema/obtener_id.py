import asyncio
from telegram import Bot
from config import TELEGRAM_TOKEN

async def obtener_id():
    bot = Bot(token=TELEGRAM_TOKEN)
    updates = await bot.get_updates()
    if updates:
        for update in updates:
            print(f"ID del chat encontrado: {update.message.chat.id}")
    else:
        print("No se encontraron actualizaciones. Envía un mensaje a tu bot en Telegram y vuelve a ejecutar este script.")

asyncio.run(obtener_id())