import 'package:flutter/material.dart';
import 'dart:io';

import 'package:music_manager/core/colors/colors_keys.dart';

class CardSection extends StatelessWidget{
  final String? cover;
  final String name;
  final String artist;
  final String gender;

  const CardSection({super.key, required this.cover, required this.name, required this.artist, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: cover != null && cover!.isNotEmpty 
                ? Image.file(File(cover!), fit: BoxFit.cover, height: 150) 
                : const Center(child: Icon(Icons.music_note, size: 50, color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 5),
              child: Text(name, style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Text(artist, style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 15)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0XFF37105E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(gender, style: const TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.edit, size: 20, color: ColorsKeys.textPrimary,),
                const SizedBox(width: 8),
                const Icon(Icons.delete_outline, size: 20, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
