# Yengil Alpine Linux bazasi
FROM alpine:latest

# Kerakli kutubxonalarni o‘rnatamiz
RUN apk add --no-cache curl unzip bash libstdc++

# Ishchi katalogni yaratamiz
WORKDIR /bedrock

# Bedrock serverni yuklab olamiz va ochamiz
RUN curl -L -o bedrock-server.zip https://github.com/spnqbai/bedrock_server1.17.41.01/releases/download/bedrock_server/bedrock-server-1.17.41.01.zip && \
    unzip bedrock-server.zip && rm bedrock-server.zip && \
    chmod +x bedrock_server


# `server.properties` sozlash
RUN echo "online-mode=false" >> server.properties

# OP huquqlari saqlanadigan papkani yaratamiz
VOLUME [ "/bedrock/worlds" ]
VOLUME [ "/bedrock/permissions.json" ]

# `start.sh` skriptini qo‘shamiz
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Portni ochamiz
EXPOSE 19132/udp

# Bedrock serverni `start.sh` orqali ishga tushiramiz
CMD ["sh", "/start.sh"]
