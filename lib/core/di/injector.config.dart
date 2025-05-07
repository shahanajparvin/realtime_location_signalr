// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/location_repository_impl.dart' as _i553;
import '../../data/signalr/signalr_service.dart' as _i713;
import '../../data/signalr/signalr_service_imp.dart' as _i164;
import '../../domain/repositories/location_repository.dart' as _i816;
import '../../domain/usecases/listen_to_connection_status.dart' as _i321;
import '../../domain/usecases/receive_location.dart' as _i391;
import '../../domain/usecases/send_location.dart' as _i663;
import '../../presentation/cubit/connection_status_cubit.dart' as _i998;
import '../../presentation/cubit/location_cubit.dart' as _i523;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i713.SignalRService>(() => _i164.SignalRServiceImpl());
    gh.lazySingleton<_i816.LocationRepository>(
      () => _i553.LocationRepositoryImpl(gh<_i713.SignalRService>()),
    );
    gh.factory<_i391.ReceiveLocation>(
      () => _i391.ReceiveLocation(gh<_i816.LocationRepository>()),
    );
    gh.factory<_i663.SendLocation>(
      () => _i663.SendLocation(gh<_i816.LocationRepository>()),
    );
    gh.lazySingleton<_i321.ListenToConnectionStatus>(
      () => _i321.ListenToConnectionStatus(gh<_i816.LocationRepository>()),
    );
    gh.factory<_i998.ConnectionStatusCubit>(
      () => _i998.ConnectionStatusCubit(gh<_i321.ListenToConnectionStatus>()),
    );
    gh.factory<_i523.LocationCubit>(
      () => _i523.LocationCubit(
        gh<_i663.SendLocation>(),
        gh<_i391.ReceiveLocation>(),
      ),
    );
    return this;
  }
}
