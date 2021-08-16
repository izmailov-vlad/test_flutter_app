abstract class ClientEvent {}

class ClientAuthorizeEvent extends ClientEvent {
  String email;
  String password;
  ClientAuthorizeEvent({required this.email, required this.password});
}

class ClientRegisterEvent extends ClientEvent {
  String email;
  String password;
  ClientRegisterEvent({required this.email, required this.password});
}

class ClientLogoutEvent extends ClientEvent {}
