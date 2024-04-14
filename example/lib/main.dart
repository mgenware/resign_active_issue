import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:resign_active/resign_active.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _resignActivePlugin = ResignActive();
  AppLifecycleListener? _listener;

  @override
  void dispose() {
    _listener?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: OutlinedButton(
          onPressed: () async {
            _listener = AppLifecycleListener(
              onShow: () => print('Flutter showing'),
              onHide: () => print('Flutter hiding'),
              onResume: () => print('Flutter resuming'),
              onInactive: () => print('Flutter inactive'),
            );
            await _resignActivePlugin.pushViewController();
          },
          child: const Text('Push view controller'),
        )),
      ),
    );
  }
}
