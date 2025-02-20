import 'package:ev_app/assets/app_theme.dart';
import 'package:ev_app/pages/authentication/log_in.dart';
import 'package:ev_app/providers/theme_provider.dart';
import 'package:ev_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // Research this out
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Initialize the provider
    ThemeProvider Theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Theme.darkThemeEnabled ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: const LogIn(),
    );
  }
}
