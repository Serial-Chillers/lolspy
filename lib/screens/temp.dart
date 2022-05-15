// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChampionsScreen extends StatelessWidget {
//   const ChampionsScreen({super.key});

//   static const String routeName = '/login';

//   static Route route() {
//     return PageRouteBuilder(
//       settings: const RouteSettings(name: routeName),
//       transitionDuration: const Duration(seconds: 0),
//       pageBuilder: (context, _, __) => BlocProvider(
//         create: (_) =>
//             Cubit(championRepo: context.read<Repo>())
//               ..getChampions(),
//         child: const ChampionsScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<Cubit, State>(
//       builder: (context, state) {
//         return Scaffold(
          
//         );
//       },
//     );
//   }
// }
