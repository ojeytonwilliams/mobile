import 'package:flutter/material.dart';
import 'package:freecodecamp/ui/views/news/news-bookmark/news_bookmark_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NewsBookmarkViewWidget extends StatelessWidget {
  const NewsBookmarkViewWidget({Key? key, required this.article})
      : super(key: key);
  final dynamic article;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsBookmarkModel>.reactive(
        viewModelBuilder: () => NewsBookmarkModel(),
        onModelReady: (model) => model.isArticleBookmarked(article),
        builder: (context, model, child) => TextButton.icon(
              key: const Key('bookmark_btn'),
              onPressed: () {
                model.bookmarkAndUnbookmark(article);
              },
              icon: Icon(
                  model.bookmarked
                      ? Icons.bookmark_sharp
                      : Icons.bookmark_border_sharp,
                  color: Colors.white),
              label: Text(
                model.bookmarked
                    ? 'Article is bookmarked'
                    : 'Bookmark for offline usage',
              ),
            ));
  }
}
