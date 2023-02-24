import 'package:flutter/material.dart';
import 'package:omnipro_test/src/core/base/base_screen.dart';
import 'package:omnipro_test/src/home/ui/widgets/item_list_widget.dart';
import 'package:omnipro_test/src/home/view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, viewModel, child) => BaseScreen(
        needsReloadWidget: true,
        reloadFunction: () async {
          viewModel.getItems();
        },
        loading: viewModel.loading,
        errorMessage: viewModel.errorMessage,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            controller: viewModel.scrollController,
            itemCount: viewModel.listItemCount,
            itemBuilder: (context, index) => ItemListWidget(index: index),
          ),
        ),
      ),
    );
  }
}
