const std = @import("std");
const builtin = @import("builtin");

comptime {
    const required = std.SemanticVersion{
        .major = 0,
        .minor = 14,
        .patch = 0,
    };
    const current = builtin.zig_version;
    if (current.order(required) == .lt) {
        const error_message =
            \\Your version of zig is too old ({d}.{d}.{d}).
            \\This project requires at least Zig {d}.{d}.{d}.
            \\You can download a compatible build from: https://ziglang.org/download/
        ;
        @compileError(std.fmt.comptimePrint(error_message, .{
            current.major,
            current.minor,
            current.patch,
            required.major,
            required.minor,
            required.patch,
        }));
    }
}

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const cc_flags = &.{
        "-std=c23",
        "-Wall",
        "-Wextra",
        "-Werror",
    };

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "foreign_c",
        .root_module = b.createModule(.{
            .root_source_file = null,
            .target = target,
            .optimize = optimize,
        }),
    });
    lib.addCSourceFiles(.{
        .files = &.{
            "src/lib.c",
        },
        .flags = cc_flags,
    });
    b.installArtifact(lib);
}
