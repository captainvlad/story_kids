import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_kids/blocs/client/init_bloc.dart';
import 'package:story_kids/managers/client/ui_manager.dart';
import 'package:story_kids/models/client/media_content.dart';
import 'package:story_kids/ui/client/components/util_views/carousele_widget.dart';
import 'package:story_kids/ui/client/components/tablet/library_screen/category_view_tablet.dart';

class LibraryBodyTablet extends StatelessWidget {
  const LibraryBodyTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardAspectRatio = 16 / 9;
    UiManager uiManager = UiManager(context);
    InitBloc _iBloc = BlocProvider.of<InitBloc>(context);

    Map<String, List<MediaContent>> contentByCategory = groupBy(
      _iBloc.state.contentList,
      (MediaContent element) => element.category,
    );

    List<Widget> columnWidgets = [
      Carousele(
        height: uiManager.mobileSizeUnit * 50,
        width: double.infinity,
        uiManager: uiManager,
        media: _iBloc.state.contentList,
        mobile: true,
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
              child: CategoryViewTablet(
                content: contentByCategory[categoryName] ?? [],
                visibleItemsCount: 4,
                uiManager: uiManager,
                categoryName: categoryName,
                cardWidth: uiManager.mobileSizeUnit * 30 * cardAspectRatio,
                cardHeight: uiManager.mobileSizeUnit * 30,
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
