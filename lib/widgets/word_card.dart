import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/product/icons/icons.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';

class WordCard extends StatefulWidget {
  const WordCard({super.key});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: const Color(kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Word of the day",
                    style: kCardTextStyle.copyWith(color: Colors.white),
                  ),
                  const Icon(
                    Icons.volume_up_rounded,
                    size: 28,
                    color: kWhite,
                  )
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "VOLTIGEUR",
                      style: kCustomCardWordTextStyle,
                    ),
                    Text(
                      "A leaper; a vaulter.",
                      style: kCustomCardWordTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      ProjectIcons.like,
                      size: 32,
                      color: kWhite,
                    ),
                    Icon(
                      Icons.copy_outlined,
                      size: 32,
                      color: kWhite,
                    ),
                    Icon(
                      Icons.bookmark_outline_rounded,
                      size: 32,
                      color: kWhite,
                    ),
                    Icon(
                      Icons.share_outlined,
                      size: 32,
                      color: kWhite,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
