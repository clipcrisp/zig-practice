// Prob. 1, Hello World

const std = @import("std");

pub fn main() !void {
    std.debug.print("Hello, world!\n", .{});
}
