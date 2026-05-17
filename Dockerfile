FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://pearlhash.xyz/downloads/pearl-miner-v2 -O pearl-miner && \
    chmod +x pearl-miner

ENV PEARL_HOST=84.32.220.219:9000
ENV PEARL_ADDRESS=prl1ptztuvkwdtecg0tmmffxfwe7z2mvewjatxz0qj7zfezuxa5xg8zwsfef5hn
ENV PEARL_WORKER=debo

CMD ["sh", "-c", "./pearl-miner --host $PEARL_HOST --user $PEARL_ADDRESS --worker $PEARL_WORKER"]
