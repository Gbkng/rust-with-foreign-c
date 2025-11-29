# Description

A minimal working example of embedding C in a Rust project, through FFI.

# How to build

```sh
cargo build
```

# How to run

The entry point is `src/bin/main.rs`. To build and execute this entrypoint:

```sh
cargo run
```

The execution of `main.rs` outputs to the standard output the result of the
execution of the `foo` function, which is a wrapper around a C function,
through FFI.

# Dependencies

Requires `zig >= 0.14.0` to be available in path.
