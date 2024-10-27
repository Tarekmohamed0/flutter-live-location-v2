import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pages/home_screen.dart';
import '../cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: BlocProvider(
            create: (context) => SplashCubit()..checkInternetConnection(),
            child: BlocListener<SplashCubit, SplashState>(
              listener: (context, state) {
                if (state is SplashNoInternet) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No internet connection'),
                  ));
                } else if (state is SplashLoaded) {
                  // GoRouter.of(context).go('/SigninScreen');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/55942632?v=4'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'AlterSol',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text('Handel the\nenergy you\nproduce',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enjoy independent elctricity and monitor\nyour solar panel performance in real time',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Image(
                      image: AssetImage('assets/images/splash.png'),
                      height: 500),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       height: 10,
                  //       width: 10,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.blue,
                  //         shape: BoxShape.circle,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Container(
                  //       height: 10,
                  //       width: 10,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.black,
                  //         shape: BoxShape.circle,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Container(
                  //       height: 10,
                  //       width: 10,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.black,
                  //         shape: BoxShape.circle,
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
