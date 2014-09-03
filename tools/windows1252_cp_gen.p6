
my @orig = (
0x0000,0x0001,0x0002,0x0003,0x0004,0x0005,0x0006,0x0007,
0x0008,0x0009,0x000A,0x000B,0x000C,0x000D,0x000E,0x000F,
0x0010,0x0011,0x0012,0x0013,0x0014,0x0015,0x0016,0x0017,
0x0018,0x0019,0x001A,0x001B,0x001C,0x001D,0x001E,0x001F,
0x0020,0x0021,0x0022,0x0023,0x0024,0x0025,0x0026,0x0027,
0x0028,0x0029,0x002A,0x002B,0x002C,0x002D,0x002E,0x002F,
0x0030,0x0031,0x0032,0x0033,0x0034,0x0035,0x0036,0x0037,
0x0038,0x0039,0x003A,0x003B,0x003C,0x003D,0x003E,0x003F,
0x0040,0x0041,0x0042,0x0043,0x0044,0x0045,0x0046,0x0047,
0x0048,0x0049,0x004A,0x004B,0x004C,0x004D,0x004E,0x004F,
0x0050,0x0051,0x0052,0x0053,0x0054,0x0055,0x0056,0x0057,
0x0058,0x0059,0x005A,0x005B,0x005C,0x005D,0x005E,0x005F,
0x0060,0x0061,0x0062,0x0063,0x0064,0x0065,0x0066,0x0067,
0x0068,0x0069,0x006A,0x006B,0x006C,0x006D,0x006E,0x006F,
0x0070,0x0071,0x0072,0x0073,0x0074,0x0075,0x0076,0x0077,
0x0078,0x0079,0x007A,0x007B,0x007C,0x007D,0x007E,0x007F,
0x20AC,0x0081,0x201A,0x0192,0x201E,0x2026,0x2020,0x2021,
0x02C6,0x2030,0x0160,0x2039,0x0152,0x008D,0x017D,0x008F,
0x0090,0x2018,0x2019,0x201C,0x201D,0x2022,0x2013,0x2014,
0x02DC,0x2122,0x0161,0x203A,0x0153,0x009D,0x017E,0x0178,
0x00A0,0x00A1,0x00A2,0x00A3,0x00A4,0x00A5,0x00A6,0x00A7,
0x00A8,0x00A9,0x00AA,0x00AB,0x00AC,0x00AD,0x00AE,0x00AF,
0x00B0,0x00B1,0x00B2,0x00B3,0x00B4,0x00B5,0x00B6,0x00B7,
0x00B8,0x00B9,0x00BA,0x00BB,0x00BC,0x00BD,0x00BE,0x00BF,
0x00C0,0x00C1,0x00C2,0x00C3,0x00C4,0x00C5,0x00C6,0x00C7,
0x00C8,0x00C9,0x00CA,0x00CB,0x00CC,0x00CD,0x00CE,0x00CF,
0x00D0,0x00D1,0x00D2,0x00D3,0x00D4,0x00D5,0x00D6,0x00D7,
0x00D8,0x00D9,0x00DA,0x00DB,0x00DC,0x00DD,0x00DE,0x00DF,
0x00E0,0x00E1,0x00E2,0x00E3,0x00E4,0x00E5,0x00E6,0x00E7,
0x00E8,0x00E9,0x00EA,0x00EB,0x00EC,0x00ED,0x00EE,0x00EF,
0x00F0,0x00F1,0x00F2,0x00F3,0x00F4,0x00F5,0x00F6,0x00F7,
0x00F8,0x00F9,0x00FA,0x00FB,0x00FC,0x00FD,0x00FE,0x00FF);

my $fh = open("src/strings/windows1252.c", :w);

