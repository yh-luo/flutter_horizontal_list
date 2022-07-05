import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingleChildHorizontalScrollPage(),
    );
  }
}

class SingleChildHorizontalScrollPage extends StatelessWidget {
  const SingleChildHorizontalScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal List Demo'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildHorizontalScrollList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push<void>(MaterialPageRoute(
                  builder: (context) => const InfiniteHorizontalScrollPage()));
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Infinite List',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const Divider(
            height: 40,
            thickness: 2,
          ),
          const ColorBlock(),
          const ColorBlock(),
          const ColorBlock(),
          const ColorBlock(),
          const ColorBlock(),
          const ColorBlock(),
          const ColorBlock(),
        ],
      ),
    );
  }
}

class SingleChildHorizontalScrollList extends StatelessWidget {
  const SingleChildHorizontalScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NavigationIcon(
            title: 'Button 1',
            onTap: () {
              debugPrint('Tapped button 1');
            },
          ),
          NavigationIcon(
            title: 'Button 2',
            onTap: () {
              debugPrint('Tapped button 2');
            },
          ),
          NavigationIcon(
            title: 'Button 3',
            onTap: () {
              debugPrint('Tapped button 3');
            },
          ),
          NavigationIcon(
            title: 'Button 4',
            onTap: () {
              debugPrint('Tapped button 4');
            },
          ),
          NavigationIcon(
            title: 'Button 5',
            onTap: () {
              debugPrint('Tapped button 5');
            },
          ),
          NavigationIcon(
            title: 'Button 6',
            onTap: () {
              debugPrint('Tapped button 6');
            },
          ),
        ],
      ),
    );
  }
}

class InfiniteHorizontalScrollList extends StatelessWidget {
  const InfiniteHorizontalScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class InfiniteHorizontalScrollPage extends StatefulWidget {
  const InfiniteHorizontalScrollPage({Key? key}) : super(key: key);

  @override
  State<InfiniteHorizontalScrollPage> createState() =>
      _InfiniteHorizontalScrollPageState();
}

class _InfiniteHorizontalScrollPageState
    extends State<InfiniteHorizontalScrollPage> {
  List<String> words = all.take(100).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => NavigationIcon(
                    onTap: () {
                      debugPrint('Tapped ${words[index]}');
                    },
                    title: words[index]),
                itemCount: words.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Single Box Widget',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 40,
              thickness: 2,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => ColorBlock(
                child: Center(
                    child: Text(words[index],
                        style: const TextStyle(fontSize: 24)))),
            childCount: words.length,
          )),
        ],
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({Key? key, this.title = '', this.icon, this.onTap})
      : super(key: key);

  final String title;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              icon ??
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    color: colors[Random().nextInt(colors.length)],
                  ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorBlock extends StatelessWidget {
  const ColorBlock({Key? key, this.width, this.height = 200, this.child})
      : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: colors[Random().nextInt(colors.length)],
      child: child,
    );
  }
}

final colors = [...Colors.primaries, ...Colors.accents];
