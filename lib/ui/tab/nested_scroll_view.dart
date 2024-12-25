import 'package:flutter/material.dart';

class SliverCheckView extends StatelessWidget {
  const SliverCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    final length = 3;
    return DefaultTabController(
      length: length,
      child: NestedScrollView(
        // Setting floatHeaderSlivers to true is required in order to float
        // the outer slivers over the inner scrollable.
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Floating Nested SliverAppBar'),
              floating: true,
              expandedHeight: 100.0,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: Container(child: Text("あああああああああ")),
              bottom: TabBar(
                tabs: List.generate(
                  length,
                  (index) => Tab(text: 'Tab $index'),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: List.generate(
            length,
            (index) => ListView.builder(
              // The "extent" of the inner scroll view is the sum of the
              // lengths of the various tab views.
              itemExtent: 50.0,
              itemCount: 60,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
      ),
    );
    // body: ListView.builder(
    //     padding: const EdgeInsets.all(8),
    //     itemCount: 30,
    //     itemBuilder: (BuildContext context, int index) {
    //       return SizedBox(
    //         height: 50,
    //         child: Center(child: Text('Item $index')),
    //       );
    //     }));
  }
}
