ROOT := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build
build:
	@cd ./alloy.rs && cargo build --release
	@cp ./alloy.rs/target/release/liballoy_rs.so ./lib
	go build -ldflags="-r $(ROOT)lib" main.go

.PHONY: build-static
build-static:
	@cd ./alloy.rs && cargo build --release
	@cp ./alloy.rs/target/release/liballoy_rs.a ./lib
	go build main.go

.PHONY: test-rust
test-rust:
	@cd ./alloy.rs && cargo test

.PHONY: clean-rust
clean-rust:
	@cd ./alloy.rs && cargo clean
