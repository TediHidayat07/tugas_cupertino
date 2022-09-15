import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Settings',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                bool isTaped = false;
                return StatefulBuilder(builder: (context, setState) {
                  return GestureDetector(
                    onTapDown: (details) => setState(() {
                      isTaped = true;
                    }),
                    onDoubleTapCancel: () => setState(() {
                      isTaped = true;
                    }),
                    onTapUp: (details) => setState(() {
                      isTaped = false;
                    }),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Container()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: isTaped
                              ? CupertinoColors.white.withOpacity(0.4)
                              : CupertinoColors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(children: [
                        const Icon(CupertinoIcons.alarm),
                        Text(
                          'Item $index',
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.forward,
                          color: CupertinoColors.tertiaryLabel,
                        ),
                      ]),
                    ),
                  );
                });
              },
            )),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            'Detail',
            style: TextStyle(color: CupertinoColors.white),
          ),
          previousPageTitle: 'Settings',
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            CupertinoButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            const SizedBox(
              height: 16,
            ),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Text Button'),
            )
          ],
        ));
  }
}
