const std = @import("std");

const zlib = @cImport({
    @cInclude("zlib.h");
});

// Just a smoke test to make sure the library is linked correctly.
test {
    try std.testing.expect(std.mem.eql(u8, zlib.ZLIB_VERSION, "1.3.1"));
}
