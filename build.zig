const std = @import("std");

const headers = [_][]const u8{
    // public
    "zconf.h",
    "zlib.h",

    // private
    "crc32.h",
    "deflate.h",
    "gzguts.h",
    "inffast.h",
    "inffixed.h",
    "inflate.h",
    "inftrees.h",
    "trees.h",
    "zutil.h",
};

const sources = [_][]const u8{
    "adler32.c",
    "compress.c",
    "crc32.c",
    "deflate.c",
    "gzclose.c",
    "gzlib.c",
    "gzread.c",
    "gzwrite.c",
    "infback.c",
    "inffast.c",
    "inflate.c",
    "inftrees.c",
    "trees.c",
    "uncompr.c",
    "zutil.c",
};

const defines = [_][]const u8{
    "-DZ_PREFIX=1",
    "-DHAVE_UNISTD_H",
    "-DHAVE_STDARG_H",
};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("zlib", .{});

    const lib = b.addLibrary(.{
        .name = "z",
        .linkage = .static,
        .root_module = b.createModule(.{
            .link_libc = true,
            .target = target,
            .optimize = optimize,
        }),
    });
    lib.installHeadersDirectory(upstream.path(""), "", .{
        .include_extensions = &headers,
    });
    lib.addCSourceFiles(.{
        .root = upstream.path(""),
        .files = &sources,
        .flags = &defines,
    });

    b.installArtifact(lib);
}
