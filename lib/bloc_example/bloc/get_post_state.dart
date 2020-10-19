import 'package:equatable/equatable.dart';
import 'package:flutter_app_provider/model/res_posts.dart';

abstract class GetPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostInitial extends GetPostState {}

class GetPostLoading extends GetPostState {

  GetPostLoading() {
    print(toString());
  }

  @override
  String toString() {
    return 'GetPostLoading{}';
  }

// @override
  // String toString() {
  //   return 'GetPostLoading{}';
  // }
}

class GetPostError extends GetPostState {
  final String message;

  GetPostError(this.message) {
    print(toString());
  }


  @override
  String toString() {
    return 'GetPostError{message: $message}';
  }

  @override
  List<Object> get props => super.props..add(message);
}

class GetPostSuccess extends GetPostState {
  final List<ResPosts> listPost;

  GetPostSuccess(this.listPost) {
    print(toString());
  }

  @override
  String toString() {
    return 'GetPostSuccess{listPost: $listPost}';
  }

  @override
  List<Object> get props => super.props..add(listPost);
}
