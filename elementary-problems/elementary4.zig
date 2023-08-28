// Problem 4, Write a program that asks the user for a number n and prints
// the sum of the numbers 1 to n.
const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn();
    var buf = std.io.bufferedReader(in.reader());

    var r = buf.reader();

    std.debug.print("Pick a number between 1 and 2147483657: ", .{});
    // Setting undefined to set later fills data with 0XAA bytes for
    // debugging.
    var msg_buf: [16]u8 = undefined;

    // TODO: Need to update into streamUntilDelimiter per source
    var msg = try r.readUntilDelimiterOrEof(&msg_buf, '\n');
    if (msg) |m| {
        const userInt = try std.fmt.parseInt(u32, m, 10);
        var total: u64 = 0;

        for (1..(userInt + 1)) |n| {
            total = total + n;
        }

        std.debug.print("{}\n", .{total});
    }
}
