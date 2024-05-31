import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class WeatherBlocObserver extends BlocObserver {
  final Logger logger = Logger();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('BlocObserver: onEvent $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i('BlocObserver: onChange $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    logger.i('BlocObserver: onTransition $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('BlocObserver: onError $error');
  }
}
