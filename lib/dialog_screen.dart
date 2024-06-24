import 'package:dialog_screen/pop_up_dialog_screen.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var isEnabled = true;
  var test = "Text From Pop Up Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Dialog Screen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Container(
                    child: StatefulBuilder(builder: (context, alertState) {
                      return AlertDialog(
                        title: Text("Alert Dialog"),
                        content: Container(
                          color: isEnabled == true ? Colors.red : Colors.green,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("this is alert dialog"),
                              Switch(
                                  value: isEnabled,
                                  onChanged: (value) {
                                    isEnabled = value;
                                    alertState(() {});
                                  })
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Back"),
                          ),
                        ],
                      );
                    }),
                  );
                },
              );
            },
            child: const Text("Alert Dailog"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: StatefulBuilder(builder: (context, customState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color:
                                isEnabled == true ? Colors.red : Colors.green,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("this is custom dialog"),
                                Switch(
                                    value: isEnabled,
                                    onChanged: (value) {
                                      isEnabled = value;
                                      customState(() {});
                                    }),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Back"),
                          ),
                        ],
                      );
                    }),
                  );
                },
              );
            },
            child: const Text("Custom Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => PopUpDialogScreen()).then((value) {
                test = value;
                setState(() {});
              });
            },
            child: Text("Pop up to Dailog box"),
          ),
          Text(test),
        ],
      ),
    );
  }
}
