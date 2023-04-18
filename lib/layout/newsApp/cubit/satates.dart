abstract class NewsStates {}

class NewInitialState extends NewsStates {}

class NewBottonNavlState extends NewsStates {}

class GetApiLpLodingsState extends NewsStates {}

class GetApiSuccessState extends NewsStates {}

class GetApiErrorState extends NewsStates {
  final String error;

  GetApiErrorState(this.error);
}
