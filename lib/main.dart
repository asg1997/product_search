import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/product_search.dart';
import 'package:product_search/core/utils/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      localStorageProvider.overrideWithValue(LocalStorageImpl(prefs)),
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
