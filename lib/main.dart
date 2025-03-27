import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo de Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
      ),
      home: const WidgetsPage(),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets en Flutter')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomWidgets(),
      ),
    );
  }
}

class CustomWidgets extends StatefulWidget {
  const CustomWidgets({super.key});

  @override
  _CustomWidgetsState createState() => _CustomWidgetsState();
}

class _CustomWidgetsState extends State<CustomWidgets> {
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCard(
          child: const Text(
            '👋 Hola, este es un texto simple.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const SizedBox(height: 20),
        _buildCard(child: const CustomLogoWidget()), 
        const SizedBox(height: 20),
        _buildCard(
          child: TextField(
            decoration: InputDecoration(
              labelText: '✍️ Escribe algo...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onChanged: (value) {
              setState(() {
                userInput = value;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        _buildCard(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('📩 Texto ingresado: $userInput'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              );
            },
            child: const Text(
              'Mostrar texto',
              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png', 
        height: 120,
      ),
    );
  }
}
