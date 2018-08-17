import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/news.dart';
import 'package:buddish_project/ui/news/news_screen.dart';
import 'package:buddish_project/ui/news_compose/news_compose_screen.dart';
import 'package:buddish_project/ui/news_list/news_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
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

class _NewsListScreenState extends State<NewsListScreen> with SingleTickerProviderStateMixin {
  TabController tabController;

  Widget _buildAppBar() {
    return SliverAppBar(
      snap: true,
      floating: true,
      elevation: 1.0,
      forceElevated: true,
      pinned: true,
      title: Text(
        'ข่าวสาร',
        style: AppStyle.appbarTitle,
      ),
      bottom: TabBar(
        labelColor: AppColors.main,
        controller: tabController,
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
    print(news);
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewsScreen(news: news)));
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: [
                RefreshIndicator(
                  onRefresh: () async => print('refresh'),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final news = widget.viewModel.news[index];
                      return NewsItem(news: news, onPressed: () => _showNews(news));
                    },
                    itemCount: widget.viewModel.news.length,
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                ),
                ListView.builder(
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    final news = widget.viewModel.news[index];
                    return NewsItem(news: news, onPressed: () => print(news.title));
                  },
                  itemCount: widget.viewModel.news.length,
                  padding: EdgeInsets.only(top: 8.0),
                ),
              ],
            ),
          )
        ],
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

  Widget _buildImagePlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180.0,
        width: 320.0,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildVideoTitle() {
    return Row(children: <Widget>[
      Expanded(
        child: Text(
          news.title,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: AppColors.main),
        ),
      ),
    ]);
  }

  Widget _buildDateCreated() {
    final formatter = DateFormat('dd MMM yyy');
    final date = formatter.format(news.dateCreated);
    return Text(
      date,
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
            _buildDateCreated(),
            _buildVideoTitle(),
            SizedBox(height: 4.0),
//            Image.network(news.cover),
            TransitionToImage(
              AdvancedNetworkImage(news.cover, timeoutDuration: Duration(minutes: 1)),
              fit: BoxFit.cover,
              placeholder: _buildImagePlaceholder(),
              loadingWidget: _buildImagePlaceholder(),
              duration: Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
