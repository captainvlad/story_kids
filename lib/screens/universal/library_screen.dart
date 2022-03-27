import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/screens/mobile/library_screen.dart';
import 'package:story_kids/screens/tablet/library_screen.dart';
import 'package:story_kids/screens/desktop/library_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const LibraryScreenDesktop(),
      tablet: const LibraryScreenTablet(),
      mobile: const LibraryScreenMobile(),
    );
  }
}
