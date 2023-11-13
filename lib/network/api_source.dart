import 'package:form_with_validation/network/api_client.dart';

class ApiSource {
  final api = ApiClient();

  Future contactUsRequest(data) async {
    return await api.sendRequest(path: '/contact/', method: 'post', body: data);
  }
}
