import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voice_assistant/main.dart';
import 'package:flutter_voice_assistant/providers/cart_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

enum Topping { tomato, capsicum, onion }
enum Base { regular, thin, double }

class _PizzaScreenState extends State<PizzaScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    setVisuals("second");
  }

  @override
  void didPop() {
    setVisuals('first');
  }

  void setVisuals(String screen) {
    String visual = '{"screen":"$screen"}';
    AlanVoice.setVisualState(visual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Topping'),
          ListTile(
            title: const Text('Tomato'),
            leading: Radio<String>(
              value: 'tomato',
              groupValue: context.watch<Cart>().getTopping,
              onChanged: (String? value) {
                context.read<Cart>().setTopping('tomato');
              },
            ),
          ),
          ListTile(
            title: const Text('Onion'),
            leading: Radio<String>(
              value: 'onion',
              groupValue: context.watch<Cart>().getTopping,
              onChanged: (String? value) {
                context.read<Cart>().setTopping('onion');
              },
            ),
          ),
          ListTile(
            title: const Text('Capsicum'),
            leading: Radio<String>(
              value: 'capsicum',
              groupValue: context.watch<Cart>().getTopping,
              onChanged: (String? value) {
                context.read<Cart>().setTopping('capsicum');
              },
            ),
          ),
          const Text('Base'),
          ListTile(
            title: const Text('Regular'),
            leading: Radio<String>(
              value: 'regular',
              groupValue: context.watch<Cart>().getBase,
              onChanged: (String? value) {
                context.read<Cart>().setBase('regular');
              },
            ),
          ),
          ListTile(
            title: const Text('Thin'),
            leading: Radio<String>(
              value: 'thin',
              groupValue: context.watch<Cart>().getBase,
              onChanged: (String? value) {
                context.read<Cart>().setBase('regular');
              },
            ),
          ),
          ListTile(
            title: const Text('Double'),
            leading: Radio<String>(
              value: 'double',
              groupValue: context.watch<Cart>().getBase,
              onChanged: (String? value) {
                context.read<Cart>().setBase('double');
              },
            ),
          ),
          Text(context.watch<Cart>().placeOrder),
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Item added to the Cart',
                toastLength: Toast.LENGTH_SHORT,
              );
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
