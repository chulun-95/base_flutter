import 'package:flutter/widgets.dart';
import '../logger.dart';
import '../message_handler.dart';

typedef LoadMore = Function();

typedef HasMore = bool Function();

typedef OnLoadMoreFinished = void Function();

class LoadMoreListView extends StatefulWidget {
  final String loadMoreKey;

  final HasMore hasMore;

  final LoadMore loadMore;

  final int loadMoreOffsetFromBottom;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final double? cacheExtent;
  final int itemCount;

  final OnLoadMoreFinished? onLoadMoreFinished;

  LoadMoreListView({
    required this.loadMoreKey,
    required this.hasMore,
    required this.loadMore,
    required this.itemCount,
    this.loadMoreOffsetFromBottom = 0,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    required this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    required this.itemBuilder,
    this.separatorBuilder,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.cacheExtent,
    this.onLoadMoreFinished,
  });

  @override
  LoadMoreListViewState createState() {
    return LoadMoreListViewState();
  }
}

class LoadMoreListViewState extends State<LoadMoreListView> {
  late ScrollController scrollController;

  LoadMoreListViewState();

  bool _loadingMore = false;

  Widget _buildItem(BuildContext context, int index) {
    return widget.itemBuilder(context, index);
  }

  Widget _buildSeparator(BuildContext context, int index) {
    if (widget.separatorBuilder != null) {
      return widget.separatorBuilder!(context, index);
    } else {
      return const SizedBox();
    }
  }

  @override
  void initState() {
    super.initState();
    MessageHandler()
        .register<bool>(widget.loadMoreKey, (value) => {_loadingMore = value});
    scrollController = widget.controller;
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 500 && !_loadingMore) {
      Logger.debug('LOAD MORE');
      _loadingMore = true;
      widget.loadMore();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    MessageHandler().unregister(widget.loadMoreKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: widget.key,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemBuilder: _buildItem,
      itemCount: widget.itemCount,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      cacheExtent: widget.cacheExtent,
      separatorBuilder: _buildSeparator,
    );
  }
}
