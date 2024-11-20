import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_form.dart';
import 'join_us_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _downloadKey = GlobalKey();
  final GlobalKey _joinUsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final String title = "Local Tour";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        const AssetImage('assets/images/google_play_store.png'), context);
    precacheImage(const AssetImage('assets/images/app_store.png'), context);
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Logo + Local Tour
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/Logo.svg',
                      fit: BoxFit.contain,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Stack(
                    children: [
                      // Stroke layer for "Local Tour" text
                      Text(
                        'Local Tour',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = const Color(
                                  0xFFEB8A1E), // Stroke color (orange)
                          ),
                        ),
                      ),
                      // Fill layer for "Local Tour" text
                      Text(
                        'Local Tour',
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 30,
                            color: Color(0xFF0C3344), // Fill color (dark teal)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Spacer to push the row of buttons to the far right
              // Navigation Buttons
              Row(
                children: [
                  TextButton(
                    onPressed: () => _scrollToSection(_homeKey),
                    child: const Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _scrollToSection(_featuresKey),
                    child: const Text(
                      "Features",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _scrollToSection(_downloadKey),
                    child: const Text(
                      "Download",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        _launchURL('https://www.facebook.com/fakepage'),
                    child: const Text(
                      "FanPage",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _scrollToSection(_joinUsKey),
                    child: const Text(
                      "Join Us",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _scrollToSection(_contactKey),
                    child: const Text(
                      "Contact",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Home Section
              Container(
                key: _homeKey,
                height: MediaQuery.of(context)
                    .size
                    .height, // Full height of the screen
                child: Stack(
                  children: [
                    // Fixed background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/hcmc.png', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Foreground content
                    Container(
                      color: Colors.black
                          .withOpacity(0.7), // Optional dark overlay
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.mobile_friendly,
                                    size: 36, color: Colors.orange),
                                SizedBox(width: 20),
                                SelectableText(
                                  "APP",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SelectableText(
                                  "Local Tour",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width:
                                      180, // Adjust the width of the underline
                                  height: 5, // Thickness of the underline
                                  color: Colors.white, // Color of the underline
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const SelectableText(
                              " • Travelers are increasingly seeking authentic local experiences rather than just visiting popular tourist spots.\n "
                              " • There is a demand for specialized tools to guide visitors to lesser-known local attractions and provide detailed historical and cultural information. \n "
                              " • Lack of detailed information about local destinations, Difficulty in planning personal travel and Lack of effective search tools for dining and shopping locations are what travelers are facing. \n "
                              " => LOCAL TOUR APP IS THE TOOL TO SOLVE THESE NEEDS AND PROBLEMS OF THEIRS.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      _scrollToSection(_featuresKey),
                                  icon: const Icon(
                                    Icons.featured_play_list,
                                    color: Colors.black, // Black icon
                                  ),
                                  label: const Text(
                                    "Features",
                                    style: TextStyle(
                                      color: Colors.black, // Black text
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // White background
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Optional: Rounded corners
                                      side: const BorderSide(
                                          color: Colors.black), // Black border
                                    ),
                                    elevation:
                                        10, // Slight shadow for 3D effect
                                  ),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      _scrollToSection(_downloadKey),
                                  icon: const Icon(
                                    Icons.download,
                                    color: Colors.black, // Black icon
                                  ),
                                  label: const Text(
                                    "Download",
                                    style: TextStyle(
                                      color: Colors.black, // Black text
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // White background
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Optional: Rounded corners
                                      side: const BorderSide(
                                          color: Colors.black), // Black border
                                    ),
                                    elevation:
                                        10, // Slight shadow for 3D effect
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Features Section
              Container(
                key: _featuresKey,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // Fixed background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/hcm2.png', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Foreground content
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText(
                            " • Features • ",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: _FeatureBox(
                                    title: "View Detail's Place",
                                    icon: Icons.details,
                                    image: 'assets/images/detail.png',
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: _FeatureBox(
                                    title: 'Search Places',
                                    icon: Icons.search,
                                    image: 'assets/images/search.png',
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: _FeatureBox(
                                    title: 'Set Schedule',
                                    icon: Icons.schedule,
                                    image: 'assets/images/schedule.png',
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: _FeatureBox(
                                    title: 'Create Post',
                                    icon: Icons.post_add,
                                    image: 'assets/images/post.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Download Section
              Container(
                key: _downloadKey,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/hcm3.png', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Semi-transparent overlay and content
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText(
                            " • Download • ",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SelectableText(
                            "100,000,000 \nOver 100 million users on Google Play Store",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text and buttons evenly
                            children: [
                              // Google Play Button
                              ElevatedButton(
                                  onPressed: () {
                                    // Add your download action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Optional rounded corners
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/google_play_store.png',
                                    width: 200,
                                    fit: BoxFit.contain,
                                  )),
                              const SizedBox(width: 20),
                              // App Store Button with Development Text
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(
                                        'assets/images/app_store.png',
                                        width: 200,
                                        fit: BoxFit.contain,
                                      )),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "😉 still in development,\nplease wait patiently",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Join Us Section
              Container(
                key: _joinUsKey, // For scrolling to this section
                child: const JoinUsSection(), // Add your JoinUsSection here
              ),
              // Contact Section
              Container(
                key: _contactKey,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/contact.png', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Column(children: [
                        SizedBox(height: 20,),
                        const SelectableText(
                          " • Contact • ",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const SelectableText(
                          "Have questions? Reach out to us via the following methods:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on),
                                SelectableText(
                                    "Address: Lot E2a-7, Road D1, D1 Street, Long Thanh My, Thu Duc City, Ho Chi Minh City 700000"),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.email),
                                SelectableText("Email: localtoursep@gmail.com"),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.phone),
                                SelectableText("Phone: +84000000000"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ContactForm(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                size: 48,
                                Icons.facebook,
                                color: Colors.blue,
                              ),
                              onPressed: () =>
                                  _launchURL('https://www.facebook.com/fakepage'),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            IconButton(
                              icon: const FaIcon(
                                size: 48,
                                FontAwesomeIcons.twitter,
                                color: Colors.blue,
                              ),
                              onPressed: () =>
                                  _launchURL('https://www.twitter.com/fakepage'),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            IconButton(
                              icon: const FaIcon(
                                size: 48,
                                FontAwesomeIcons.youtube,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _launchURL('https://www.youtube.com/fakepage'),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            IconButton(
                              icon: const FaIcon(
                                size: 48,
                                FontAwesomeIcons.instagram,
                                color: Colors.pinkAccent,
                              ),
                              onPressed: () =>
                                  _launchURL('https://www.instagram.com/fakepage'),
                            ),
                          ],
                        ),

                      ]),
                    ),
                  ],
                ),
              ),
              // Footer
              Container(
                width: double.infinity,
                  color: Color(0xFF0C3344),
                padding: const EdgeInsets.all(10),
                child: const SelectableText(
                  "Local Tour Company",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFEB8A1E), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureBox extends StatefulWidget {
  final String title;
  final IconData icon;
  final String image;

  const _FeatureBox({
    Key? key, // Added Key parameter
    required this.title,
    required this.icon,
    required this.image,
  }) : super(key: key); // Passed Key to super

  @override
  State<_FeatureBox> createState() => _FeatureBoxState();
}

class _FeatureBoxState extends State<_FeatureBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut, // Smooth transition
        width: 200, // Keep the width consistent
        height: _isHovered ? 500 : 250, // Height increases on hover
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.1)) // Scale the box
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row for title and icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(widget.icon, size: 20, color: Colors.orange),
                ],
              ),
              const SizedBox(height: 10),
              // Display the image
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.image, // Path to the image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
