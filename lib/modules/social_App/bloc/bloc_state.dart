abstract class SocialCStates {}

class SocialInitialState extends SocialCStates {}

class SocialBottonNavlState extends SocialCStates {}

class SocialLodingState extends SocialCStates {}

class SocialLCheanModeState extends SocialCStates {}

class SocialSuccessState extends SocialCStates {
  // final String uId;

  // SocialSuccessState(this.uId);
}

class SocialErrorState extends SocialCStates {
  final String error;

  SocialErrorState(this.error);
}

class SocialGetAllUseraLodingState extends SocialCStates {}

class SocialGetAllUseraSuccessState extends SocialCStates {}

class SocialGetAllUsersErrorState extends SocialCStates {
  final String error;

  SocialGetAllUsersErrorState(this.error);
}

class SocialGetMessageSuccessState extends SocialCStates {}

class SocialGetMessageErrorState extends SocialCStates {}

class SocialSendMessageSuccessState extends SocialCStates {}

class SocialSendMessageErrorState extends SocialCStates {}
