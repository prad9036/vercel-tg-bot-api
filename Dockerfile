FROM debian:bookworm-slim

# Install dependencies for GLIBC build
RUN apt-get update && apt-get install -y wget build-essential

# Build GLIBC 2.38
RUN wget http://ftp.gnu.org/gnu/libc/glibc-2.38.tar.gz && \
    tar -xzf glibc-2.38.tar.gz && \
    mkdir /glibc-build && cd /glibc-build && \
    ../glibc-2.38/configure --prefix=/opt/glibc-2.38 && make -j$(nproc) && make install

# Update library path
ENV LD_LIBRARY_PATH=/opt/glibc-2.38/lib:$LD_LIBRARY_PATH

# Install OpenSSL runtime
RUN apt-get install -y libssl3 ca-certificates

# Copy binary
COPY telegram-bot-api /usr/local/bin/telegram-bot-api
RUN chmod +x /usr/local/bin/telegram-bot-api

CMD ["telegram-bot-api", "--api-id", "2040", "--api-hash", "b18441a1ff607e10a989891a5462e627"]
