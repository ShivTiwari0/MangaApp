import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webtoon/core/ui.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/presentation/screen/detail_screen.dart';


class WebtoonCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final int totalChapters;
  final String summary;
  final WebtoonModel webtoon;

  const WebtoonCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.totalChapters,
    required this.summary,
    required this.webtoon,    
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(webtoon: webtoon),
                    ),
                  );
                } ,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        elevation: 8, // Higher elevation for stronger shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners for the card
        ),
        shadowColor: Colors.grey.withOpacity(0.5), // Soft shadow color
        child: Column(
          children: [
            // Image at the top
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ), // Only top corners should be rounded for the image
              child: CachedNetworkImage(
               imageUrl:  thumbnail,
                height: 180, // Larger image height
                width: double.infinity, // Full width to stretch across the card
                fit: BoxFit.cover, // Cover mode for better image scaling
              ),
            ),
            // Text content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.heading3.copyWith(
                      color: AppColors.accent,
                      fontSize: 20, // Emphasized title
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total Chapters: $totalChapters', // Bold chapter count
                    style: TextStyles.body1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    summary,
                    style: TextStyles.body2.copyWith(
                      color: AppColors.textLight, // Lighter summary text
                      fontSize: 14,
                    ),
                    maxLines: 3, // Allow a bit more space for summary text
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Button or Navigation
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16, bottom: 10),
              child: IconButton(
                icon: Icon(Icons.chevron_right, color: AppColors.accent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(webtoon: webtoon),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
