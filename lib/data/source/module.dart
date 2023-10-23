import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/data/source/files.dart';
import 'package:flutter_todo_riverpod/data/source/files_memory_implementation.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesMemoryImplementation();
});
