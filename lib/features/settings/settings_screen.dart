import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          Switch(value: _notifications, onChanged: _onNotificationChanged),
          CupertinoSwitch(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          SwitchListTile(
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text("Enable noticifactions"),
            subtitle: const Text("Subtitle"),
          ),
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text("Enable noticifactions"),
          ),
          Checkbox(value: _notifications, onChanged: _onNotificationChanged),
          CheckboxListTile(
            checkColor: Colors.white,
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text("Enable noticifactions"),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(date);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black,
                      ),
                      appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text(
              'What is your birthday?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Subtitle"),
          ),
          ListTile(
            title: const Text("Log out (iOS)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder:
                    (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go!"),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go!"),
                      actions: [
                        TextButton(
                          child: const Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (showCupertinoModalPopup)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go!"),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      message: const Text("Please don't go"),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Not log out"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes, Log out"),
                        ),
                      ],
                    ),
              );
            },
          ),

          const AboutListTile(),
        ],
      ),
    );
  }
}
