import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/bl/main/main_page_cubit.dart';
import 'package:website_p/widgets/animated_text_widget.dart';

@RoutePage()
class MainDisplayPage extends StatefulWidget {
  const MainDisplayPage({super.key});

  @override
  State<MainDisplayPage> createState() => _MainDisplayPageState();
}

class _MainDisplayPageState extends State<MainDisplayPage> {
  String animatedText = 'Hello World'; // Move it to the State class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16),
        child: BlocBuilder<MainPageCubit, MainPageState>(
          builder: (context, state) {
            if (state is MainPageInitial) {
              return Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        border: Border.all(color: Color(0xff3d424a), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.apple,
                                      color: Color(0xff21b4e1), size: 32),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 28,
                                  ),
                                  Icon(
                                    Icons.home,
                                    size: 32,
                                  ),
                                  AnimatedTextWidget(
                                    text: state.animatedText,
                                    key: Key(state.animatedText),
                                  ),
                                ]),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<MainPageCubit>()
                                        .updateAnimatedText('about');
                                  },
                                  child: Text('About Me')),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<MainPageCubit>()
                                        .updateAnimatedText('blog');
                                  },
                                  child: Text('My Blog')),


                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
