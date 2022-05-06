import 'package:flutter/material.dart';
import 'package:gitclone/chat/chat_page.dart';

class TabsExample extends StatelessWidget{
  const TabsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    final _kTabPages = <Widget>[
      ChatPage("test"),
      const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'tab1'),
      const Tab(text: 'tab2'),
    ];
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('title'),
            backgroundColor: Colors.cyan,
            bottom: TabBar(
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
        ),
    );
  }
}