import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  final String apiBaseUrl;
  final String environment;
  const EnvConfig({required this.apiBaseUrl, required this.environment});
}

String _decryptBase64(String encrypted) {
  try {
    final bytes = base64.decode(encrypted);
    return utf8.decode(bytes);
  } catch (_) {
    return encrypted; // fallback: return as-is if not base64
  }
}

EnvConfig loadEnv() {
  // Read encrypted base URL from .env and decrypt at runtime.
  final encApi = dotenv.maybeGet('ENC_API_BASE_URL') ??
      'aHR0cHM6Ly9kdW1teS5hcGkuZXhhbXBsZS5jb20='; // base64 of https://dummy.api.example.com
  final api = _decryptBase64(encApi);

  final env = dotenv.maybeGet('ENV') ?? 'dev';
  return EnvConfig(apiBaseUrl: api, environment: env);
}