// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Test the errors that can be thrown by WASI.
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wasm/wasm.dart';

import 'test_shared.dart';

void main() {
  test('wasi error', () {
    // Empty wasm module.
    var emptyModuleData = Uint8List.fromList([
      0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x06, 0x81, 0x00, 0x00, //
    ]);

    // Failed to fill WASI imports (the empty module was not built with WASI).
    expect(
      () => WasmModule(emptyModuleData).builder().enableWasi(),
      throwsWasmError(startsWith('Failed to fill WASI imports.')),
    );

    // Hello world module generated by emscripten+WASI. Exports a function like
    // `void _start()`, and prints using `int fd_write(int, int, int, int)`.
    var helloWorldData = Uint8List.fromList([
      0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x33, 0x09, 0x60, //
      0x03, 0x7f, 0x7f, 0x7f, 0x01, 0x7f, 0x60, 0x04, 0x7f, 0x7f, 0x7f, 0x7f,
      0x01, 0x7f, 0x60, 0x00, 0x00, 0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f, 0x60,
      0x01, 0x7f, 0x01, 0x7f, 0x60, 0x03, 0x7f, 0x7e, 0x7f, 0x01, 0x7e, 0x60,
      0x00, 0x01, 0x7f, 0x60, 0x01, 0x7f, 0x00, 0x60, 0x03, 0x7f, 0x7f, 0x7f,
      0x00, 0x02, 0x1a, 0x01, 0x0d, 0x77, 0x61, 0x73, 0x69, 0x5f, 0x75, 0x6e,
      0x73, 0x74, 0x61, 0x62, 0x6c, 0x65, 0x08, 0x66, 0x64, 0x5f, 0x77, 0x72,
      0x69, 0x74, 0x65, 0x00, 0x01, 0x03, 0x0f, 0x0e, 0x03, 0x04, 0x00, 0x03,
      0x02, 0x07, 0x05, 0x04, 0x03, 0x06, 0x02, 0x02, 0x08, 0x00, 0x04, 0x05,
      0x01, 0x70, 0x01, 0x04, 0x04, 0x05, 0x06, 0x01, 0x01, 0x80, 0x02, 0x80,
      0x02, 0x06, 0x09, 0x01, 0x7f, 0x01, 0x41, 0xc0, 0x95, 0xc0, 0x02, 0x0b,
      0x07, 0x2e, 0x04, 0x06, 0x6d, 0x65, 0x6d, 0x6f, 0x72, 0x79, 0x02, 0x00,
      0x11, 0x5f, 0x5f, 0x77, 0x61, 0x73, 0x6d, 0x5f, 0x63, 0x61, 0x6c, 0x6c,
      0x5f, 0x63, 0x74, 0x6f, 0x72, 0x73, 0x00, 0x05, 0x04, 0x6d, 0x61, 0x69,
      0x6e, 0x00, 0x04, 0x06, 0x5f, 0x73, 0x74, 0x61, 0x72, 0x74, 0x00, 0x0b,
      0x09, 0x09, 0x01, 0x00, 0x41, 0x01, 0x0b, 0x03, 0x08, 0x0e, 0x07, 0x0a,
      0xae, 0x0c, 0x0e, 0xbf, 0x01, 0x01, 0x05, 0x7f, 0x41, 0x80, 0x08, 0x21,
      0x04, 0x02, 0x40, 0x20, 0x01, 0x28, 0x02, 0x10, 0x22, 0x02, 0x04, 0x7f,
      0x20, 0x02, 0x05, 0x20, 0x01, 0x10, 0x02, 0x0d, 0x01, 0x20, 0x01, 0x28,
      0x02, 0x10, 0x0b, 0x20, 0x01, 0x28, 0x02, 0x14, 0x22, 0x05, 0x6b, 0x20,
      0x00, 0x49, 0x04, 0x40, 0x20, 0x01, 0x41, 0x80, 0x08, 0x20, 0x00, 0x20,
      0x01, 0x28, 0x02, 0x24, 0x11, 0x00, 0x00, 0x0f, 0x0b, 0x02, 0x40, 0x20,
      0x01, 0x2c, 0x00, 0x4b, 0x41, 0x00, 0x48, 0x0d, 0x00, 0x20, 0x00, 0x21,
      0x03, 0x03, 0x40, 0x20, 0x03, 0x22, 0x02, 0x45, 0x0d, 0x01, 0x20, 0x02,
      0x41, 0x7f, 0x6a, 0x22, 0x03, 0x41, 0x80, 0x08, 0x6a, 0x2d, 0x00, 0x00,
      0x41, 0x0a, 0x47, 0x0d, 0x00, 0x0b, 0x20, 0x01, 0x41, 0x80, 0x08, 0x20,
      0x02, 0x20, 0x01, 0x28, 0x02, 0x24, 0x11, 0x00, 0x00, 0x22, 0x03, 0x20,
      0x02, 0x49, 0x0d, 0x01, 0x20, 0x00, 0x20, 0x02, 0x6b, 0x21, 0x00, 0x20,
      0x02, 0x41, 0x80, 0x08, 0x6a, 0x21, 0x04, 0x20, 0x01, 0x28, 0x02, 0x14,
      0x21, 0x05, 0x20, 0x02, 0x21, 0x06, 0x0b, 0x20, 0x05, 0x20, 0x04, 0x20,
      0x00, 0x10, 0x03, 0x1a, 0x20, 0x01, 0x20, 0x01, 0x28, 0x02, 0x14, 0x20,
      0x00, 0x6a, 0x36, 0x02, 0x14, 0x20, 0x00, 0x20, 0x06, 0x6a, 0x21, 0x03,
      0x0b, 0x20, 0x03, 0x0b, 0x59, 0x01, 0x01, 0x7f, 0x20, 0x00, 0x20, 0x00,
      0x2d, 0x00, 0x4a, 0x22, 0x01, 0x41, 0x7f, 0x6a, 0x20, 0x01, 0x72, 0x3a,
      0x00, 0x4a, 0x20, 0x00, 0x28, 0x02, 0x00, 0x22, 0x01, 0x41, 0x08, 0x71,
      0x04, 0x40, 0x20, 0x00, 0x20, 0x01, 0x41, 0x20, 0x72, 0x36, 0x02, 0x00,
      0x41, 0x7f, 0x0f, 0x0b, 0x20, 0x00, 0x42, 0x00, 0x37, 0x02, 0x04, 0x20,
      0x00, 0x20, 0x00, 0x28, 0x02, 0x2c, 0x22, 0x01, 0x36, 0x02, 0x1c, 0x20,
      0x00, 0x20, 0x01, 0x36, 0x02, 0x14, 0x20, 0x00, 0x20, 0x01, 0x20, 0x00,
      0x28, 0x02, 0x30, 0x6a, 0x36, 0x02, 0x10, 0x41, 0x00, 0x0b, 0x82, 0x04,
      0x01, 0x03, 0x7f, 0x20, 0x02, 0x41, 0x80, 0xc0, 0x00, 0x4f, 0x04, 0x40,
      0x20, 0x00, 0x20, 0x01, 0x20, 0x02, 0x10, 0x0d, 0x20, 0x00, 0x0f, 0x0b,
      0x20, 0x00, 0x20, 0x02, 0x6a, 0x21, 0x03, 0x02, 0x40, 0x20, 0x00, 0x20,
      0x01, 0x73, 0x41, 0x03, 0x71, 0x45, 0x04, 0x40, 0x02, 0x40, 0x20, 0x02,
      0x41, 0x01, 0x48, 0x04, 0x40, 0x20, 0x00, 0x21, 0x02, 0x0c, 0x01, 0x0b,
      0x20, 0x00, 0x41, 0x03, 0x71, 0x45, 0x04, 0x40, 0x20, 0x00, 0x21, 0x02,
      0x0c, 0x01, 0x0b, 0x20, 0x00, 0x21, 0x02, 0x03, 0x40, 0x20, 0x02, 0x20,
      0x01, 0x2d, 0x00, 0x00, 0x3a, 0x00, 0x00, 0x20, 0x01, 0x41, 0x01, 0x6a,
      0x21, 0x01, 0x20, 0x02, 0x41, 0x01, 0x6a, 0x22, 0x02, 0x20, 0x03, 0x4f,
      0x0d, 0x01, 0x20, 0x02, 0x41, 0x03, 0x71, 0x0d, 0x00, 0x0b, 0x0b, 0x02,
      0x40, 0x20, 0x03, 0x41, 0x7c, 0x71, 0x22, 0x04, 0x41, 0xc0, 0x00, 0x49,
      0x0d, 0x00, 0x20, 0x02, 0x20, 0x04, 0x41, 0x40, 0x6a, 0x22, 0x05, 0x4b,
      0x0d, 0x00, 0x03, 0x40, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x00, 0x36,
      0x02, 0x00, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x04, 0x36, 0x02, 0x04,
      0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x08, 0x36, 0x02, 0x08, 0x20, 0x02,
      0x20, 0x01, 0x28, 0x02, 0x0c, 0x36, 0x02, 0x0c, 0x20, 0x02, 0x20, 0x01,
      0x28, 0x02, 0x10, 0x36, 0x02, 0x10, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02,
      0x14, 0x36, 0x02, 0x14, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x18, 0x36,
      0x02, 0x18, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x1c, 0x36, 0x02, 0x1c,
      0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x20, 0x36, 0x02, 0x20, 0x20, 0x02,
      0x20, 0x01, 0x28, 0x02, 0x24, 0x36, 0x02, 0x24, 0x20, 0x02, 0x20, 0x01,
      0x28, 0x02, 0x28, 0x36, 0x02, 0x28, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02,
      0x2c, 0x36, 0x02, 0x2c, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x30, 0x36,
      0x02, 0x30, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x34, 0x36, 0x02, 0x34,
      0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x38, 0x36, 0x02, 0x38, 0x20, 0x02,
      0x20, 0x01, 0x28, 0x02, 0x3c, 0x36, 0x02, 0x3c, 0x20, 0x01, 0x41, 0x40,
      0x6b, 0x21, 0x01, 0x20, 0x02, 0x41, 0x40, 0x6b, 0x22, 0x02, 0x20, 0x05,
      0x4d, 0x0d, 0x00, 0x0b, 0x0b, 0x20, 0x02, 0x20, 0x04, 0x4f, 0x0d, 0x01,
      0x03, 0x40, 0x20, 0x02, 0x20, 0x01, 0x28, 0x02, 0x00, 0x36, 0x02, 0x00,
      0x20, 0x01, 0x41, 0x04, 0x6a, 0x21, 0x01, 0x20, 0x02, 0x41, 0x04, 0x6a,
      0x22, 0x02, 0x20, 0x04, 0x49, 0x0d, 0x00, 0x0b, 0x0c, 0x01, 0x0b, 0x20,
      0x03, 0x41, 0x04, 0x49, 0x04, 0x40, 0x20, 0x00, 0x21, 0x02, 0x0c, 0x01,
      0x0b, 0x20, 0x03, 0x41, 0x7c, 0x6a, 0x22, 0x04, 0x20, 0x00, 0x49, 0x04,
      0x40, 0x20, 0x00, 0x21, 0x02, 0x0c, 0x01, 0x0b, 0x20, 0x00, 0x21, 0x02,
      0x03, 0x40, 0x20, 0x02, 0x20, 0x01, 0x2d, 0x00, 0x00, 0x3a, 0x00, 0x00,
      0x20, 0x02, 0x20, 0x01, 0x2d, 0x00, 0x01, 0x3a, 0x00, 0x01, 0x20, 0x02,
      0x20, 0x01, 0x2d, 0x00, 0x02, 0x3a, 0x00, 0x02, 0x20, 0x02, 0x20, 0x01,
      0x2d, 0x00, 0x03, 0x3a, 0x00, 0x03, 0x20, 0x01, 0x41, 0x04, 0x6a, 0x21,
      0x01, 0x20, 0x02, 0x41, 0x04, 0x6a, 0x22, 0x02, 0x20, 0x04, 0x4d, 0x0d,
      0x00, 0x0b, 0x0b, 0x20, 0x02, 0x20, 0x03, 0x49, 0x04, 0x40, 0x03, 0x40,
      0x20, 0x02, 0x20, 0x01, 0x2d, 0x00, 0x00, 0x3a, 0x00, 0x00, 0x20, 0x01,
      0x41, 0x01, 0x6a, 0x21, 0x01, 0x20, 0x02, 0x41, 0x01, 0x6a, 0x22, 0x02,
      0x20, 0x03, 0x47, 0x0d, 0x00, 0x0b, 0x0b, 0x20, 0x00, 0x0b, 0x06, 0x00,
      0x10, 0x0c, 0x41, 0x00, 0x0b, 0x03, 0x00, 0x01, 0x0b, 0x7e, 0x01, 0x03,
      0x7f, 0x23, 0x00, 0x41, 0x10, 0x6b, 0x22, 0x01, 0x24, 0x00, 0x20, 0x01,
      0x41, 0x0a, 0x3a, 0x00, 0x0f, 0x02, 0x40, 0x20, 0x00, 0x28, 0x02, 0x10,
      0x22, 0x02, 0x45, 0x04, 0x40, 0x20, 0x00, 0x10, 0x02, 0x0d, 0x01, 0x20,
      0x00, 0x28, 0x02, 0x10, 0x21, 0x02, 0x0b, 0x02, 0x40, 0x20, 0x00, 0x28,
      0x02, 0x14, 0x22, 0x03, 0x20, 0x02, 0x4f, 0x0d, 0x00, 0x20, 0x00, 0x2c,
      0x00, 0x4b, 0x41, 0x0a, 0x46, 0x0d, 0x00, 0x20, 0x00, 0x20, 0x03, 0x41,
      0x01, 0x6a, 0x36, 0x02, 0x14, 0x20, 0x03, 0x41, 0x0a, 0x3a, 0x00, 0x00,
      0x0c, 0x01, 0x0b, 0x20, 0x00, 0x20, 0x01, 0x41, 0x0f, 0x6a, 0x41, 0x01,
      0x20, 0x00, 0x28, 0x02, 0x24, 0x11, 0x00, 0x00, 0x41, 0x01, 0x47, 0x0d,
      0x00, 0x20, 0x01, 0x2d, 0x00, 0x0f, 0x1a, 0x0b, 0x20, 0x01, 0x41, 0x10,
      0x6a, 0x24, 0x00, 0x0b, 0x04, 0x00, 0x42, 0x00, 0x0b, 0x04, 0x00, 0x41,
      0x00, 0x0b, 0x31, 0x01, 0x01, 0x7f, 0x20, 0x00, 0x21, 0x02, 0x20, 0x02,
      0x02, 0x7f, 0x20, 0x01, 0x28, 0x02, 0x4c, 0x41, 0x7f, 0x4c, 0x04, 0x40,
      0x20, 0x02, 0x20, 0x01, 0x10, 0x01, 0x0c, 0x01, 0x0b, 0x20, 0x02, 0x20,
      0x01, 0x10, 0x01, 0x0b, 0x22, 0x01, 0x46, 0x04, 0x40, 0x20, 0x00, 0x0f,
      0x0b, 0x20, 0x01, 0x0b, 0x62, 0x01, 0x03, 0x7f, 0x41, 0x80, 0x08, 0x21,
      0x00, 0x03, 0x40, 0x20, 0x00, 0x22, 0x01, 0x41, 0x04, 0x6a, 0x21, 0x00,
      0x20, 0x01, 0x28, 0x02, 0x00, 0x22, 0x02, 0x41, 0x7f, 0x73, 0x20, 0x02,
      0x41, 0xff, 0xfd, 0xfb, 0x77, 0x6a, 0x71, 0x41, 0x80, 0x81, 0x82, 0x84,
      0x78, 0x71, 0x45, 0x0d, 0x00, 0x0b, 0x02, 0x40, 0x20, 0x02, 0x41, 0xff,
      0x01, 0x71, 0x45, 0x04, 0x40, 0x20, 0x01, 0x21, 0x00, 0x0c, 0x01, 0x0b,
      0x03, 0x40, 0x20, 0x01, 0x2d, 0x00, 0x01, 0x21, 0x02, 0x20, 0x01, 0x41,
      0x01, 0x6a, 0x22, 0x00, 0x21, 0x01, 0x20, 0x02, 0x0d, 0x00, 0x0b, 0x0b,
      0x20, 0x00, 0x41, 0x80, 0x08, 0x6b, 0x0b, 0x0c, 0x00, 0x02, 0x7f, 0x41,
      0x00, 0x41, 0x00, 0x10, 0x04, 0x0b, 0x1a, 0x0b, 0x66, 0x01, 0x02, 0x7f,
      0x41, 0x90, 0x08, 0x28, 0x02, 0x00, 0x22, 0x00, 0x28, 0x02, 0x4c, 0x41,
      0x00, 0x4e, 0x04, 0x7f, 0x41, 0x01, 0x05, 0x20, 0x01, 0x0b, 0x1a, 0x02,
      0x40, 0x41, 0x7f, 0x41, 0x00, 0x10, 0x0a, 0x22, 0x01, 0x20, 0x01, 0x20,
      0x00, 0x10, 0x09, 0x47, 0x1b, 0x41, 0x00, 0x48, 0x0d, 0x00, 0x02, 0x40,
      0x20, 0x00, 0x2d, 0x00, 0x4b, 0x41, 0x0a, 0x46, 0x0d, 0x00, 0x20, 0x00,
      0x28, 0x02, 0x14, 0x22, 0x01, 0x20, 0x00, 0x28, 0x02, 0x10, 0x4f, 0x0d,
      0x00, 0x20, 0x00, 0x20, 0x01, 0x41, 0x01, 0x6a, 0x36, 0x02, 0x14, 0x20,
      0x01, 0x41, 0x0a, 0x3a, 0x00, 0x00, 0x0c, 0x01, 0x0b, 0x20, 0x00, 0x10,
      0x06, 0x0b, 0x0b, 0x3d, 0x01, 0x01, 0x7f, 0x20, 0x02, 0x04, 0x40, 0x03,
      0x40, 0x20, 0x00, 0x20, 0x01, 0x20, 0x02, 0x41, 0x80, 0xc0, 0x00, 0x20,
      0x02, 0x41, 0x80, 0xc0, 0x00, 0x49, 0x1b, 0x22, 0x03, 0x10, 0x03, 0x21,
      0x00, 0x20, 0x01, 0x41, 0x80, 0x40, 0x6b, 0x21, 0x01, 0x20, 0x00, 0x41,
      0x80, 0x40, 0x6b, 0x21, 0x00, 0x20, 0x02, 0x20, 0x03, 0x6b, 0x22, 0x02,
      0x0d, 0x00, 0x0b, 0x0b, 0x0b, 0xb1, 0x02, 0x01, 0x06, 0x7f, 0x23, 0x00,
      0x41, 0x20, 0x6b, 0x22, 0x03, 0x24, 0x00, 0x20, 0x03, 0x20, 0x00, 0x28,
      0x02, 0x1c, 0x22, 0x04, 0x36, 0x02, 0x10, 0x20, 0x00, 0x28, 0x02, 0x14,
      0x21, 0x05, 0x20, 0x03, 0x20, 0x02, 0x36, 0x02, 0x1c, 0x20, 0x03, 0x20,
      0x01, 0x36, 0x02, 0x18, 0x20, 0x03, 0x20, 0x05, 0x20, 0x04, 0x6b, 0x22,
      0x01, 0x36, 0x02, 0x14, 0x20, 0x01, 0x20, 0x02, 0x6a, 0x21, 0x06, 0x41,
      0x02, 0x21, 0x05, 0x20, 0x03, 0x41, 0x10, 0x6a, 0x21, 0x01, 0x03, 0x40,
      0x02, 0x40, 0x02, 0x7f, 0x20, 0x06, 0x02, 0x7f, 0x20, 0x00, 0x28, 0x02,
      0x3c, 0x20, 0x01, 0x20, 0x05, 0x20, 0x03, 0x41, 0x0c, 0x6a, 0x10, 0x00,
      0x04, 0x40, 0x20, 0x03, 0x41, 0x7f, 0x36, 0x02, 0x0c, 0x41, 0x7f, 0x0c,
      0x01, 0x0b, 0x20, 0x03, 0x28, 0x02, 0x0c, 0x0b, 0x22, 0x04, 0x46, 0x04,
      0x40, 0x20, 0x00, 0x20, 0x00, 0x28, 0x02, 0x2c, 0x22, 0x01, 0x36, 0x02,
      0x1c, 0x20, 0x00, 0x20, 0x01, 0x36, 0x02, 0x14, 0x20, 0x00, 0x20, 0x01,
      0x20, 0x00, 0x28, 0x02, 0x30, 0x6a, 0x36, 0x02, 0x10, 0x20, 0x02, 0x0c,
      0x01, 0x0b, 0x20, 0x04, 0x41, 0x7f, 0x4a, 0x0d, 0x01, 0x20, 0x00, 0x41,
      0x00, 0x36, 0x02, 0x1c, 0x20, 0x00, 0x42, 0x00, 0x37, 0x03, 0x10, 0x20,
      0x00, 0x20, 0x00, 0x28, 0x02, 0x00, 0x41, 0x20, 0x72, 0x36, 0x02, 0x00,
      0x41, 0x00, 0x20, 0x05, 0x41, 0x02, 0x46, 0x0d, 0x00, 0x1a, 0x20, 0x02,
      0x20, 0x01, 0x28, 0x02, 0x04, 0x6b, 0x0b, 0x21, 0x04, 0x20, 0x03, 0x41,
      0x20, 0x6a, 0x24, 0x00, 0x20, 0x04, 0x0f, 0x0b, 0x20, 0x01, 0x41, 0x08,
      0x6a, 0x20, 0x01, 0x20, 0x04, 0x20, 0x01, 0x28, 0x02, 0x04, 0x22, 0x07,
      0x4b, 0x22, 0x08, 0x1b, 0x22, 0x01, 0x20, 0x04, 0x20, 0x07, 0x41, 0x00,
      0x20, 0x08, 0x1b, 0x6b, 0x22, 0x07, 0x20, 0x01, 0x28, 0x02, 0x00, 0x6a,
      0x36, 0x02, 0x00, 0x20, 0x01, 0x20, 0x01, 0x28, 0x02, 0x04, 0x20, 0x07,
      0x6b, 0x36, 0x02, 0x04, 0x20, 0x06, 0x20, 0x04, 0x6b, 0x21, 0x06, 0x20,
      0x05, 0x20, 0x08, 0x6b, 0x21, 0x05, 0x0c, 0x00, 0x00, 0x0b, 0x00, 0x0b,
      0x0b, 0x4d, 0x06, 0x00, 0x41, 0x80, 0x08, 0x0b, 0x12, 0x68, 0x65, 0x6c,
      0x6c, 0x6f, 0x2c, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21, 0x00, 0x00,
      0x00, 0x18, 0x04, 0x00, 0x41, 0x98, 0x08, 0x0b, 0x01, 0x05, 0x00, 0x41,
      0xa4, 0x08, 0x0b, 0x01, 0x01, 0x00, 0x41, 0xbc, 0x08, 0x0b, 0x0e, 0x02,
      0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xb8, 0x04, 0x00, 0x00, 0x00,
      0x04, 0x00, 0x41, 0xd4, 0x08, 0x0b, 0x01, 0x01, 0x00, 0x41, 0xe3, 0x08,
      0x0b, 0x05, 0x0a, 0xff, 0xff, 0xff, 0xff,
    ]);

    // Trying to import WASI twice.
    expect(
      () => WasmModule(helloWorldData).builder()..enableWasi()..enableWasi(),
      throwsWasmError(startsWith('WASI is already enabled')),
    );

    // Missing imports due to not enabling WASI.
    expect(
      () => WasmModule(helloWorldData).builder().build(),
      throwsWasmError(startsWith('Missing import: ')),
    );

    // Trying to get stdout/stderr without WASI enabled (WASI function import has
    // been manually filled).
    var inst = (WasmModule(helloWorldData).builder()
          ..addFunction(
            'wasi_unstable',
            'fd_write',
            (int fd, int iovs, int iovsLen, int unused) => 0,
          ))
        .build();
    expect(
      () => inst.stdout,
      throwsWasmError("Can't capture stdout without WASI enabled."),
    );
    expect(
      () => inst.stderr,
      throwsWasmError("Can't capture stderr without WASI enabled."),
    );
  });
}
