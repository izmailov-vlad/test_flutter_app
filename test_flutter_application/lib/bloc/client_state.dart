abstract class ClientState {}

class ClientEmptyState extends ClientState {}

class ClientLoadingState extends ClientState {}

class ClientLoadedState extends ClientState {
  List<dynamic> loadedUser;
  ClientLoadedState({required this.loadedUser});
}

class ClientErrorState extends ClientState {}
