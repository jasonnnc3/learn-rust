FROM rust:1.60.0
WORKDIR /app
RUN apt update && apt install lld clang -y
COPY . .
ENV SQLX_OFFLINE true
RUN cargo build --release
ENV APP_ENVIRONMENT production
EXPOSE 8000
ENTRYPOINT ["./target/release/zero2prod"]
