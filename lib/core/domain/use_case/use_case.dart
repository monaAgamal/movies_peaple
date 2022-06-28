import 'package:equatable/equatable.dart';

abstract class UseCase<Param, ReturnType> {
  ReturnType call(Param param);
}

class NoParams {}
