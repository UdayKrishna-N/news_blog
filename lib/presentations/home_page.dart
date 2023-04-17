// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_blog_app/enums/loading_status.dart';
import 'package:news_blog_app/main.dart';
import 'package:news_blog_app/presentations/web_view.dart';
import 'package:news_blog_app/providers/data_provider.dart';
import 'package:news_blog_app/widgets/article_card.dart';
import 'package:news_blog_app/widgets/custom_title.dart';
import 'package:news_blog_app/widgets/loader.dart';



final dataProvider = ChangeNotifierProvider<DataProvider>((ref) {
  return DataProvider();
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(dataProvider).getData();
  }

  @override
  Widget build(BuildContext context) {
    var themeModeState = ref.watch(themeProvider);
    var status = ref.watch(dataProvider).status;
    var articles = ref.watch(dataProvider).articles;
    return Scaffold(
      appBar: AppBar(
        title: CustomTitle(),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(themeProvider.notifier)
                  .changeTheme(themeModeState == ThemeMode.dark);
            },
            icon: themeModeState == ThemeMode.dark
                ? Icon(
                    Icons.light_mode,
                  )
                : Icon(
                    Icons.dark_mode,
                  ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: status == LoadingStatus.completed
          ? Column(
              children: [
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebView(
                                    title: articles[index].title,
                                    urlToArticle: articles[index].urlToArticle,
                                  ),
                                ),
                              );

                          },
                          child: ArticleCard(
                            screenContext: context,
                            themeModeState: themeModeState,
                            author: articles[index].author,
                            title: articles[index].title,
                            description: articles[index].description,
                            urlToImage: articles[index].urlToImage,
                            urlToArticle: articles[index].urlToArticle,
                            publishedAt: articles[index].publishedAt,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Loader(),
    );
  }
}