$fh.say('#include "moar.h"');
$fh.say('
#define WINDOWS1252_CHAR_TO_CP(character) codepoints[character];

static const MVMuint16 codepoints[] = {
    0x0000,0x0001,0x0002,0x0003,0x0004,0x0005,0x0006,0x0007,
    0x0008,0x0009,0x000A,0x000B,0x000C,0x000D,0x000E,0x000F,
    0x0010,0x0011,0x0012,0x0013,0x0014,0x0015,0x0016,0x0017,
    0x0018,0x0019,0x001A,0x001B,0x001C,0x001D,0x001E,0x001F,
    0x0020,0x0021,0x0022,0x0023,0x0024,0x0025,0x0026,0x0027,
    0x0028,0x0029,0x002A,0x002B,0x002C,0x002D,0x002E,0x002F,
    0x0030,0x0031,0x0032,0x0033,0x0034,0x0035,0x0036,0x0037,
    0x0038,0x0039,0x003A,0x003B,0x003C,0x003D,0x003E,0x003F,
    0x0040,0x0041,0x0042,0x0043,0x0044,0x0045,0x0046,0x0047,
    0x0048,0x0049,0x004A,0x004B,0x004C,0x004D,0x004E,0x004F,
    0x0050,0x0051,0x0052,0x0053,0x0054,0x0055,0x0056,0x0057,
    0x0058,0x0059,0x005A,0x005B,0x005C,0x005D,0x005E,0x005F,
    0x0060,0x0061,0x0062,0x0063,0x0064,0x0065,0x0066,0x0067,
    0x0068,0x0069,0x006A,0x006B,0x006C,0x006D,0x006E,0x006F,
    0x0070,0x0071,0x0072,0x0073,0x0074,0x0075,0x0076,0x0077,
    0x0078,0x0079,0x007A,0x007B,0x007C,0x007D,0x007E,0x007F,
    0x20AC,0x0081,0x201A,0x0192,0x201E,0x2026,0x2020,0x2021,
    0x02C6,0x2030,0x0160,0x2039,0x0152,0x008D,0x017D,0x008F,
    0x0090,0x2018,0x2019,0x201C,0x201D,0x2022,0x2013,0x2014,
    0x02DC,0x2122,0x0161,0x203A,0x0153,0x009D,0x017E,0x0178,
    0x00A0,0x00A1,0x00A2,0x00A3,0x00A4,0x00A5,0x00A6,0x00A7,
    0x00A8,0x00A9,0x00AA,0x00AB,0x00AC,0x00AD,0x00AE,0x00AF,
    0x00B0,0x00B1,0x00B2,0x00B3,0x00B4,0x00B5,0x00B6,0x00B7,
    0x00B8,0x00B9,0x00BA,0x00BB,0x00BC,0x00BD,0x00BE,0x00BF,
    0x00C0,0x00C1,0x00C2,0x00C3,0x00C4,0x00C5,0x00C6,0x00C7,
    0x00C8,0x00C9,0x00CA,0x00CB,0x00CC,0x00CD,0x00CE,0x00CF,
    0x00D0,0x00D1,0x00D2,0x00D3,0x00D4,0x00D5,0x00D6,0x00D7,
    0x00D8,0x00D9,0x00DA,0x00DB,0x00DC,0x00DD,0x00DE,0x00DF,
    0x00E0,0x00E1,0x00E2,0x00E3,0x00E4,0x00E5,0x00E6,0x00E7,
    0x00E8,0x00E9,0x00EA,0x00EB,0x00EC,0x00ED,0x00EE,0x00EF,
    0x00F0,0x00F1,0x00F2,0x00F3,0x00F4,0x00F5,0x00F6,0x00F7,
    0x00F8,0x00F9,0x00FA,0x00FB,0x00FC,0x00FD,0x00FE,0x00FF
};

static MVMuint8 windows1252_cp_to_char(MVMint32 codepoint) {');

my @entries = ();
push @entries, [@orig[$_], $_] for 128..151;
@entries = @entries.sort({ $^a[0] <=> $^b[0] });

sub gen_binary_search($start, $end, $depth) {
    my $indent = "    " x $depth;
    if $start == $end {
        return "{$indent}if (codepoint == @entries[$start][0]) \{ return @entries[$start][1]; }\n";
    }
    elsif $start + 1 == $end {
        return "{$indent}if (codepoint == @entries[$start][0]) \{ return @entries[$start][1]; }\n"
        ~ "{$indent}if (codepoint == @entries[$end][0]) \{ return @entries[$end][1]; }\n";
    }
    else {
        my $mid = ($end - $start) div 2 + $start;
        return "{$indent}if (codepoint <= @entries[$mid][0]) \{\n"
        ~ gen_binary_search($start, $mid, $depth + 1)
        ~ "$indent}\n"
        ~ "{$indent}else \{\n"
        ~ gen_binary_search($mid + 1, $end, $depth + 1)
        ~ "$indent}\n";
    }
}
$fh.say(gen_binary_search(0, +@entries - 1, 1));
$fh.say('    return \'?\';');

$fh.say('
}

/* Decodes the specified number of bytes of windows1252 into an NFG string,
 * creating a result of the specified type. The type must have the MVMString
 * REPR. */
MVMString * MVM_string_windows1252_decode(MVMThreadContext *tc,
        MVMObject *result_type, MVMuint8 *windows1252, size_t bytes) {
    MVMString *result = (MVMString *)REPR(result_type)->allocate(tc, STABLE(result_type));
    size_t i;

    result->body.codes  = bytes;
    result->body.graphs = bytes;

    result->body.int32s = MVM_malloc(sizeof(MVMint32) * bytes);
    for (i = 0; i < bytes; i++)
        result->body.int32s[i] = WINDOWS1252_CHAR_TO_CP(windows1252[i]);
    result->body.flags = MVM_STRING_TYPE_INT32;

    return result;
}

/* Encodes the specified substring to Windows-1252. Anything outside of Windows-1252 range
 * will become a ?. The result string is NULL terminated, but the specified
 * size is the non-null part. */
MVMuint8 * MVM_string_windows1252_encode_substr(MVMThreadContext *tc, MVMString *str, MVMuint64 *output_size, MVMint64 start, MVMint64 length) {
    /* Windows-1252 is a single byte encoding, so each grapheme will just become
     * a single byte. */
    MVMuint32 startu = (MVMuint32)start;
    MVMStringIndex strgraphs = NUM_GRAPHS(str);
    MVMuint32 lengthu = (MVMuint32)(length == -1 ? strgraphs - startu : length);
    MVMuint8 *result;
    size_t i;

    /* must check start first since it\'s used in the length check */
    if (start < 0 || start > strgraphs)
        MVM_exception_throw_adhoc(tc, "start out of range");
    if (length < 0 || start + length > strgraphs)
        MVM_exception_throw_adhoc(tc, "length out of range");

    result = MVM_malloc(length + 1);
    for (i = 0; i < length; i++) {
        MVMint32 codepoint = MVM_string_get_codepoint_at_nocheck(tc, str, start + i);
        if ((codepoint >= 0 && codepoint < 128) || (codepoint >= 152 && codepoint < 256)) {
            result[i] = (MVMuint8)codepoint;
        }
        else if (codepoint > 8364 || codepoint < 0) {
            result[i] = \'?\';
        }
        else {
            result[i] = windows1252_cp_to_char(codepoint);
        }
    }
    result[i] = 0;
    if (output_size)
        *output_size = length;
    return result;
}

');
$fh.close;
