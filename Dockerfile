FROM rust as builder
WORKDIR /app
ADD . /app
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/zero_to_prod_in_rust /
CMD ["./zero_to_prod_in_rust"]
