import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naraakom/core/utils/app_strings.dart';

import 'package:naraakom/features/home/presentation/widgets/home_screen_body.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'manager/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QueryDocumentSnapshot> data = [];

  getData()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('Doctors').get();
    data.addAll(querySnapshot.docs);
    setState(() {
    });
  }
  void initState(){
    getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        //drawer: Drawer(),
        appBar: CustomAppBar(
          widget: SizedBox(),
          text: AppStrings.home,
        ),
        body: HomeScreenBody(data: data,),
      ),
    );
  }
}
