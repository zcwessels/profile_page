import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double _outerPadding = 16;
  final double _largePadding = 40;
  final double _smallPadding = 16;
  final double _smallerPadding = 8;

  final Color _mainPurple = Colors.deepPurpleAccent.shade100;
  final int _whiteAlpha = 90;
  final int _blackAlpha = 90;

  final TextStyle _heading1 = const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);
  final TextStyle _heading2 = const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _buttonText = const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);
  final TextStyle _subtitle1 = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  final List<Map<String, dynamic>> _places = [
    {
      'title': 'Mount Fuji',
      'image': 'https://cdn.britannica.com/47/80547-050-8B316D38/Field-green-tea-Mount-Fuji-Shizuoka-prefecture.jpg',
      'date': '19 Jan - 20 Feb 2023',
    },
    {
      'title': 'Mount Drakensberg',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPggZ3NbRl8eAwYcwzbs6I3OmQVmctRjXYxTHLN7LucgFL7vFvKU5VUyElSm3cHCDkGr8&usqp=CAU',
      'date': '19 March - 20 April 2023',
    },
    {
      'title': 'Mount Everest',
      'image': 'https://cdn.britannica.com/17/83817-050-67C814CD/Mount-Everest.jpg',
      'date': '10 Jan - 18 Jan 2023',
    },
    {
      'title': 'Mount Rushmore',
      'image': 'https://s27363.pcdn.co/wp-content/uploads/2020/10/Mt-Rushmore-Travel-Guide.jpg.optimal.jpg',
      'date': '1 May - 20 May 2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpeg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(_outerPadding),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your profile', style: _heading1),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.white.withAlpha(_whiteAlpha), borderRadius: const BorderRadius.all(Radius.circular(100))),
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_sharp)),
                      ),
                    ],
                  ),
                  SizedBox(height: _largePadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(_whiteAlpha),
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withAlpha(_whiteAlpha),
                            child: ClipOval(
                              child: Image.network('https://avatars.githubusercontent.com/u/31216542?v=4', scale: 6),
                            ),
                          ),
                        ),
                        SizedBox(height: _smallPadding),
                        Text('Zander Wessels', style: _heading1),
                        SizedBox(height: _smallPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on_outlined, color: Colors.white),
                            Text("South Africa, Gauteng, Pretoria", style: _subtitle1),
                          ],
                        ),
                        SizedBox(height: _smallPadding),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _mainPurple,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                          ),
                          child: Text('Edit Your Profile', style: _buttonText),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _largePadding),
                  Align(alignment: Alignment.centerLeft, child: Text('Next trip plan', style: _heading2)),
                  SizedBox(height: _smallPadding),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _places.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> place = _places[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black87.withAlpha(_blackAlpha),
                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(90),
                                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: _mainPurple,
                                      child: SizedBox(
                                        width: 78,
                                        height: 78,
                                        child: ClipOval(child: Image.network(place['image'], scale: 6, fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _smallerPadding),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(place['title'], style: _heading2),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today_outlined, color: Colors.white),
                                          SizedBox(width: _smallerPadding),
                                          Text(place['date'], style: _subtitle1),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.white)),
                                  SizedBox(width: _smallerPadding),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
