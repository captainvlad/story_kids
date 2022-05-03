import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:story_kids/ui/client/screens/desktop/library_screen.dart';
import 'package:story_kids/ui/client/screens/mobile/library_screen.dart';
import 'package:story_kids/ui/client/screens/tablet/LibraryScreen.dart';

class LibraryScreen extends StatelessWidget {
  static const String path = "library";

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
