# [zlib](https://zlib.net/)@v1.3.1

Library implementing the deflate compression method found in gzip and PKZIP.

## Usage

Install library:

```sh
zig fetch --save https://github.com/zig-devel/zlib/archive/refs/tags/1.3.1.tar.gz
```

Statically link with `mod` module:

```zig
const zlib = b.dependency("zlib", .{
    .target = target,
    .optimize = optimize,
});

mod.linkLibrary(zlib.artifact("z"));
```

## License

All code in this repo is dual-licensed under [0BSD](./LICENSE-0BSD) OR [Zlib](./LICENSE-Zlib).
