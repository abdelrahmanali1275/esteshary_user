import 'package:flutter/material.dart';
import 'package:naraakom/core/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black900,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: PhotoView(
          maxScale: PhotoViewComputedScale.covered,
          backgroundDecoration:  BoxDecoration(
              color: AppColors.black900
          ),
          loadingBuilder: (context, event) {
            return Container(
              color: AppColors.black900,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
          imageProvider: NetworkImage(
            url,
            // height: 200,
          ),
        ),
      ),
    );
  }
}