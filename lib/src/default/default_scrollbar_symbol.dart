import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// DefaultScrollbarSymbol
class DefaultScrollbarSymbol extends StatelessWidget {
  /// Constructor of DefaultScrollbarSymbol
  const DefaultScrollbarSymbol({
    required this.symbol,
    required this.state,
    super.key,
    this.styleActive,
    this.styleInactive,
    this.styleDeactivated,
  });

  /// symbol
  final String symbol;

  /// state of item
  final AlphabetScrollbarItemState state;

  /// style if symbol is active
  final TextStyle? styleActive;

  /// style if symbol is inactive
  final TextStyle? styleInactive;

  /// style if symbol is deactivated
  final TextStyle? styleDeactivated;

  @override
  Widget build(BuildContext context) {
    final textStyle = switch (state) {
      AlphabetScrollbarItemState.active => styleActive ??
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
      AlphabetScrollbarItemState.inactive =>
        styleInactive ?? TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      AlphabetScrollbarItemState.deactivated =>
        styleDeactivated ?? TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: state == AlphabetScrollbarItemState.active
          ? BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          symbol,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('symbol', symbol))
      ..add(EnumProperty<AlphabetScrollbarItemState>('state', state))
      ..add(DiagnosticsProperty<TextStyle?>('styleActive', styleActive))
      ..add(DiagnosticsProperty<TextStyle?>('styleInactive', styleInactive))
      ..add(
        DiagnosticsProperty<TextStyle?>(
          'styleDeactivated',
          styleDeactivated,
        ),
      );
  }
}
