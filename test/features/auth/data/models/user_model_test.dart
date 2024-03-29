// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:waterbus/features/auth/data/models/user_model.dart';
import '../../../../constants/sample_file_path.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('user model', () {
    test(
      'should be a subclass of User entity',
      () {
        // arrange
        final Map<String, dynamic> userJson = jsonDecode(
          fixture(userModelSample),
        );

        // act
        final UserModel user = UserModel.fromMap(userJson);

        expect(user, isA<UserModel>());
      },
    );
    test('operator ==', () {
      final UserModel userModel1 = UserModel(
        id: 1,
        userName: "lambiengcode",
        fullName: "Kai Dao",
        accessToken: "token_1",
        refreshToken: "token_2",
        avatar: "https://lambiengcode.png",
      );
      final UserModel userModel2 = UserModel(
        id: 2,
        userName: "lambiengcode",
        fullName: "Kai Dao",
        accessToken: "token_1",
        refreshToken: "token_2",
        avatar: null,
      );

      // arrange
      final Map<String, dynamic> userJson = jsonDecode(
        fixture(userModelSample),
      );

      // act
      final UserModel user = UserModel.fromMap(userJson);

      expect(user == userModel1, true);
      expect(user == userModel2, false);
      expect(user.toString(), userModel1.toString());
    });
  });

  group('copyWith', () {
    test('should return new value', () {
      // arrange
      final Map<String, dynamic> userJson = jsonDecode(
        fixture(userModelSample),
      );

      // act
      final UserModel user = UserModel.fromMap(userJson);

      final UserModel userClone = user.copyWith(
        userName: "lambiengcode1",
        fullName: "Kai",
        accessToken: '1',
        refreshToken: '2',
        id: 2,
      );
      // assert
      expect(userClone.userName, "lambiengcode1");
      expect(userClone.fullName, "Kai");
      expect(userClone.userName != user.userName, true);
      expect(userClone.fullName != user.fullName, true);
      expect(userClone.accessToken != user.accessToken, true);
      expect(userClone.refreshToken != user.refreshToken, true);
      expect(userClone.id != user.id, true);
      expect(user.hashCode, user.copyWith().hashCode);
    });
  });

  group('fromMap', () {
    test(
      'fromMap - should return a valid model when the JSON',
      () {
        // arrange
        final Map<String, dynamic> userJson = jsonDecode(
          fixture(userModelSample),
        );

        // act
        final UserModel user = UserModel.fromMap(userJson);

        final UserModel userClone = user.copyWith(
          userName: "lambiengcode1",
          fullName: "Kai",
        );

        // assert
        expect(userClone, isNotNull);
      },
    );

    test(
      'fromMapRemote - should return a valid model when the JSON',
      () {
        // arrange
        final Map<String, dynamic> userJson = {
          "data": {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDVjYTAzOTE1MDAxYTQ5ZjczYjg5YTkiLCJpYXQiOjE2ODM4NjU0NzgsImV4cCI6MTY4Mzg2NjA3OH0.LwJ5iFGBUA9kdwOiDt5gNsvfR0ccN7FdoXcKSY2--b0",
            "refreshToken":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDVjYTAzOTE1MDAxYTQ5ZjczYjg5YTkiLCJpYXQiOjE2ODM4NjU0NzgsImV4cCI6MTY4Mzk1MTg3OH0.cGePZPTDYjEO5_OH7_Ek7wcL2vYNx4BhuMXq0dmqCRQ",
            "user": {
              "id": 1,
              "avatar": "lambiengcode",
              "googleId": "222223332",
              "fullName": "lambiengcode",
              "userName": "lam-bieng-code.714552",
              "status": 0,
              "activeStatus": 0,
              "createdAt":
                  "Thu May 11 2023 07:58:20 GMT+0000 (Coordinated Universal Time)",
              "modifiedAt":
                  "Thu May 11 2023 07:58:20 GMT+0000 (Coordinated Universal Time)",
            },
          },
          "message": "done",
        };

        // act
        final UserModel user = UserModel.fromMapRemote(userJson['data']);
        // assert
        expect(user.fullName, "lambiengcode");
        expect(user.avatar, isNotNull);
      },
    );
  });

  group('fromJson', () {
    test(
      'fromJson - should return a valid model when the JSON',
      () {
        // arrange
        final String userJson = fixture(userModelSample);

        // act
        final UserModel user = UserModel.fromJson(userJson);

        // assert
        expect(user, isNotNull);
      },
    );

    test(
      'toJson - should return a valid model when the JSON',
      () {
        // arrange
        final Map<String, dynamic> userJson = jsonDecode(
          fixture(userSample),
        );

        // act
        final UserModel user = UserModel.fromMap(userJson);

        // assert
        expect(user.toJson(), isNotNull);
      },
    );
  });
}
