// SPDX-FileCopyrightText: 2025 hexaTune LLC
// SPDX-License-Identifier: MIT

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:core_kit/core_kit.dart';

/// Interactive Playground - Explore AppIcons with full customization
@widgetbook.UseCase(name: 'Interactive Playground', type: AppIcons)
Widget appIconsPlayground(BuildContext context) {
  // Category selector
  final category = context.knobs.list(
    label: 'Icon Category',
    options: const [
      'Navigation',
      'Actions',
      'Status',
      'Content',
      'Communication',
      'UI Controls',
    ],
  );

  // Icon selector based on category
  final iconName = _getIconsForCategory(category, context);

  // Size selector - using AppSpacing system
  final sizeOptions = const [
    ('xs', AppSpacing.xs),
    ('sm', AppSpacing.sm),
    ('md', AppSpacing.md),
    ('lg', AppSpacing.lg),
    ('xl', AppSpacing.xl),
    ('xxl', AppSpacing.xxl),
  ];

  final selectedSizeLabel = context.knobs.object.dropdown(
    label: 'Icon Size',
    options: sizeOptions.map((e) => e.$1).toList(),
    labelBuilder: (value) => value,
  );

  final size = sizeOptions.firstWhere((e) => e.$1 == selectedSizeLabel).$2;

  // Color selector
  final useCustomColor = context.knobs.boolean(
    label: 'Use Custom Color',
    initialValue: false,
  );

  final customColor = context.knobs.colorOrNull(
    label: 'Custom Color',
    initialValue: Colors.blue,
  );

  // Get the IconData based on selection
  final icon = _getIconData(iconName);

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: size, color: useCustomColor ? customColor : null),
        SizedBox(height: AppSpacing.md),
        Text(iconName, style: Theme.of(context).textTheme.bodyMedium),
        Text('${size.toInt()}dp', style: Theme.of(context).textTheme.bodySmall),
      ],
    ),
  );
}

/// Navigation Icons - Common navigation and wayfinding icons
@widgetbook.UseCase(name: 'Navigation Icons', type: AppIcons)
Widget navigationIcons(BuildContext context) {
  final icons = [
    ('home', AppIcons.home),
    ('search', AppIcons.search),
    ('menu', AppIcons.menu),
    ('back', AppIcons.back),
    ('close', AppIcons.close),
    ('navigateNext', AppIcons.navigateNext),
    ('navigateBefore', AppIcons.navigateBefore),
    ('arrowForward', AppIcons.arrowForward),
    ('arrowBack', AppIcons.arrowBack),
    ('refresh', AppIcons.refresh),
    ('moreVert', AppIcons.moreVert),
    ('moreHoriz', AppIcons.moreHoriz),
  ];

  return _buildIconGrid(context, icons, 'Navigation Icons');
}

/// Action Icons - User actions and commands
@widgetbook.UseCase(name: 'Action Icons', type: AppIcons)
Widget actionIcons(BuildContext context) {
  final icons = [
    ('add', AppIcons.add),
    ('edit', AppIcons.edit),
    ('delete', AppIcons.delete),
    ('share', AppIcons.share),
    ('favorite', AppIcons.favorite),
    ('favorited', AppIcons.favorited),
    ('download', AppIcons.download),
    ('upload', AppIcons.upload),
    ('save', AppIcons.save),
    ('copy', AppIcons.copy),
    ('cut', AppIcons.cut),
    ('paste', AppIcons.paste),
    ('undo', AppIcons.undo),
    ('redo', AppIcons.redo),
    ('print', AppIcons.print),
    ('attach', AppIcons.attach),
    ('link', AppIcons.link),
    ('send', AppIcons.send),
  ];

  return _buildIconGrid(context, icons, 'Action Icons');
}

