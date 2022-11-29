FROM rust as builder
WORKDIR /app
ADD . /app
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/zero2prod /
CMD ["./zero2prod"]
