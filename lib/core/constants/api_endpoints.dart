class ApiEndpoints {
  static const String baseUrl = 'https://service.waterbus.tech/busapi/v1/';
  static const String wsUrl = 'https://sfu.waterbus.tech';

  // Auth
  static const String auth = 'auth';
  static const String presignedUrlS3 = 'auth/presigned-url';

  // Users
  static const String users = 'users';

  // Meetings
  static const String meetings = 'meetings';
  static const String joinWithPassword = 'meetings/join/password';
  static const String joinWithoutPassword = 'meetings/join';

  // Chats
  static const String chats = 'chats';
}
