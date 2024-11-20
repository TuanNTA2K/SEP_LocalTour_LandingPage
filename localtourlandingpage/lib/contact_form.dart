import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text.trim();
      final String subject = Uri.encodeComponent(_subjectController.text.trim());
      final String message = Uri.encodeComponent(_messageController.text.trim());

      final String mailtoLink = "mailto:localtoursep@gmail.com?subject=$subject&body=$message";

      try {
        if (await canLaunchUrl(Uri.parse(mailtoLink))) {
          await launchUrl(Uri.parse(mailtoLink));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not open email app")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to send email")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Email Field
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: "Your email",
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Subject Field
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.subject),
                    hintText: "Subject",
                    labelText: "Subject",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the subject";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Message Field
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: "Message",
                    labelText: "Message",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your message";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Send Button
              ElevatedButton.icon(
                onPressed: _sendEmail,
                icon: const Icon(Icons.send),
                label: const Text("Send"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
