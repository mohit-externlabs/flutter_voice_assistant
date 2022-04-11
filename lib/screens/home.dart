import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voice_assistant/providers/cart_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setVisuals('first'));
  }

  void setVisuals(String screen) {
    String visual = '{"screen":"$screen"}';
    AlanVoice.setVisualState(visual);
  }

  _MyHomePageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "6a77b58124e16bcce8658eef0bcf44ff2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> commandData) {
    switch (commandData['command']) {
      case 'openPizza':
        _navigateToPizzaScreen();
        break;
      case 'addBase':
        context.read<Cart>().setBase(commandData['base']);
        break;
      case 'addTopping':
        context.read<Cart>().setTopping(commandData['topping']);
        break;
      case 'addToCart':
        Fluttertoast.showToast(
            msg: 'Item added to the Cart', toastLength: Toast.LENGTH_SHORT);
        break;
      default:
        debugPrint('Unknown command');
    }
  }

  void _navigateToPizzaScreen() {
    Navigator.pushNamed(context, '/second');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: _navigateToPizzaScreen, child: const Text('Pizza')),
          ElevatedButton(onPressed: () {}, child: const Text('Pasta')),
          ElevatedButton(onPressed: () {}, child: const Text('Lasagne')),
          ElevatedButton(onPressed: () {}, child: const Text('Mac n cheeze')),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
