FROM ubuntu:22.04

# Install any dependencies if your binary needs them

# Copy the binary from your home dir into the container
COPY telegram-bot-api /usr/local/bin/telegram-bot-api

# Make sure it’s executable
RUN chmod +x /usr/local/bin/telegram-bot-api

# Run it with your arguments
CMD ["telegram-bot-api", "--api-id", "2040", "--api-hash", "b18441a1ff607e10a989891a5462e627"]
