import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/bloc/user_event.dart';
import 'package:test_flutter_application/bloc/user_state.dart';
import 'package:test_flutter_application/models/client.dart';
import 'package:test_flutter_application/models/user.dart';
import 'package:test_flutter_application/services/auth.dart';
import 'package:test_flutter_application/services/user_repository.dart';

import 'client_event.dart';
import 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final AuthService _authService;

  ClientBloc(this._authService) : super(ClientNotAuthorizedState());

  @override
  Stream<ClientState> mapEventToState(ClientEvent event) async* {
    if (event is ClientAuthorizeEvent) {
      yield ClientAuthorizingState();
      try {
        final Client? _client = await _authService.singInWithEmailAndPassword(
            event.email, event.password);
        yield ClientAuthorizedState();
      } catch (e) {
        print(e.toString());
        yield ClientErrorState();
      }
    } else if (event is ClientRegisterEvent) {
      yield ClientRegistratingState();
      try {
        final Client? _client = await _authService
            .registerInWithEmailAndPassword(event.email, event.password);
        yield ClientRegisteredState();
      } catch (e) {
        print(e.toString());
        yield ClientErrorState();
      }
    } else if (event is ClientLogoutEvent) {}
  }
}
