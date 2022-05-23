import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/carousele_widget.dart';
import 'package:story_kids/ui/client/components/mobile/library_screen/category_view_mobile.dart';

class LibraryBodyMobile extends StatelessWidget {
  const LibraryBodyMobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double cardAspectRatio = 16 / 9;
    UiManager uiManager = UiManager(context, mode: "avg");
    InitBloc _iBloc = BlocProvider.of<InitBloc>(context);

    Map<String, List<MediaContent>> contentByCategory = groupBy(
      _iBloc.state.contentList,
      (MediaContent element) => element.category,
    );

    List<Widget> columnWidgets = [
      Carousele(
        height: uiManager.mobileSizeUnit * 30,
        width: double.infinity,
        uiManager: uiManager,
        media: _iBloc.state.contentList,
        mobile: true,
      ),
      SizedBox(
        height: uiManager.blockSizeVertical * 4,
      )
    ];

    columnWidgets.addAll(
      contentByCategory.keys
          .map(
            (categoryName) => Padding(
              padding: EdgeInsets.only(
                bottom: uiManager.blockSizeVertical * 4,
              ),
              child: CategoryViewMobile(
                content: contentByCategory[categoryName] ?? [],
                uiManager: uiManager,
                cardWidth: uiManager.mobileSizeUnit * 35 * cardAspectRatio,
                cardHeight: uiManager.mobileSizeUnit * 35,
                categoryName: categoryName,
                visibleItemsCount: 4,
              ),
            ),
          )
          .toList(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: columnWidgets,
    );
  }
}
