class ToolsHtml {


  /// remove tags like <p>
  /// convert '&rsquo;' to means single qoute "`"
  static String removeHtmlTags(String htmlText) {
    // Remove HTML tags
    final RegExp tagExp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    String textWithoutTags = htmlText.replaceAll(tagExp, '');

    // Replace HTML entities
    final Map<String, String> htmlEntities = {
      '&rsquo;': '’',
      // Add more entities here if needed
    };

    htmlEntities.forEach((entity, replacement) {
      textWithoutTags = textWithoutTags.replaceAll(entity, replacement);
    });

    return textWithoutTags;
  }

}