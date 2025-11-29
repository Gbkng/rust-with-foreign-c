use std::process::Command;

fn main() {
    println!("cargo::rerun-if-changed=foreign-c/src/lib.c");
    Command::new("zig")
        .args([
            "build",
            // NOTE: important option. Otherwise, 'cc' does not recognize
            // sanitize lib introduced by zig.
            "-Doptimize=ReleaseSafe",
        ])
        .current_dir("foreign-c")
        .status()
        .unwrap();
    println!("cargo::rustc-link-lib=foreign_c");
    println!("cargo::rustc-link-search=./foreign-c/zig-out/lib");
}
