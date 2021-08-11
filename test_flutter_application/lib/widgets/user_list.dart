import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/bloc/user_bloc.dart';
import 'package:test_flutter_application/bloc/user_state.dart';
import 'package:test_flutter_application/view/user_info.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserList();
  }
}

class _UserList extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text('No data receiver, press load button'),
        );
      }

      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserInfo(
                              state.loadedUser[index].name,
                              state.loadedUser[index].location,
                              state.loadedUser[index].picture)));
                    },
                    leading:
                        Image.network(state.loadedUser[index].picture.large),
                    title: Column(
                      children: [
                        Text(state.loadedUser[index].name.first),
                        Text(state.loadedUser[index].location.city)
                      ],
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  ),
                ));
      }

      if (state is UserErrorState) {
        return Center(
          child: Text('Error fetching users'),
        );
      }
      return CircularProgressIndicator();
    });
  }
}
