import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 105, 140, 88),
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        routes: {
          '/firstPage': (context) => FirstPage(),
          '/secondPage': (context) => SecondPage(),
          '/thirdPage': (context) => ThirdPage(),
          '/fourthPage': (context) => FourthPage(),
          '/fifthPage': (context) => FifthPage(),
          '/sixthPage': (context) => SixthPage(),
          '/commonWidget1': (context) => WidgetContainer(),
          '/commonWidget2': (context) => WidgetGrid(),
          '/commonWidget3': (context) => WidgetListView(),
          '/commonWidget4': (context) => WidgetStack(),
          '/commonWidget5': (context) => WidgetCard(),
          '/commonWidget6': (context) => WidgetListTile(),
          '/tutorial': (context) => Tutorial(),
        },
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 105, 140, 88),
        ));
  }
}

class HomePage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Hello world', '/firstPage'),
    MenuItem('Multiple widgets: Pancake', '/secondPage'),
    MenuItem('Aligning widgets', '/thirdPage'),
    MenuItem('Sizing Widgets', '/fourthPage'),
    MenuItem('Nesting rows and columns', '/fifthPage'),
    MenuItem('Common layout widgets', '/sixthPage'),
    MenuItem('Tutorial: Building Layer', '/tutorial'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Layout Learning'),
      body: Container(
        color: Color.fromARGB(255, 242, 242, 242),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, menuItems[index].route);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  color: Color.fromARGB(255, 191, 108, 90),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white),
                      SizedBox.fromSize(size: Size(10, 0)),
                      Text(
                        menuItems[index].title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String route;

  MenuItem(this.title, this.route);
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hello world'),
      body: Center(
        child: Text('Hello world',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Multiple widgets: Pancake'),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.zero,
                      child: Image.asset('assets/images/pancake.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox.fromSize(size: Size(0, 10)),
              Row(
                children: [
                  Expanded(
                      child: Text('Pancake',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                          ))),
                ],
              ),
              SizedBox.fromSize(size: Size(0, 10)),
              Row(
                children: [
                  Expanded(
                      child: Text(
                          'Pancake is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter. Archaeological evidence suggests that pancakes were probably the earliest and most widespread cereal food eaten in prehistoric societies.',
                          style: TextStyle(
                            fontSize: 16,
                          ))),
                ],
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.red),
                          Icon(Icons.star, color: Colors.red),
                          Icon(Icons.star, color: Colors.red),
                          Icon(Icons.star, color: Colors.grey),
                          Icon(Icons.star, color: Colors.grey),
                        ],
                      )
                    ],
                  ),
                  SizedBox.fromSize(size: Size(10, 0)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('170 Reviews',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.book, color: Colors.green),
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 10)),
                      Row(
                        children: [
                          Text('PREP:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 5)),
                      Row(
                        children: [
                          Text('28 min',
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      )
                    ],
                  ),
                  SizedBox.fromSize(size: Size(30, 0)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_clock, color: Colors.green),
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 10)),
                      Row(
                        children: [
                          Text('COOK:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 5)),
                      Row(
                        children: [
                          Text('1 hr',
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      )
                    ],
                  ),
                  SizedBox.fromSize(size: Size(30, 0)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.food_bank, color: Colors.green),
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 10)),
                      Row(
                        children: [
                          Text('FEEDS:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox.fromSize(size: Size(0, 5)),
                      Row(
                        children: [
                          Text('4-6',
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Aligning widgets'),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox.fromSize(size: Size(0, 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ROW",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox.fromSize(size: Size(0, 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/pic1.jpg',
                  width: 100, height: 100, fit: BoxFit.cover),
              Image.asset('assets/images/pic2.jpg',
                  width: 100, height: 100, fit: BoxFit.cover),
              Image.asset('assets/images/pic3.jpg',
                  width: 100, height: 100, fit: BoxFit.cover),
            ],
          ),
          SizedBox.fromSize(size: Size(0, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("COLUMN",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox.fromSize(size: Size(0, 10)),
          SizedBox(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/pic1.jpg',
                    width: 100, height: 100, fit: BoxFit.cover),
                Image.asset('assets/images/pic2.jpg',
                    width: 100, height: 100, fit: BoxFit.cover),
                Image.asset('assets/images/pic3.jpg',
                    width: 100, height: 100, fit: BoxFit.cover),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Sizing Widgets'),
        body: Center(
            child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flex 1:2:1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox.fromSize(size: Size(0, 10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset('assets/images/pic1.jpg'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/pic2.jpg'),
                  ),
                  Expanded(
                    child: Image.asset('assets/images/pic3.jpg'),
                  ),
                ],
              ),
              SizedBox.fromSize(size: Size(0, 30)),
              Text("Flex 1:2:3",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox.fromSize(size: Size(0, 10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset('assets/images/pic1.jpg',
                        filterQuality: FilterQuality.low),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/pic2.jpg',
                        filterQuality: FilterQuality.low),
                  ),
                  Expanded(
                    flex: 3,
                    child: Image.asset('assets/images/pic3.jpg',
                        filterQuality: FilterQuality.low),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    var titleText = Row(
      children: [
        Text('Strawberry Pavlova',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ))
      ],
    );

    var subTitle = DefaultTextStyle(
      style: descTextStyle,
      child: Row(
        children: [
          Flexible(
            child: Text(
              'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova.',
            ),
          )
        ],
      ),
    );

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.grey),
        Icon(Icons.star, color: Colors.grey),
      ],
    );

    var ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          stars,
          SizedBox.fromSize(size: Size(10, 0)),
          Text('170 Reviews',
              style: TextStyle(
                fontSize: 16,
              ))
        ],
      ),
    );

    final iconList = DefaultTextStyle(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final bottomColumn = Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'Nesting rows and columns'),
      body: Center(
          child: Container(
        width: 400,
        margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
        height: 670,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/pavlova.jpg',
                        height: 200, fit: BoxFit.cover),
                  ],
                ),
              ),
              bottomColumn,
            ],
          ),
        ),
      )),
      // #enddocregion body
    );
  }
}

