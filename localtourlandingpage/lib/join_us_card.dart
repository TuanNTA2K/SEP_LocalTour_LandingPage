import 'package:flutter/material.dart';

class JoinUsCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final String imagePath;
  final VoidCallback onButtonPressed;

  const JoinUsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.imagePath,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath, // Background image
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                SelectableText(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: onButtonPressed,
                  label: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(Icons.touch_app, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black),
                    ),
                    elevation: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
