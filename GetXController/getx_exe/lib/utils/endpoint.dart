class ApiEndpoint{
  static final String baseUrl = "http://restapi.adequateshop.com";
  static AuthApiEndpoint authApiEndpoint = AuthApiEndpoint();
}

class AuthApiEndpoint {
  final String register = "/api/authaccount/registration";
  final String login = "/api/authaccount/login";
}