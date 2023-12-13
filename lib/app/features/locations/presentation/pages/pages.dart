import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/app/core/presentation/widgets/widgets.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/app/features/locations/domain/usecases/usecases.dart';
import 'package:weather_app/app/features/locations/presentation/cubit/locations_cubit.dart';
import 'package:weather_app/app/features/locations/presentation/widgets/widgets.dart';
import 'package:weather_app/injection_container.dart';
import 'package:weather_app/l10n/l10n.dart';

part 'locations_page.dart';
