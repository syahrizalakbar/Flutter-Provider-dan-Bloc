import 'package:flutter/material.dart';
import 'package:flutter_app_provider/bloc_example/bloc/get_post_bloc.dart';
import 'package:flutter_app_provider/bloc_example/bloc/get_post_event.dart';
import 'package:flutter_app_provider/bloc_example/bloc/get_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: BlocProvider<GetPostBloc>(
        create: (context) => GetPostBloc(GetPostInitial()),
        child: BlocConsumer<GetPostBloc, GetPostState>(
          listener: (context, state) {
            if (state is GetPostError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (BuildContext context, state) {
            if (state is GetPostInitial) {
              BlocProvider.of<GetPostBloc>(context).add(EventGetPost());
            }

            if (state is GetPostLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetPostSuccess) {
              return ListView.builder(
                itemCount: state.listPost.length,
                itemBuilder: (context, index) {
                  return Text(state.listPost[index].body);
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
