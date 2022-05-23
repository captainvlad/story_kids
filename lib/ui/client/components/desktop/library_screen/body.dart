import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/carousele_widget.dart';
import 'package:story_kids/ui/client/components/desktop/library_screen/category_view_desktop.dart';

class LibraryBodyDesktop extends StatelessWidget {
  const LibraryBodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardAspectRatio = 16 / 9;
    InitBloc _iBloc = BlocProvider.of<InitBloc>(context);
    UiManager uiManager = UiManager(context);

    Map<String, List<MediaContent>> contentByCategory = groupBy(
      _iBloc.state.contentList,
      (MediaContent element) => element.category,
    );

    List<Widget> columnWidgets = [
      Carousele(
        height: uiManager.blockSizeVertical * 60,
        width: double.infinity,
        uiManager: uiManager,
        media: _iBloc.state.contentList,
        mobile: false,
      ),
      SizedBox(
        height: uiManager.blockSizeVertical * 4,
        width: double.infinity,
      ),
    ];

    columnWidgets.addAll(
      contentByCategory.keys
          .map(
            (categoryName) => Padding(
              padding: EdgeInsets.only(
                bottom: uiManager.blockSizeVertical * 4,
              ),
              child: CategoryViewDesktop(
                content: contentByCategory[categoryName] ?? [],
                cardHeight: uiManager.mobileSizeUnit * 20,
                cardWidth: uiManager.mobileSizeUnit * 20 * cardAspectRatio,
                uiManager: uiManager,
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
