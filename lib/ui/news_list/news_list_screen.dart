import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/ui/news/news_screen.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class NewsListScreen extends StatefulWidget {
  static final String route = '/newsList';

  final NewsListViewModel viewModel;

  NewsListScreen({
    this.viewModel,
  });

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

// ignore: mixin_inference_inconsistent_matching_classes
class _NewsListScreenState extends State<NewsListScreen> with AfterLayoutMixin<NewsListScreen>, SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  TabController _tabController;

  Widget _buildAppBar() {
    return SliverAppBar(
      snap: true,
      floating: true,
      pinned: true,
      elevation: 1.0,
      forceElevated: true,
      title: Text(
        'ข่าวสาร',
        style: AppStyle.appbarTitle,
      ),
      bottom: TabBar(
        labelColor: AppColors.main,
        controller: _tabController,
        tabs: [
          Tab(text: 'ข่าวสารทั่วไป'),
          Tab(text: 'นัดหมายกิจกรรม'),
        ],
      ),
      iconTheme: IconThemeData(color: AppColors.main),
    );
  }

  void _showNewsCompose() {
    Navigator.of(context).pushNamed(NewsComposeScreen.route);
  }

  void _showNews(News news) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewsScreen(news: news)));
  }

  Widget _buildGeneralNews() {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        Completer<Null> completer = Completer();
        completer.future.then((_) {
          print('completer');
        });

        widget.viewModel.onRefresh(_refreshIndicatorKey.currentState, completer);

        return completer.future;
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final news = widget.viewModel.news[index];
                  return NewsItem(
                    news: news,
                    onPressed: () => _showNews(news),
                  );
                },
                childCount: widget.viewModel.news.length,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    //;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showNewsCompose,
        child: Icon(
          Icons.add,
          color: AppColors.main,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            _buildAppBar(),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildGeneralNews(),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final News news;
  final VoidCallback onPressed;

  NewsItem({
    this.news,
    this.onPressed,
  });

  Widget _buildImagePlaceholder(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildVideoTitle() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            news.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              color: AppColors.main,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateCreated() {
    final formatter = DateFormat('dd MMM yyy');
    final date = formatter.format(news.dateCreated);

    return Text(
      date,
      style: TextStyle(color: Colors.black54),
    );
  }

  Widget _buildDiff() {
    return Text(
      news.diff,
      style: TextStyle(color: Colors.black54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        margin: EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //  _buildDateCreated(),
            _buildDiff(),
            _buildVideoTitle(),
            SizedBox(height: 4.0),
            CachedNetworkImage(
              imageUrl: news.cover ?? 'https://increasify.com.au/wp-content/uploads/2016/08/default-image.png',
              placeholder: _buildImagePlaceholder(context),
            )
          ],
        ),
      ),
    );
  }
}
