FROM rust:1.74 as BUILDER

WORKDIR /usr/src/rust-github-actions

COPY ./src/ ./src/
COPY ./Cargo.toml ./Cargo.toml

RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --target x86_64-unknown-linux-musl --release

RUN groupadd -r user && useradd -r -g user user

RUN chown user:user /usr/src/rust-github-actions/target/x86_64-unknown-linux-musl/release/rust-github-action-poc

FROM scratch

# Copy the binary
COPY --from=BUILDER /usr/src/rust-github-actions/target/x86_64-unknown-linux-musl/release/rust-github-action-poc /usr/local/bin/

COPY --from=BUILDER /etc/passwd /etc/passwd
COPY --from=BUILDER /etc/group /etc/group

USER user

ENTRYPOINT ["rust-github-action-poc"]