/// Status Icons - Status indicators with semantic colors
@widgetbook.UseCase(name: 'Status Icons', type: AppIcons)
Widget statusIcons(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return Padding(
    padding: AppSpacing.edgeInsetsAllMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status Icons', style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: AppSpacing.md),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildStatusIconCard(
                context,
                'check',
                AppIcons.check,
                colorScheme.primary,
              ),
              _buildStatusIconCard(
                context,
                'success',
                AppIcons.success,
                Colors.green,
              ),
              _buildStatusIconCard(
                context,
                'error',
                AppIcons.error,
                colorScheme.error,
              ),
              _buildStatusIconCard(
                context,
                'warning',
                AppIcons.warning,
                Colors.orange,
              ),
              _buildStatusIconCard(context, 'info', AppIcons.info, Colors.blue),
              _buildStatusIconCard(
                context,
                'help',
                AppIcons.help,
                colorScheme.secondary,
              ),
              _buildStatusIconCard(
                context,
                'verified',
                AppIcons.verified,
                Colors.blue,
              ),
              _buildStatusIconCard(
                context,
                'pending',
                AppIcons.pending,
                Colors.amber,
              ),
              _buildStatusIconCard(
                context,
                'blocked',
                AppIcons.blocked,
                colorScheme.error,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Content Icons - Content types and media
@widgetbook.UseCase(name: 'Content Icons', type: AppIcons)
Widget contentIcons(BuildContext context) {
  final icons = [
    ('image', AppIcons.image),
    ('video', AppIcons.video),
    ('audio', AppIcons.audio),
    ('document', AppIcons.document),
    ('folder', AppIcons.folder),
    ('attachment', AppIcons.attachment),
    ('code', AppIcons.code),
    ('text', AppIcons.text),
    ('file', AppIcons.file),
    ('camera', AppIcons.camera),
    ('photo', AppIcons.photo),
  ];

  return _buildIconGrid(context, icons, 'Content Icons');
}

/// Communication Icons - Communication and messaging
@widgetbook.UseCase(name: 'Communication Icons', type: AppIcons)
Widget communicationIcons(BuildContext context) {
  final icons = [
    ('email', AppIcons.email),
    ('chat', AppIcons.chat),
    ('call', AppIcons.call),
    ('notifications', AppIcons.notifications),
    ('inbox', AppIcons.inbox),
    ('archive', AppIcons.archive),
    ('markAsRead', AppIcons.markAsRead),
    ('unread', AppIcons.unread),
  ];

  return _buildIconGrid(context, icons, 'Communication Icons');
}

/// UI Control Icons - Interface controls and toggles
@widgetbook.UseCase(name: 'UI Control Icons', type: AppIcons)
Widget uiControlIcons(BuildContext context) {
  final icons = [
    ('expandMore', AppIcons.expandMore),
    ('expandLess', AppIcons.expandLess),
    ('filter', AppIcons.filter),
    ('sort', AppIcons.sort),
    ('viewList', AppIcons.viewList),
    ('viewGrid', AppIcons.viewGrid),
    ('settings', AppIcons.settings),
    ('visibility', AppIcons.visibility),
    ('visibilityOff', AppIcons.visibilityOff),
    ('tune', AppIcons.tune),
  ];

  return _buildIconGrid(context, icons, 'UI Control Icons');
}

/// Icon Sizes Reference - Demonstrates proper Material Design 3 icon sizing
@widgetbook.UseCase(name: 'Icon Sizes Reference', type: AppIcons)
Widget iconSizesReference(BuildContext context) {
  final sizes = const [
    ('xs', AppSpacing.xs),
    ('sm', AppSpacing.sm),
    ('md', AppSpacing.md),
    ('lg', AppSpacing.lg),
    ('xl', AppSpacing.xl),
    ('xxl', AppSpacing.xxl),
  ];

  return Padding(
    padding: AppSpacing.edgeInsetsAllMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Material Design 3 Icon Sizes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Same icon (AppIcons.home) at different sizes',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: AppSpacing.lg),
        Expanded(
          child: ListView.separated(
            itemCount: sizes.length,
            separatorBuilder: (context, index) => const Divider(height: 32),
            itemBuilder: (context, index) {
              final (label, size) = sizes[index];
              return Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'AppSpacing.$label',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${size.toInt()}dp',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Icon(AppIcons.home, size: size),
                  SizedBox(width: AppSpacing.md),
                  Text(
                    'AppIcons.home',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

Widget _buildIconGrid(
  BuildContext context,
  List<(String, IconData)> icons,
  String title,
) {
  return Padding(
    padding: AppSpacing.edgeInsetsAllMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: AppSpacing.md),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: icons.length,
            itemBuilder: (context, index) {
              final (name, icon) = icons[index];
              return _buildIconCard(context, name, icon);
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildIconCard(BuildContext context, String name, IconData icon) {
  return Card(
    child: Padding(
      padding: AppSpacing.edgeInsetsAllSm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          SizedBox(height: AppSpacing.sm),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatusIconCard(
  BuildContext context,
  String name,
  IconData icon,
  Color color,
) {
  return Card(
    child: Padding(
      padding: AppSpacing.edgeInsetsAllSm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 8),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    ),
  );
}

String _getIconsForCategory(String category, BuildContext context) {
  final options = switch (category) {
    'Navigation' => const [
      'home',
      'search',
      'menu',
      'back',
      'close',
      'navigateNext',
      'navigateBefore',
      'arrowForward',
      'arrowBack',
      'refresh',
      'moreVert',
      'moreHoriz',
    ],
    'Actions' => const [
      'add',
      'edit',
      'delete',
      'share',
      'favorite',
      'favorited',
      'download',
      'upload',
      'save',
      'copy',
      'cut',
      'paste',
      'undo',
      'redo',
      'print',
      'attach',
      'link',
      'send',
    ],
    'Status' => const [
      'check',
      'error',
      'warning',
      'info',
      'help',
      'verified',
      'pending',
      'blocked',
      'success',
    ],
    'Content' => const [
      'image',
      'video',
      'audio',
      'document',
      'folder',
      'attachment',
      'code',
      'text',
      'file',
      'camera',
      'photo',
    ],
    'Communication' => const [
      'email',
      'chat',
      'call',
      'notifications',
      'inbox',
      'archive',
      'markAsRead',
      'unread',
    ],
    'UI Controls' => const [
      'expandMore',
      'expandLess',
      'filter',
      'sort',
      'viewList',
      'viewGrid',
      'settings',
      'visibility',
      'visibilityOff',
      'tune',
    ],
    _ => const ['home'],
  };

  return context.knobs.list(label: 'Icon', options: options);
}

IconData _getIconData(String name) {
  return switch (name) {
    // Navigation
    'home' => AppIcons.home,
    'search' => AppIcons.search,
    'menu' => AppIcons.menu,
    'back' => AppIcons.back,
    'close' => AppIcons.close,
    'navigateNext' => AppIcons.navigateNext,
    'navigateBefore' => AppIcons.navigateBefore,
    'arrowForward' => AppIcons.arrowForward,
    'arrowBack' => AppIcons.arrowBack,
    'refresh' => AppIcons.refresh,
    'moreVert' => AppIcons.moreVert,
    'moreHoriz' => AppIcons.moreHoriz,
    // Actions
    'add' => AppIcons.add,
    'edit' => AppIcons.edit,
    'delete' => AppIcons.delete,
    'share' => AppIcons.share,
    'favorite' => AppIcons.favorite,
    'favorited' => AppIcons.favorited,
    'download' => AppIcons.download,
    'upload' => AppIcons.upload,
    'save' => AppIcons.save,
    'copy' => AppIcons.copy,
    'cut' => AppIcons.cut,
    'paste' => AppIcons.paste,
    'undo' => AppIcons.undo,
    'redo' => AppIcons.redo,
    'print' => AppIcons.print,
    'attach' => AppIcons.attach,
    'link' => AppIcons.link,
    'send' => AppIcons.send,
    // Status
    'check' => AppIcons.check,
    'error' => AppIcons.error,
    'warning' => AppIcons.warning,
    'info' => AppIcons.info,
    'help' => AppIcons.help,
    'verified' => AppIcons.verified,
    'pending' => AppIcons.pending,
    'blocked' => AppIcons.blocked,
    'success' => AppIcons.success,
    // Content
    'image' => AppIcons.image,
    'video' => AppIcons.video,
    'audio' => AppIcons.audio,
    'document' => AppIcons.document,
    'folder' => AppIcons.folder,
    'attachment' => AppIcons.attachment,
    'code' => AppIcons.code,
    'text' => AppIcons.text,
    'file' => AppIcons.file,
    'camera' => AppIcons.camera,
    'photo' => AppIcons.photo,
    // Communication
    'email' => AppIcons.email,
    'chat' => AppIcons.chat,
    'call' => AppIcons.call,
    'notifications' => AppIcons.notifications,
    'inbox' => AppIcons.inbox,
    'archive' => AppIcons.archive,
    'markAsRead' => AppIcons.markAsRead,
    'unread' => AppIcons.unread,
    // UI Controls
    'expandMore' => AppIcons.expandMore,
    'expandLess' => AppIcons.expandLess,
    'filter' => AppIcons.filter,
    'sort' => AppIcons.sort,
    'viewList' => AppIcons.viewList,
    'viewGrid' => AppIcons.viewGrid,
    'settings' => AppIcons.settings,
    'visibility' => AppIcons.visibility,
    'visibilityOff' => AppIcons.visibilityOff,
    'tune' => AppIcons.tune,
    _ => AppIcons.home,
  };
}
