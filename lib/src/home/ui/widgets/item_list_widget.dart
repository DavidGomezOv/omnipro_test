import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omnipro_test/src/home/view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class ItemListWidget extends ViewModelWidget<HomeViewModel> {
  final int index;

  const ItemListWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(.6)),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 60,
              height: 60,
              imageUrl: viewModel.items[index].thumbnailUrl ?? '',
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(viewModel.items[index].title ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
