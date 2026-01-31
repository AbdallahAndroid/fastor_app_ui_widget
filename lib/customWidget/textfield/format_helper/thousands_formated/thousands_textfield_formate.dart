



import 'package:flutter/services.dart';

/// Custom TextInputFormatter to add thousand separators while typing
class ThousandSeparatorInputFormatter extends TextInputFormatter {

  /// Format number with thousand separators (e.g., 9800700 -> 9,800,700)
  static String formatWithThousandSeparator(String value) {
    if (value.isEmpty) return value;
    // Remove existing commas
        String cleanValue = value.replaceAll(',', '');
    // Check if it's a valid number
        if (int.tryParse(cleanValue) == null) return value;
    // Add thousand separators
        String result = '';
        int count = 0;
        for (int i = cleanValue.length - 1; i >= 0; i--) {
          count++;
          result = cleanValue[i] + result;
          if (count % 3 == 0 && i != 0) {
            result = ',' + result;
          }
        }
    return result;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (newText.isEmpty) {
      return const TextEditingValue(text: '');
    }

    // Format with thousand separators
    String formatted = '';
    int count = 0;
    for (int i = newText.length - 1; i >= 0; i--) {
      count++;
      formatted = newText[i] + formatted;
      if (count % 3 == 0 && i != 0) {
        formatted = ',' + formatted;
      }
    }

    // Calculate new cursor position
    int cursorPosition = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
