import 'package:equatable/equatable.dart';
import '../../../../core/app_export.dart';
import 'package:plugin_camera/presentation/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(super.initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }
  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
  }
}

