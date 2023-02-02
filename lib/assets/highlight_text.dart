class HighlightText {
  final String text;
  final RegExp highlightRegex;

  String get value {
    var start = 0;
    var result = text;
    while (true) {
      final highlight = highlightRegex.stringMatch(result.substring(start));

      if (highlight == null) {
        return result;
      }
      final replacement = '**$highlight**';
      final indexOfHighlight = result.indexOf(highlight, start);

      result = result.replaceRange(indexOfHighlight, indexOfHighlight + highlight.length, replacement);
      start = indexOfHighlight + replacement.length;
    }
  }

  const HighlightText({required this.text, required this.highlightRegex});
}
