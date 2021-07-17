import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listOfOS = ['iOS', 'Android', 'Flutter', 'React Native'];
  late List listOfButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Popup Bubble',
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(5.sp),
              child: TextButton(
                child: Text(
                  'Shuffle',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () => _shuffle(),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listOfOS.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(top: 8.sp),
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: myToolTip(index));
            },
          ),
        ));
  }

  //Custom ToolTip which shows msg onTap() of it's child
  Widget myToolTip(int index) {
    bool leftSide = index % 2 == 0;
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: 'is developed by ${_getMessage(listOfOS[index])}',
      margin: EdgeInsets.only(
          left: leftSide ? 20.w : 0, right: leftSide ? 0 : 20.w),
      verticalOffset: 28.sp,
      height: 34.sp,
      preferBelow: false,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.black54, fontWeight: FontWeight.bold),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        elevation: 10,
        child: InkWell(
          onTap: () => _onTap(key),
          child: Container(
              height: 8.h,
              width: 40.w,
              alignment: Alignment.center,
              child: Text(
                listOfOS[index],
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }

  //to handle the onTap of the ToolTip's Child
  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }

  //used to shuffle the OS names
  void _shuffle() {
    setState(() {
      listOfOS.shuffle();
    });
  }

  //used to get the company name of the OS
  String _getMessage(String _name) {
    switch (_name) {
      case 'iOS':
        return 'Apple';
      case 'Flutter':
        return 'Google';
      case 'Android':
        return 'Google';
      case 'React Native':
        return 'Facebook';
      default:
        return '';
    }
  }
}
