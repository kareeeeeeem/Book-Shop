import 'package:bookly/features/home/presentation/widgets/custom_drawer.dart';
import 'package:bookly/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        body: HomeViewBody(),
      ),
    );
  }
}
