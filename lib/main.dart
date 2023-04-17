import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_blog_app/presentations/home_page.dart';
import 'package:news_blog_app/providers/theme_provider.dart';
import 'package:news_blog_app/themes.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode?>((ref) {
  return ThemeProvider();
});


void main() async {
  runApp(ProviderScope(child: NewsApp()));
}

class NewsApp extends ConsumerStatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends ConsumerState<NewsApp> {

  @override
  Widget build(BuildContext context) {
    var themeModeState = ref.watch(themeProvider);
    return MaterialApp(
      title: "News App",
      theme: CustomThemes().lightTheme,
      darkTheme: CustomThemes().darkTheme,
      themeMode: themeModeState,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

