import 'package:equatable/equatable.dart';

class PinInfo extends Equatable {
  final String pin;

  PinInfo(this.pin);

  @override
  List<Object?> get props => [pin];
}
