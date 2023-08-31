class Resource<T> {
  String? message;
  T? data;

  Resource.success(this.data);
  Resource.error(this.message);
}