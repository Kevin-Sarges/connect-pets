import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';

base class FeedState {}

final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}

final class LogoutSuccess extends FeedState {}

final class FeedSuccess extends FeedState {
  final List<PostEntity> post;

  FeedSuccess(this.post);
}

final class FeedError extends FeedState {
  final Failure error;

  FeedError(this.error);
}
