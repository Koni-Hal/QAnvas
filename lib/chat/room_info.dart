import 'package:flutter/material.dart';
import 'package:qanvas/chat/chat_page.dart';
import 'package:qanvas/chat/room_question.dart';

class Roominfo extends StatefulWidget {
  const Roominfo({Key? key}) : super(key: key);

  @override
  RoomState createState() => RoomState();
}

  class RoomState extends State<Roominfo> with TickerProviderStateMixin{

  TabController? _tabController;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    _tabController!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies(){
    setState(() {
      _tabController?.addListener(handleTabChange);
    });
    super.didChangeDependencies();
  }

  handleTabChange(){
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context ) {
    final _kTabPages = <Widget>[
      ChatScreen("test"),
      AppBarSearchExample()
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'tab1'),
      const Tab(text: 'tab2'),
    ];

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
          onTap: focusNode.requestFocus,
          child: DefaultTabController(
              length: _kTabs.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('title'),
                  backgroundColor: Colors.cyan,
                  bottom: TabBar(
                    tabs: _kTabs,
                    controller: _tabController,
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: _kTabPages,
                ),
              ),
          ),
      ),
    );
  }
}