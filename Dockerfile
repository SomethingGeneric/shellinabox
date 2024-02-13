FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install -y git libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf build-essential make bash wget

COPY . .

RUN ./build.sh

RUN useradd -m proxyman
RUN echo "proxyman:proxyman" | chpasswd
RUN chsh -s /bin/bash proxyman

RUN wget https://github.com/quantumsheep/sshs/releases/download/3.4.0/sshs-linux-amd64
RUN chmod +x sshs-linux-amd64
RUN mv sshs-linux-amd64 /usr/bin/sshs

CMD ["./shellinaboxd", "-v"]