// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/services/correction/dart/abstract_producer.dart';
import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:analyzer_plugin/utilities/range_factory.dart';

class RemoveUnusedLabel extends ResolvedCorrectionProducer {
  @override
  CorrectionApplicability get applicability =>
      // Not predictably the correct action.
      CorrectionApplicability.singleLocation;

  @override
  FixKind get fixKind => DartFixKind.REMOVE_UNUSED_LABEL;

  @override
  Future<void> compute(ChangeBuilder builder) async {
    if (node is Label) {
      var nextToken = node.endToken.next!;
      await builder.addDartFileEdit(file, (builder) {
        builder.addDeletion(range.startStart(node, nextToken));
      });
    }
  }
}
