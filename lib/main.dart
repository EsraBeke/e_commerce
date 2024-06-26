import 'package:e_commerce/constans/theme_data.dart';
import 'package:e_commerce/providers/theme_provider.dart';
import 'package:e_commerce/root_screen.dart';
import 'package:e_commerce/widgets/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eccomerce Ap ',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootScreen(),
            routes: {
              ProductDetailScreen.routName: (context) =>
                  const ProductDetailScreen(),
            });
      }),
    );
  }
}
