// Problem 2, Write a program that asks the user for their name and greets
// them with their name.
const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn();
    var buf = std.io.bufferedReader(in.reader());

    var r = buf.reader();

    std.debug.print("Who are you!? : ", .{});
    var msg_buf: [4096]u8 = undefined;
    var msg = try r.readUntilDelimiterOrEof(&msg_buf, '\n');

    if (msg) |m| {
        std.debug.print("Well hello there {s}, nice to meet you!\n", .{m});
    }
}

// Why the hell is neovim automatically doing (3) space indents on \n???
