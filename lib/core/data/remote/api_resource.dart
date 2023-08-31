class ApiResource<T> {
  String? message;
  T? data;

  ApiResource.success(this.data);
  ApiResource.error(this.message);
}