import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:smar_notes/Views/Login%20View/login_view.dart';
import 'package:smar_notes/Views/Workbech%20View/workbenck_provider/workbenck_provider.dart';

import 'Hive/recording_model.dart';
import 'Views/Explorer View/explorer_view.dart';
import 'Views/Recording View/Provider/recording_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<AudioModel>(AudioModelAdapter());
  await Hive.openBox<AudioModel>('audioBox'); // Specify the type here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecordingProvider()),
        ChangeNotifierProvider(create: (_) => WorkbenchProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(415, 895),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ExplorerView(),
        ),
      ),
    );
  }
}
