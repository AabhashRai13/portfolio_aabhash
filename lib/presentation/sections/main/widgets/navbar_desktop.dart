part of '../main_section.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(),
      child: Row(
        children: [
          Space.xm!,
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavBarActionButton(
                  label: e.value,
                  index: e.key,
                ),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              color: AppTheme.c!.primaryLight!,
              onPressed: () {
                html.window.open(
                  StaticUtils.resume,
                  "docx",
                );
              },
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: const Text(
                  'RESUME',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Space.x!,
        ],
      ),
    );
  }
}

class NavBarTablet extends StatelessWidget {
  NavBarTablet({Key? key}) : super(key: key);
  final DrawerCubit _drawerCubit = sl<DrawerCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.v!,
      child: BlocBuilder<DrawerCubit, DrawerCubitState>(
        bloc: _drawerCubit,
        builder: (context, state) {
          return Row(
            children: [
              Space.x1!,
              IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(10),
                onPressed: () {
                  _drawerCubit.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              Space.x1!,
            ],
          );
        },
      ),
    );
  }
}
