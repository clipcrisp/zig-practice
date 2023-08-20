// Problem 3, Modify the previous program such that only the users Alice and
// Bob are greeted with their names.
const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn();
    var buf = std.io.bufferedReader(in.reader());

    var r = buf.reader();

    std.debug.print("Who are you!? : ", .{});
    // Setting undefined to set later fills data with 0XAA bytes for
    // debugging.
    var msg_buf: [4096]u8 = undefined;

    // TODO: Need to update into streamUntilDelimiter per source
    var msg = try r.readUntilDelimiterOrEof(&msg_buf, '\n');
    if (msg) |m| {
        // Alice or Bob
        if (std.mem.eql(u8, m, "Alice")) {
            std.debug.print("Well hello there {s}, nice to meet you!\n", .{m});
        }
        // std.debug.print("Type: {s}", .{@typeInfo(m)});
    }
}
