import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

Future<void> main() async {
  final dir = Directory('assets/icons');
  final entities = await dir.list().toList();
  final dirs = [dir, ...entities.whereType<Directory>()];

  for (final iconDir in dirs) {
    final lines = await generateLines(iconDir);
    final uiDir = iconDir.path.replaceFirst('assets/', '');
    final outputFile = File('lib/ui/components/$uiDir/svg_icons.dart')..createSync(recursive: true);
    await save(lines, outputFile);
  }
}

Future<List<String>> generateLines(Directory dir) async {
  final entities = await dir.list().toList();

  final icons = entities.whereType<File>().where((file) => path.extension(file.path) == '.svg').toList()
    ..sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));

  final filesEntries = icons.map((file) => MapEntry(
        path.basenameWithoutExtension(file.path),
        file,
      ));

  final files = {for (var v in filesEntries) v.key};

  final filteredFilesEntries = filesEntries.where((e) => !e.key.contains('filled'));

  final lines = <String>[];

  for (final entry in filteredFilesEntries) {
    final filename = entry.key;
    final file = IconFile(entry.value);
    final classBuilder = IconClassBuilder(file);
    if (files.contains('${filename}_filled')) {
      classBuilder.addConstructor(filledIconConstructorBuild);
    }
    lines.add(classBuilder.build());
  }

  return lines;
}

Future<void> save(List<String> lines, File outputFile) async {
  final sink = outputFile.openWrite()
    ..write("import 'package:places/ui/components/icons/svg_icon.dart';\n")
    ..write('${lines.join('\n')}\n');

  await sink.close();
}

typedef IconConstructorBuilder = String Function(IconFile file);

String iconConstructorBuild(IconFile file) => '''
static const iconPath = '${file.dirname}/${file.filename}.svg';
const ${file.className}({
  super.key,
  super.color,
}) : super(path: iconPath);
''';

String filledIconConstructorBuild(IconFile file) => '''
static const filledIconPath = '${file.dirname}/${file.filename}_filled.svg';
const ${file.className}.filled({
  super.key,
  super.color,
}) : super(path: filledIconPath);
''';

class IconFile {
  final File file;

  String get filename => path.basenameWithoutExtension(file.path);

  String get dirname => path.dirname(file.path);

  String get className => '${path.basenameWithoutExtension(file.path).pascalCase}SvgIcon';

  IconFile(this.file);
}

class IconClassBuilder {
  final IconFile file;
  final List<IconConstructorBuilder> constructorBuilders = [
    iconConstructorBuild,
  ];

  IconClassBuilder(this.file);

  void addConstructor(IconConstructorBuilder builder) {
    constructorBuilders.add(builder);
  }

  String build() {
    return '''
class ${file.className} extends SvgIcon {
${constructorBuilders.map((builder) => builder(file)).join('\n')}}
''';
  }
}
