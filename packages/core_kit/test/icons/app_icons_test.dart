// SPDX-FileCopyrightText: 2025 hexaTune LLC
// SPDX-License-Identifier: MIT

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_kit/core_kit.dart';

void main() {
  group('AppIcons - unit checks', () {
    test('All AppIcons constants are non-null IconData', () {
      final icons = <IconData>[
        AppIcons.home,
        AppIcons.search,
        AppIcons.menu,
        AppIcons.back,
        AppIcons.close,
        AppIcons.navigateNext,
        AppIcons.navigateBefore,
        AppIcons.arrowForward,
        AppIcons.arrowBack,
        AppIcons.refresh,
        AppIcons.moreVert,
        AppIcons.moreHoriz,

        AppIcons.add,
        AppIcons.edit,
        AppIcons.delete,
        AppIcons.share,
        AppIcons.favorite,
        AppIcons.favorited,
        AppIcons.download,
        AppIcons.upload,
        AppIcons.save,
        AppIcons.copy,
        AppIcons.cut,
        AppIcons.paste,
        AppIcons.undo,
        AppIcons.redo,
        AppIcons.print,
        AppIcons.attach,
        AppIcons.link,
        AppIcons.send,

        AppIcons.check,
        AppIcons.error,
        AppIcons.warning,
        AppIcons.info,
        AppIcons.help,
        AppIcons.verified,
        AppIcons.pending,
        AppIcons.blocked,
        AppIcons.success,

        AppIcons.image,
        AppIcons.video,
        AppIcons.audio,
        AppIcons.document,
        AppIcons.folder,
        AppIcons.attachment,
        AppIcons.code,
        AppIcons.text,
        AppIcons.file,
        AppIcons.camera,
        AppIcons.photo,

        AppIcons.email,
        AppIcons.chat,
        AppIcons.call,
        AppIcons.notifications,
        AppIcons.inbox,
        AppIcons.archive,
        AppIcons.markAsRead,
        AppIcons.unread,

        AppIcons.expandMore,
        AppIcons.expandLess,
        AppIcons.filter,
        AppIcons.sort,
        AppIcons.viewList,
        AppIcons.viewGrid,
        AppIcons.settings,
        AppIcons.visibility,
        AppIcons.visibilityOff,
        AppIcons.tune,
      ];

      for (final icon in icons) {
        expect(icon, isNotNull);
        expect(icon, isA<IconData>());
      }
    });
  });

  group('AppIcons - widget rendering', () {
    testWidgets('Icons render without exceptions and are findable', (
      WidgetTester tester,
    ) async {
      final icons = [
        AppIcons.home,
        AppIcons.add,
        AppIcons.check,
        AppIcons.image,
        AppIcons.email,
        AppIcons.settings,
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(children: icons.map((i) => Icon(i)).toList()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      for (final icon in icons) {
        expect(find.byIcon(icon), findsOneWidget);
      }
    });
  });
}
