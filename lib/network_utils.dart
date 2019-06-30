import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkUtils {

	static dynamic authenticateUser(String email, String password , String uri) async {

		try {
			final response = await http.post(
				uri,
				body: {
					'email': email,
					'password': password
				}
			);

			final responseJson = json.decode(response.body);
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}




	static fetch(var authToken, var uri) async {
		try {
			final response = await http.get(
				uri,
				headers: {
					'Authorization': authToken
				},
			);

			final responseJson = json.decode(response.body);
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}
}