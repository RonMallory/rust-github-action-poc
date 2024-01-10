FROM rust:1.74 as BUILDER

WORKDIR /usr/src/rust-github-actions
COPY . .

RUN cargo install --path .

RUN cargo build --release

FROM scratch

COPY --from=BUILDER /usr/src/rust-github-actions/target/release/rust-github-action-poc .

CMD ["rust-github-action"]