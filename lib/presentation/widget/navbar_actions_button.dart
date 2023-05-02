import 'package:aabhash_portfolio_website/presentation/animations/entrance_fader.dart';
import 'package:aabhash_portfolio_website/presentation/blocs/scroll_cubit/scroll_cubit.dart';
import 'package:aabhash_portfolio_website/presentation/configs/configs.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;
  NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);
  final ScrollCubit scrollCubit = sl<ScrollCubit>();

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: Space.h!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: MouseRegion(
          child: MaterialButton(
            splashColor: Colors.white54,
            highlightColor: Colors.white54,
            hoverColor: AppTheme.c!.shadowSub,
            onPressed: () {
              scrollCubit.scroll(index);
            },
            child: Padding(
              padding: Space.all(0.5, 0.45),
              child: Text(
                label,
                style: AppText.l1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
