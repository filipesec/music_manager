import 'package:flutter/material.dart';
import 'package:music_manager/core/colors/colors_keys.dart';
import 'package:music_manager/features/home/widgets/filter.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String selectedCategory = 'Todos';

  @override
  Widget build(BuildContext build){
    return Scaffold(
      backgroundColor: ColorsKeys.bgDefault,
      appBar: AppBar(
        backgroundColor: ColorsKeys.bgDefault,
        elevation: 1,
        centerTitle: true,
        title: Text('SHii', style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 32, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
          child: Image.asset('assets/images/theme.png', scale: 20),
          ),
        ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: EdgeInsets.all(8),
            child: Text('Biblioteca', style: TextStyle(color: ColorsKeys.textPrimary, fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            //filtro
            Padding(
              padding: EdgeInsets.all(8),
            child: Filter(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            ),
          ]
        ),
    );
  }
}