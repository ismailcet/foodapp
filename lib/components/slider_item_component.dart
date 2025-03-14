import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const SliderItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, top: 90),
        child: Column(
          children: [
            CachedNetworkImage(
              width: width * .9,
              height: height * .4,
              imageUrl: widget.image,
              placeholder: (BuildContext context, String url) {
                return Container(
                  color: Colors.grey,
                );
              },
              errorWidget: (context, url, error) => SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: const Color(0xFF98A8B8),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              widget.title,
              style: GoogleFonts.sen(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              widget.subtitle,
              style: GoogleFonts.sen(fontSize: 16, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
