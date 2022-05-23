import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:story_kids/managers/client/local_content_provider.dart';
import 'package:story_kids/ui/client/components/tablet/forgot_password_screen/body.dart';
import 'package:story_kids/ui/client/components/util_views/header_mobile.dart';

class ForgotPasswordScreenTablet extends StatelessWidget {
  const ForgotPasswordScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration screenDecoration =
        LocalContentProvider.instance.getScreenDecoration(
      preferredBackGroundImage:
          LocalContentProvider.instance.darkBackgroundImage,
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: screenDecoration,
        child: SingleChildScrollView(
          child: StickyHeader(
            header: const HeaderMobile(),
            content: const ForgetBodyTablet(),
          ),
        ),
      ),
    );
  }
}
