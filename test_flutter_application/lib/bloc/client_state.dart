import 'package:test_flutter_application/models/client.dart';

abstract class ClientState {}

class ClientNotAuthorizedState extends ClientState {}

class ClientAuthorizingState extends ClientState {}

class ClientRegistratingState extends ClientState {}

class ClientAuthorizedState extends ClientState {}

class ClientRegisteredState extends ClientState {}

class ClientErrorState extends ClientState {}
