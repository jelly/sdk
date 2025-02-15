// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/line_info.dart';
import 'package:analyzer/src/dart/analysis/file_state.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:analyzer/src/ignore_comments/ignore_info.dart';

/// Information about a file being analyzed.
class UnitAnalysis {
  final FileState file;
  final RecordingErrorListener errorListener;
  final ErrorReporter errorReporter;
  final CompilationUnitImpl unit;
  final LineInfo lineInfo;
  final IgnoreInfo ignoreInfo;

  late final CompilationUnitElementImpl element;

  UnitAnalysis({
    required this.file,
    required this.errorListener,
    required this.errorReporter,
    required this.unit,
    required this.lineInfo,
    required this.ignoreInfo,
  });
}
