part of '../main_section.dart';

class Body extends StatelessWidget {
   Body({
    Key? key,
  }) : super(key: key);

final ScrollCubit scrollCubit = sl<ScrollCubit>();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ScrollCubit, ScrollState>(
      bloc: scrollCubit,
      builder: (context, state) {
        return ListView.builder(
          controller: scrollCubit.scrollController,
          itemCount: BodyUtils.views.length,
          itemBuilder: (context, index) => BodyUtils.views[index],
        );
      },
    );
  }
}