class SixthPage extends StatelessWidget {
  final List<MenuItem> menuItems2 = [
    MenuItem('Container', '/commonWidget1'),
    MenuItem('Grid View', '/commonWidget2'),
    MenuItem('List View', '/commonWidget3'),
    MenuItem('Stack', '/commonWidget4'),
    MenuItem('Card', '/commonWidget5'),
    MenuItem('ListTile', '/commonWidget6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Common layout widgets'),
      body: Container(
        color: Color.fromARGB(255, 242, 242, 242),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: menuItems2.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, menuItems2[index].route);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 50,
                  color: Color.fromARGB(255, 191, 108, 90),
                  child: Center(
                    child: Text(
                      menuItems2[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

class WidgetContainer extends StatelessWidget {
  final p = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Container'),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox.fromSize(size: Size(0, 10)),
            Row(
              children: [
                Text('- Add padding, margins, borders', style: p),
              ],
            ),
            Row(
              children: [
                Text('- Change background color or image', style: p),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Text(
                        '- Contains a single child widget, but that child can be a Row, Column, or even the root of a widget tree',
                        style: p)),
              ],
            ),
            SizedBox.fromSize(size: Size(0, 20)),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 300,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/pic1.jpg',
                          width: 100, height: 100, fit: BoxFit.cover),
                      Image.asset('assets/images/pic2.jpg',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/pic3.jpg',
                          width: 100, height: 100, fit: BoxFit.cover),
                      Image.asset('assets/images/pancake.jpg',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetGrid extends StatelessWidget {
  final p = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontSize: 18,
  );

  final h = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Grid View'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(children: [
            Row(
              children: [
                Text('Summary', style: h),
              ],
            ),
            SizedBox.fromSize(size: Size(0, 10)),
            Row(
              children: [
                Text('- Lays widgets out in a grid', style: p),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Text(
                        '- Detects when the column content exceeds the render box and automatically provides scrolling',
                        style: p)),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Text(
                        '- Build your own custom grid, or use one of the provided grids:',
                        style: p)),
              ],
            ),
            SizedBox.fromSize(size: Size(0, 20)),
            Row(
              children: [
                Text('GridView.count', style: h),
              ],
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                children: List.generate(
                  9,
                  (index) => Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: p,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(size: Size(0, 20)),
            Row(
              children: [
                Text('GridView.extent', style: h),
              ],
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                children: List.generate(
                  9,
                  (index) => Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: p,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class WidgetListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  final p = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontSize: 18,
  );

  final h = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'List View'),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Icon(Icons.propane_tank_rounded),
              iconColor: Colors.grey,
              title: Text(items[index], style: h),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: p),
              onTap: () {
                print('Tapped on ${items[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

class WidgetStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Stack'),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
              Text(
                'Hello, Stack!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

class WidgetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Card'),
        body: SizedBox(
          height: 230,
          child: Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    '1625 Main Street',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('My City, CA 99984'),
                  leading: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue[500],
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    '(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.blue[500],
                  ),
                ),
                ListTile(
                  title: const Text('costa@example.com'),
                  leading: Icon(
                    Icons.contact_mail,
                    color: Colors.blue[500],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class WidgetListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'List Tile'),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('John Doe'),
            subtitle: Text('john.doe@example.com'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Do something when this list tile is tapped.
              print('John Doe tapped!');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Jane Smith'),
            subtitle: Text('jane.smith@example.com'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Do something when this list tile is tapped.
              print('Jane Smith tapped!');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Bob Johnson'),
            subtitle: Text('bob.johnson@example.com'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Do something when this list tile is tapped.
              print('Bob Johnson tapped!');
            },
          ),
        ],
      ),
    );
  }
}

class Tutorial extends StatelessWidget {
  final Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );

  final Widget textSection = Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return Scaffold(
        appBar: CustomAppBar(title: 'Tutorial: Building Layer'),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Image.asset('assets/images/Oeschinen_Lake_Campground.jpg',
                  width: 600, height: 240, fit: BoxFit.cover),
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
