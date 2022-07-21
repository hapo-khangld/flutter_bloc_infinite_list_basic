part of 'post_bloc.dart';

/// Tầng Presentation cần có 1 số thông tin để trình bày đúng cách.
/// 1: PostInitial - sẽ cho Presentation biết đươc nó cần hiển thị điều gì
/// khi các bài viết được loaded.
/// 2: PostSuccess - sẽ cho Presentation biết nó có nội dung hiển thị:
/// - posts: - đây là danh sách sẽ được hiển thị: dạng List
/// - hasReachedMax - sẽ cho Presentation biết nó có đạt dược số lượng bài đăng tối đa hay không.
/// 3: PostFailure - cho Presentation biết có lỗi xảy ra trong khi tìm nạp các bài đăng.
enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  /// Triển khai copyWith để chúng ta có thể sao chép một phiên bản của
  /// PostSuccess và cập nhật các thuộc tính bằng không trở lên một cách thuận tiện.
  /// (Điều này có ích sau này)
  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
