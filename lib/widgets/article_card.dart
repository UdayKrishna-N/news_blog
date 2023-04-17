import 'package:flutter/material.dart';
import 'package:news_blog_app/blocs/date.dart';

import '../responsive_widget.dart';
import '../themes.dart';


class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.screenContext,
    required this.themeModeState,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.urlToArticle,
    required this.publishedAt,
  });

  final BuildContext screenContext;
  final ThemeMode? themeModeState;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String urlToArticle;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(screenContext)
        .size;
    return Container(
      height: Responsive.isDesktop(context)
          ? size.height * 0.25
          : size.height * 0.22,
      padding: EdgeInsets.all(CustomThemes.defaultPadding / 2),
      margin: EdgeInsets.only(
        left: CustomThemes.defaultPadding,
        right: CustomThemes.defaultPadding,
        top: CustomThemes.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: themeModeState == ThemeMode.dark
                ? Colors.white30
                : Colors.black38,
          ),
        ),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: Responsive.isDesktop(context) ? 1 / 1 : 0.9 / 1,
            child: SizedBox(
              child: Image.network(
              urlToImage,
              fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          author,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                            // color: Colors.white,
                            fontSize:
                            Responsive.isDesktop(context) ? 12 : 10,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.more_vert,
                            size: 16,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: Responsive.isDesktop(context) ? 2 : 3,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        fontSize:
                        Responsive.isDesktop(context) ? 22 : 14),
                  ),
                ),
                Flexible(
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: Responsive.isDesktop(context) ? 3 : 2,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontSize:
                        Responsive.isDesktop(context) ? 14 : 12),
                  ),
                ),
                Text(
                  "Published at : ${Date().getDate(
                    DateTime.parse(publishedAt),
                  )}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                    fontSize: Responsive.isDesktop(context) ? 12 : 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}