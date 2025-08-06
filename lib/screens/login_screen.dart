import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isMorning = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background Images
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              _isMorning ? "assets/morning.jpg" : "assets/night.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Main widgets
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      toggleButton("Morning", true),
                      toggleButton("Night", false)
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  _isMorning ? "Good Morning" : "Good Night",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Enter your Information below",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 32),
                Text('Email',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 8),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2), width: 1),
                      )),
                ),
                const SizedBox(height: 32),
                Text('Password',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 8),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2), width: 1),
                      )),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget toggleButton(String label, bool morning) {
    final isSelected = _isMorning == morning;

    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          _isMorning = morning;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
