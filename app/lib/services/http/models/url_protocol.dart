enum URLProtocol {
  http,
  https;

  String toUrlString() {
    return "${toString().split('.').last}://";
  }
}
