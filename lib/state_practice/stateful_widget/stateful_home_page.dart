// ① Stateful Widget
import 'package:flutter/material.dart';
import 'package:flutter_state_practice/state_practice/stateful_widget/loading_widget.dart';
import 'package:flutter_state_practice/state_practice/stateful_widget/widget_a.dart';
import 'package:flutter_state_practice/state_practice/stateful_widget/widget_b.dart';
import 'package:flutter_state_practice/state_practice/stateful_widget/widget_c.dart';

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatefulWidgetPageState();
  }
}

// ② State
class StatefulWidgetPageState extends State<StatefulWidgetPage> {
  int _count = 0;
  bool _isLoading = false;

  void _increment() async {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // ④ setStateメソッドにより状態の変更を通知
      setState(() {
        _count++;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('called HomePageState#build');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ③ コンストラクタ経由で状態を受け渡し
            children: <Widget>[
              WidgetA(_count),
              const WidgetB(),
              WidgetC(_increment)
            ],
          ),
          LoadingWidget(_isLoading)
        ],
      ),
    );
  }
}
