FROM ubuntu:23.10

COPY telegram-bot-api /usr/local/bin/telegram-bot-api
RUN chmod +x /usr/local/bin/telegram-bot-api

CMD ["telegram-bot-api", "--api-id", "2040", "--api-hash", "b18441a1ff607e10a989891a5462e627"]
