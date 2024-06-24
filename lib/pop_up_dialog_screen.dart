import 'package:flutter/material.dart';

class PopUpDialogScreen extends StatefulWidget {
  const PopUpDialogScreen({super.key});

  @override
  State<PopUpDialogScreen> createState() => _PopUpDialogScreenState();
}

class _PopUpDialogScreenState extends State<PopUpDialogScreen> {
  var isEnabled = true;
  var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: StatefulBuilder(builder: (context, customState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: isEnabled == true ? Colors.red : Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Pop Up Dialog screen"),
                  Switch(
                    value: isEnabled,
                    onChanged: (value) {
                      isEnabled = value;
                      customState(() {});
                    },
                  ),
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(textEditingController.text.toString());
              },
              child: const Text("Back"),
            ),
          ],
        );
      }),
    );
  }
}
