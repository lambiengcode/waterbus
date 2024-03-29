// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:waterbus/core/constants/api_endpoints.dart';
import 'package:waterbus/core/types/http_status_code.dart';
import 'package:waterbus/core/utils/datasources/base_remote_data.dart';
import 'package:waterbus/features/meeting/domain/entities/meeting.dart';
import 'package:waterbus/features/meeting/domain/entities/participant.dart';

abstract class MeetingRemoteDataSource {
  Future<Meeting?> createMeeting({
    required Meeting meeting,
    required String password,
  });
  Future<bool> updateMeeting({
    required Meeting meeting,
    required String password,
  });
  Future<Meeting?> joinMeeting({
    required Meeting meeting,
    required String password,
  });
  Future<Meeting?> getInfoMeeting(int code);
  Future<Meeting?> leaveMeeting({
    required int code,
    required int participantId,
  });
  Future<Participant?> getParticipant(int participantId);
}

@LazySingleton(as: MeetingRemoteDataSource)
class MeetingRemoteDataSourceImpl extends MeetingRemoteDataSource {
  final BaseRemoteData _remoteData;
  MeetingRemoteDataSourceImpl(
    this._remoteData,
  );

  @override
  Future<Meeting?> createMeeting({
    required Meeting meeting,
    required String password,
  }) async {
    final Response response = await _remoteData.postRoute(
      ApiEndpoints.meetings,
      body: meeting.toMapCreate(password),
    );

    if (response.statusCode == StatusCode.created) {
      final Map<String, dynamic> rawData = response.data;
      return Meeting.fromMap(rawData);
    }

    return null;
  }

  @override
  Future<Meeting?> getInfoMeeting(int code) async {
    final Response response = await _remoteData.getRoute(
      '${ApiEndpoints.meetings}/$code',
    );

    if (response.statusCode == StatusCode.ok &&
        response.data.toString().isNotEmpty) {
      final Map<String, dynamic> rawData = response.data;
      return Meeting.fromMap(rawData);
    }

    return null;
  }

  @override
  Future<Meeting?> joinMeeting({
    required Meeting meeting,
    required String password,
  }) async {
    final int indexOfMyParticipant = meeting.participants.indexWhere(
      (participant) => participant.isMe,
    );

    final int? participantId = indexOfMyParticipant == -1
        ? null
        : meeting.participants[indexOfMyParticipant].id;

    final Response response = await _remoteData.postRoute(
      '${ApiEndpoints.meetings}/${meeting.code}${participantId != null ? '/rejoin/$participantId' : ''}',
      body: meeting.toMapCreate(password),
    );

    if (response.statusCode == StatusCode.created) {
      final Map<String, dynamic> rawData = response.data;
      return Meeting.fromMap(rawData).copyWith(
        latestJoinedAt: DateTime.now(),
      );
    }

    return null;
  }

  @override
  Future<Meeting?> leaveMeeting({
    required int code,
    required int participantId,
  }) async {
    final Response response = await _remoteData.deleteRoute(
      '${ApiEndpoints.meetings}/$code',
      body: {
        'participantId': participantId,
      },
    );

    if (response.statusCode == StatusCode.ok) {
      final Map<String, dynamic> rawData = response.data;
      return Meeting.fromMap(rawData);
    }

    return null;
  }

  @override
  Future<bool> updateMeeting({
    required Meeting meeting,
    required String password,
  }) async {
    final Response response = await _remoteData.putRoute(
      ApiEndpoints.meetings,
      meeting.toMapCreate(password),
    );

    if (response.statusCode == StatusCode.ok) {
      return true;
    }

    return false;
  }

  @override
  Future<Participant?> getParticipant(int participantId) async {
    final Response response = await _remoteData.getRoute(
      '${ApiEndpoints.participants}/$participantId',
    );

    if (response.statusCode == StatusCode.ok) {
      final Map<String, dynamic> rawData = response.data;
      return Participant.fromMap(rawData['participant']);
    }

    return null;
  }
}
