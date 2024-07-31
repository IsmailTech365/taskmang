// ignore_for_file: camel_case_types, prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print, dead_code

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nko_flutter/View/Decisions/DecisionView.dart';
import 'package:nko_flutter/View/Task/Home_task.dart';
import 'package:nko_flutter/View/Vacations/view_vac.dart';
import '../Widget/Home/Mydrawer.dart';

class Main_Screen extends StatefulWidget {
  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
    
      appBar: AppBar(
        
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
              iconSize: 32)
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
        title: Text(
          'Nasaem Khair',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      drawer: Drawer_all(),
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: 40),
              homePageCardsGroup(
                Colors.white,
                Icons.analytics_outlined,
                'المهمات',
                context,
                HomeTask(),
                Colors.white,
                Icons.home_work_outlined,
                'الإجازات',
                View_Vac(),
              ),
              homePageCardsGroup(
                Colors.white,
                Icons.article,
                'القرارات',
                context,
                ViewDecision(),
                Colors.white,
                Icons.ad_units_outlined,
                'الاخبار',
                RouteWhereYouGo(),
              ),
              homePageCardsGroup(
                Colors.white,
                Icons.car_repair,
                'خدمة التوصيل',
                context,
                RouteWhereYouGo(),
                Colors.white,
                Icons.receipt_long_sharp,
                'التقارير',
                RouteWhereYouGo(),
              ),
              SizedBox(height: _w / 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
    Color color,
    IconData icon,
    String title,
    BuildContext context,
    Widget route,
    Color color2,
    IconData icon2,
    String title2,
    Widget route2,
  ) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, route),
          homePageCard(color2, icon2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 98, 128),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff040039).withOpacity(.15), blurRadius: 99),
              ],
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                      color: color.withOpacity(.1), shape: BoxShape.circle),
                  child: Icon(icon, color: color.withOpacity(.6)),
                ),
                Text(title,
                    maxLines: 4,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}
