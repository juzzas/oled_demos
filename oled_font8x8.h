/*
 * Copyright (c) 2021 Justin Skists.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/*
 * 8x8 font downloaded from: http://uzebox.org/wiki/index.php?title=Font_Bitmaps
 */
unsigned char oled_font8x8_bin[] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x52, 0xad, 0xa1,
  0xa1, 0xad, 0x52, 0x3c, 0x3c, 0x6e, 0xd3, 0xdf, 0xdf, 0xd3, 0x6e, 0x3c,
  0x06, 0x19, 0x23, 0x44, 0x23, 0x19, 0x06, 0x00, 0x08, 0x14, 0x22, 0x41,
  0x22, 0x14, 0x08, 0x00, 0x38, 0x38, 0x56, 0x7f, 0x56, 0x38, 0x38, 0x00,
  0x30, 0x3c, 0x5e, 0x7f, 0x5e, 0x3c, 0x30, 0x00, 0x00, 0x00, 0x00, 0x18,
  0x18, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xe7, 0xe7, 0xff, 0xff, 0xff,
  0x3c, 0x42, 0x81, 0x81, 0x81, 0x81, 0x42, 0x3c, 0xc3, 0xbd, 0x7e, 0x7e,
  0x7e, 0x7e, 0xbd, 0xc3, 0x30, 0x48, 0x48, 0x48, 0x35, 0x03, 0x00, 0x00,
  0x0c, 0x52, 0xf2, 0x52, 0x0c, 0x00, 0x00, 0x00, 0x60, 0x60, 0x3f, 0x02,
  0x0c, 0x00, 0x00, 0x00, 0x30, 0x30, 0x1f, 0x63, 0x63, 0x3e, 0x00, 0x00,
  0x08, 0x22, 0x1c, 0x55, 0x1c, 0x22, 0x08, 0x00, 0x00, 0x00, 0x08, 0xff,
  0x08, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08, 0x07, 0x08, 0x08, 0x08, 0x08,
  0x08, 0x08, 0x08, 0xf0, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0xf7,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf7, 0x08, 0x08, 0x08, 0x08,
  0x08, 0x08, 0x08, 0xf7, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0xff,
  0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
  0x00, 0x00, 0x00, 0xf0, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0xf0,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x08, 0x08, 0x08,
  0x08, 0x08, 0x08, 0x07, 0x00, 0x00, 0x00, 0x00, 0x81, 0x42, 0x24, 0x18,
  0x18, 0x24, 0x42, 0x81, 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01,
  0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x08, 0x08, 0x08, 0x1c,
  0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03,
  0x00, 0x00, 0x00, 0x00, 0x14, 0x3e, 0x14, 0x3e, 0x14, 0x00, 0x00, 0x00,
  0x04, 0x2a, 0x7f, 0x2a, 0x10, 0x00, 0x00, 0x00, 0x26, 0x16, 0x08, 0x34,
  0x32, 0x00, 0x00, 0x00, 0x1a, 0x25, 0x2d, 0x12, 0x18, 0x00, 0x00, 0x00,
  0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e, 0x21, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x1e, 0x00, 0x00, 0x00, 0x00,
  0x24, 0x18, 0x0e, 0x18, 0x24, 0x00, 0x00, 0x00, 0x08, 0x08, 0x3e, 0x08,
  0x08, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x08, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x20, 0x10, 0x08, 0x04, 0x02, 0x00, 0x00, 0x00,
  0x1e, 0x21, 0x2d, 0x21, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x22, 0x3f, 0x20,
  0x00, 0x00, 0x00, 0x00, 0x32, 0x29, 0x29, 0x29, 0x26, 0x00, 0x00, 0x00,
  0x11, 0x21, 0x25, 0x25, 0x1b, 0x00, 0x00, 0x00, 0x08, 0x0c, 0x0a, 0x3f,
  0x08, 0x00, 0x00, 0x00, 0x13, 0x25, 0x25, 0x25, 0x19, 0x00, 0x00, 0x00,
  0x18, 0x26, 0x25, 0x25, 0x18, 0x00, 0x00, 0x00, 0x03, 0x01, 0x39, 0x05,
  0x03, 0x00, 0x00, 0x00, 0x1a, 0x25, 0x25, 0x25, 0x1a, 0x00, 0x00, 0x00,
  0x06, 0x29, 0x29, 0x29, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x08, 0x14, 0x14, 0x22, 0x22, 0x00, 0x00, 0x00, 0x14, 0x14, 0x14, 0x14,
  0x14, 0x00, 0x00, 0x00, 0x22, 0x22, 0x14, 0x14, 0x08, 0x00, 0x00, 0x00,
  0x02, 0x01, 0x2d, 0x05, 0x02, 0x00, 0x00, 0x00, 0x3e, 0x41, 0x19, 0x25,
  0x3e, 0x00, 0x00, 0x00, 0x3e, 0x09, 0x09, 0x09, 0x3e, 0x00, 0x00, 0x00,
  0x3f, 0x25, 0x25, 0x2a, 0x10, 0x00, 0x00, 0x00, 0x1e, 0x21, 0x21, 0x21,
  0x12, 0x00, 0x00, 0x00, 0x21, 0x3f, 0x21, 0x21, 0x1e, 0x00, 0x00, 0x00,
  0x3f, 0x25, 0x25, 0x21, 0x21, 0x00, 0x00, 0x00, 0x3f, 0x09, 0x09, 0x01,
  0x01, 0x00, 0x00, 0x00, 0x1e, 0x21, 0x29, 0x29, 0x1a, 0x00, 0x00, 0x00,
  0x3f, 0x04, 0x04, 0x04, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x21, 0x3f, 0x21,
  0x00, 0x00, 0x00, 0x00, 0x10, 0x20, 0x21, 0x21, 0x1f, 0x00, 0x00, 0x00,
  0x3f, 0x08, 0x0c, 0x12, 0x21, 0x00, 0x00, 0x00, 0x3f, 0x20, 0x20, 0x20,
  0x20, 0x00, 0x00, 0x00, 0x3f, 0x01, 0x06, 0x01, 0x3f, 0x00, 0x00, 0x00,
  0x3f, 0x01, 0x06, 0x18, 0x3f, 0x00, 0x00, 0x00, 0x1e, 0x21, 0x21, 0x21,
  0x1e, 0x00, 0x00, 0x00, 0x3f, 0x09, 0x09, 0x09, 0x06, 0x00, 0x00, 0x00,
  0x1e, 0x21, 0x29, 0x11, 0x2e, 0x00, 0x00, 0x00, 0x3f, 0x09, 0x19, 0x29,
  0x26, 0x00, 0x00, 0x00, 0x22, 0x25, 0x25, 0x25, 0x18, 0x00, 0x00, 0x00,
  0x01, 0x01, 0x3f, 0x01, 0x01, 0x00, 0x00, 0x00, 0x1f, 0x20, 0x20, 0x20,
  0x3f, 0x00, 0x00, 0x00, 0x07, 0x18, 0x20, 0x18, 0x07, 0x00, 0x00, 0x00,
  0x3f, 0x20, 0x1c, 0x20, 0x3f, 0x00, 0x00, 0x00, 0x31, 0x0a, 0x04, 0x0a,
  0x31, 0x00, 0x00, 0x00, 0x03, 0x04, 0x3c, 0x04, 0x03, 0x00, 0x00, 0x00,
  0x31, 0x29, 0x25, 0x23, 0x21, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x21, 0x21,
  0x00, 0x00, 0x00, 0x00, 0x02, 0x04, 0x08, 0x10, 0x20, 0x00, 0x00, 0x00,
  0x00, 0x21, 0x21, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x02, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x40, 0x40, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x18, 0x24, 0x24, 0x14,
  0x3c, 0x00, 0x00, 0x00, 0x3f, 0x24, 0x24, 0x24, 0x18, 0x00, 0x00, 0x00,
  0x18, 0x24, 0x24, 0x24, 0x24, 0x00, 0x00, 0x00, 0x18, 0x24, 0x24, 0x24,
  0x3f, 0x00, 0x00, 0x00, 0x18, 0x34, 0x34, 0x2c, 0x28, 0x00, 0x00, 0x00,
  0x10, 0xfe, 0x11, 0x01, 0x02, 0x00, 0x00, 0x00, 0x18, 0xa4, 0xa4, 0xa4,
  0x7c, 0x00, 0x00, 0x00, 0x3f, 0x04, 0x04, 0x04, 0x38, 0x00, 0x00, 0x00,
  0x00, 0x24, 0x3d, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x84, 0x7d,
  0x00, 0x00, 0x00, 0x00, 0x3f, 0x10, 0x18, 0x24, 0x24, 0x00, 0x00, 0x00,
  0x01, 0x3f, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x04, 0x3c, 0x04,
  0x38, 0x00, 0x00, 0x00, 0x3c, 0x04, 0x04, 0x04, 0x38, 0x00, 0x00, 0x00,
  0x18, 0x24, 0x24, 0x24, 0x18, 0x00, 0x00, 0x00, 0xfc, 0x24, 0x24, 0x24,
  0x18, 0x00, 0x00, 0x00, 0x18, 0x24, 0x24, 0x24, 0xfc, 0x00, 0x00, 0x00,
  0x3c, 0x08, 0x04, 0x04, 0x04, 0x00, 0x00, 0x00, 0x28, 0x2c, 0x2c, 0x2c,
  0x14, 0x00, 0x00, 0x00, 0x04, 0x1f, 0x24, 0x24, 0x10, 0x00, 0x00, 0x00,
  0x1c, 0x20, 0x20, 0x20, 0x3c, 0x00, 0x00, 0x00, 0x0c, 0x10, 0x20, 0x10,
  0x0c, 0x00, 0x00, 0x00, 0x3c, 0x20, 0x18, 0x20, 0x3c, 0x00, 0x00, 0x00,
  0x24, 0x14, 0x18, 0x28, 0x24, 0x00, 0x00, 0x00, 0x1c, 0xa0, 0xa0, 0xa0,
  0x7c, 0x00, 0x00, 0x00, 0x24, 0x34, 0x2c, 0x2c, 0x24, 0x00, 0x00, 0x00,
  0x00, 0x08, 0x36, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x36, 0x08, 0x00, 0x00, 0x00, 0x00,
  0x02, 0x01, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x10, 0x1c, 0x12, 0x1c,
  0x10, 0x00, 0x00, 0x00, 0x1e, 0xa1, 0x61, 0x21, 0x12, 0x00, 0x00, 0x00,
  0x1c, 0x21, 0x20, 0x21, 0x3c, 0x00, 0x00, 0x00, 0x18, 0x34, 0x34, 0x2e,
  0x29, 0x00, 0x00, 0x00, 0x18, 0x26, 0x25, 0x16, 0x3c, 0x00, 0x00, 0x00,
  0x18, 0x25, 0x24, 0x15, 0x3c, 0x00, 0x00, 0x00, 0x18, 0x25, 0x26, 0x14,
  0x3c, 0x00, 0x00, 0x00, 0x18, 0x24, 0x25, 0x14, 0x3c, 0x00, 0x00, 0x00,
  0x18, 0xa4, 0x64, 0x24, 0x24, 0x00, 0x00, 0x00, 0x18, 0x36, 0x35, 0x2e,
  0x28, 0x00, 0x00, 0x00, 0x18, 0x35, 0x34, 0x2d, 0x28, 0x00, 0x00, 0x00,
  0x18, 0x35, 0x36, 0x2c, 0x28, 0x00, 0x00, 0x00, 0x00, 0x25, 0x3c, 0x21,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x3d, 0x22, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x25, 0x3e, 0x20, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x13, 0x12, 0x13,
  0x3c, 0x00, 0x00, 0x00, 0x3c, 0x12, 0x13, 0x12, 0x3c, 0x00, 0x00, 0x00,
  0x3e, 0x2a, 0x2a, 0x23, 0x23, 0x00, 0x00, 0x00, 0x34, 0x2c, 0x18, 0x34,
  0x28, 0x00, 0x00, 0x00, 0x3e, 0x09, 0x3f, 0x25, 0x21, 0x00, 0x00, 0x00,
  0x18, 0x26, 0x25, 0x26, 0x18, 0x00, 0x00, 0x00, 0x18, 0x25, 0x24, 0x25,
  0x18, 0x00, 0x00, 0x00, 0x18, 0x25, 0x26, 0x24, 0x18, 0x00, 0x00, 0x00,
  0x1c, 0x22, 0x21, 0x22, 0x3c, 0x00, 0x00, 0x00, 0x1c, 0x21, 0x22, 0x20,
  0x3c, 0x00, 0x00, 0x00, 0x1c, 0xa1, 0xa0, 0xa1, 0x7c, 0x00, 0x00, 0x00,
  0x1c, 0x23, 0x22, 0x23, 0x1c, 0x00, 0x00, 0x00, 0x1e, 0x21, 0x20, 0x21,
  0x1e, 0x00, 0x00, 0x00, 0x18, 0x24, 0xe7, 0x24, 0x24, 0x00, 0x00, 0x00,
  0x48, 0x3e, 0x49, 0x42, 0x20, 0x00, 0x00, 0x00, 0x0b, 0x2c, 0x78, 0x2c,
  0x0b, 0x00, 0x00, 0x00, 0xff, 0x22, 0x1c, 0x3e, 0x50, 0x00, 0x00, 0x00,
  0x14, 0x3e, 0x55, 0x55, 0x41, 0x00, 0x00, 0x00, 0x18, 0x24, 0x24, 0x16,
  0x3d, 0x00, 0x00, 0x00, 0x00, 0x24, 0x3e, 0x21, 0x00, 0x00, 0x00, 0x00,
  0x18, 0x24, 0x26, 0x25, 0x18, 0x00, 0x00, 0x00, 0x1c, 0x20, 0x22, 0x21,
  0x3c, 0x00, 0x00, 0x00, 0x3c, 0x06, 0x05, 0x06, 0x39, 0x00, 0x00, 0x00,
  0x3e, 0x02, 0x0d, 0x12, 0x3d, 0x00, 0x00, 0x00, 0x18, 0xa4, 0xa4, 0x94,
  0x3c, 0x00, 0x00, 0x00, 0x18, 0xa4, 0xa4, 0xa4, 0x18, 0x00, 0x00, 0x00,
  0x10, 0x28, 0x2d, 0x20, 0x10, 0x00, 0x00, 0x00, 0x18, 0x08, 0x08, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x20, 0x17, 0x48, 0x6c, 0x52, 0x00, 0x00, 0x00, 0x20, 0x17, 0x28, 0x34,
  0x7a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3d, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x10, 0x28, 0x00, 0x10, 0x28, 0x00, 0x00, 0x00, 0x28, 0x10, 0x00, 0x28,
  0x10, 0x00, 0x00, 0x00, 0x38, 0x16, 0x15, 0x16, 0x39, 0x00, 0x00, 0x00,
  0x18, 0x26, 0x25, 0x16, 0x3d, 0x00, 0x00, 0x00, 0x00, 0x26, 0x3d, 0x26,
  0x01, 0x00, 0x00, 0x00, 0x00, 0x26, 0x3d, 0x22, 0x01, 0x00, 0x00, 0x00,
  0x1c, 0x22, 0x23, 0x22, 0x1d, 0x00, 0x00, 0x00, 0x18, 0x26, 0x25, 0x26,
  0x19, 0x00, 0x00, 0x00, 0x1c, 0x22, 0x21, 0x22, 0x3d, 0x00, 0x00, 0x00,
  0x18, 0x22, 0x21, 0x22, 0x39, 0x00, 0x00, 0x00, 0x21, 0x3f, 0xa1, 0x81,
  0x7f, 0x01, 0x00, 0x00, 0x24, 0x3d, 0xa0, 0x84, 0x7d, 0x00, 0x00, 0x00,
  0x29, 0x1b, 0x2f, 0x34, 0x7a, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x01,
  0x02, 0x00, 0x00, 0x00, 0x08, 0x14, 0x22, 0x14, 0x08, 0x00, 0x00, 0x00,
  0x20, 0x16, 0x38, 0x04, 0x32, 0x00, 0x00, 0x00, 0x0e, 0x91, 0x7f, 0x01,
  0x7f, 0x81, 0x00, 0x00, 0x4a, 0x95, 0x95, 0x95, 0x68, 0x00, 0x00, 0x00,
  0xc0, 0xc0, 0xc0, 0xc0, 0xc0, 0xc0, 0xc0, 0xc0, 0x0f, 0x0f, 0x0f, 0x0f,
  0xf0, 0xf0, 0xf0, 0xf0, 0xfc, 0xfc, 0xfc, 0xfc, 0xfc, 0xfc, 0xfc, 0xfc,
  0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x00, 0x00, 0x18, 0x18,
  0x18, 0x18, 0x00, 0x00, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f,
  0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xf0, 0xf0, 0xf0,
  0x0f, 0x0f, 0x0f, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0xff, 0xff,
  0xff, 0xff, 0xff, 0xff, 0x88, 0x44, 0x22, 0x11, 0x88, 0x44, 0x22, 0x11,
  0x11, 0x22, 0x44, 0x88, 0x11, 0x22, 0x44, 0x88, 0x01, 0x03, 0x07, 0x0f,
  0x07, 0x03, 0x01, 0x00, 0x80, 0xc0, 0xe0, 0xf0, 0xe0, 0xc0, 0x80, 0x00,
  0x7f, 0x3e, 0x1c, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x08, 0x1c, 0x3e, 0x7f, 0x81, 0xc3, 0xe7, 0xff, 0xff, 0xe7, 0xc3, 0x81,
  0xff, 0x7e, 0x3c, 0x18, 0x18, 0x3c, 0x7e, 0xff, 0x0f, 0x0f, 0x0f, 0x0f,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xf0, 0xf0, 0xf0,
  0x00, 0x00, 0x00, 0x00, 0x0f, 0x0f, 0x0f, 0x0f, 0xf0, 0xf0, 0xf0, 0xf0,
  0x00, 0x00, 0x00, 0x00, 0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0x33, 0x33,
  0x00, 0x10, 0x1c, 0x12, 0x1c, 0x10, 0x00, 0x00, 0x00, 0x00, 0x14, 0x7f,
  0x14, 0x00, 0x00, 0x00, 0x18, 0x24, 0x10, 0x24, 0x18, 0x00, 0x00, 0x00,
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0, 0xf0, 0xf0, 0xf0,
  0xf0, 0xf0, 0xf0, 0xf0, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x0f, 0x0f, 0x0f, 0x0f,
  0x0f, 0x0f, 0x0f, 0x0f, 0x18, 0x24, 0x24, 0x18, 0x24, 0x00, 0x00, 0x00,
  0x7e, 0x25, 0x25, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x01, 0x01, 0x01,
  0x03, 0x00, 0x00, 0x00, 0x41, 0x3f, 0x01, 0x1f, 0x21, 0x00, 0x00, 0x00,
  0x31, 0x2b, 0x25, 0x21, 0x33, 0x00, 0x00, 0x00, 0x18, 0x24, 0x24, 0x2c,
  0x14, 0x00, 0x00, 0x00, 0xfc, 0x10, 0x20, 0x20, 0x1c, 0x00, 0x00, 0x00,
  0x00, 0x6c, 0x90, 0x6c, 0x00, 0x00, 0x00, 0x00, 0x18, 0xa5, 0xff, 0xa5,
  0x18, 0x00, 0x00, 0x00, 0x1e, 0x25, 0x25, 0x25, 0x1e, 0x00, 0x00, 0x00,
  0x2e, 0x31, 0x01, 0x31, 0x2e, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x25, 0x25,
  0x18, 0x00, 0x00, 0x00, 0x18, 0x24, 0x18, 0x24, 0x18, 0x00, 0x00, 0x00,
  0x18, 0x64, 0x3c, 0x26, 0x18, 0x00, 0x00, 0x00, 0x1c, 0x2a, 0x2a, 0x22,
  0x00, 0x00, 0x00, 0x00, 0x3e, 0x01, 0x01, 0x01, 0x3e, 0x00, 0x00, 0x00,
  0x2a, 0x2a, 0x2a, 0x2a, 0x2a, 0x00, 0x00, 0x00, 0x48, 0x48, 0x7e, 0x48,
  0x48, 0x00, 0x00, 0x00, 0x62, 0x62, 0x54, 0x54, 0x48, 0x00, 0x00, 0x00,
  0x48, 0x54, 0x54, 0x62, 0x62, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x02,
  0x02, 0x00, 0x00, 0x00, 0x40, 0x40, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x08, 0x08, 0x2a, 0x08, 0x08, 0x00, 0x00, 0x00, 0x24, 0x12, 0x36, 0x24,
  0x12, 0x00, 0x00, 0x00, 0x00, 0x0c, 0x12, 0x12, 0x0c, 0x00, 0x00, 0x00,
  0x00, 0x0c, 0x1e, 0x1e, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x10,
  0x00, 0x00, 0x00, 0x00, 0x08, 0x10, 0x20, 0x7f, 0x01, 0x01, 0x00, 0x00,
  0x07, 0x01, 0x01, 0x06, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0d, 0x0d, 0x0a,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x7e, 0x7e, 0x00, 0x00, 0x00, 0x00,
  0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa
};
unsigned int oled_font8x8_bin_len = 2048;
