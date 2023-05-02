import 'package:aabhash_portfolio_website/presentation/blocs/drawer_cubit/drawer_cubit.dart';
import 'package:aabhash_portfolio_website/presentation/blocs/scroll_cubit/scroll_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  sl.registerLazySingleton<ScrollCubit>(() => ScrollCubit());
  sl.registerLazySingleton<DrawerCubit>(() => DrawerCubit());
}
