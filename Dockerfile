FROM ubuntu:23.10

# Install OpenSSL runtime libraries and any other dependencies
RUN apt-get update && \
    apt-get install -y libssl3 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy your binary
COPY telegram-bot-api /usr/local/bin/telegram-bot-api
RUN chmod +x /usr/local/bin/telegram-bot-api

# Set default command
CMD ["telegram-bot-api", "--api-id", "2040", "--api-hash", "b18441a1ff607e10a989891a5462e627"]
