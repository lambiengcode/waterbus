// Mocks generated by Mockito 5.4.2 from annotations
// in waterbus/test/features/meeting/domain/usecases/create_meeting_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i4;

// Package imports:
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// Project imports:
import 'package:waterbus/core/error/failures.dart' as _i5;
import 'package:waterbus/features/meeting/domain/entities/meeting.dart' as _i6;

import 'package:waterbus/features/meeting/domain/entities/participant.dart'
    as _i10;
import 'package:waterbus/features/meeting/domain/repositories/meeting_repository.dart'
    as _i3;
import 'package:waterbus/features/meeting/domain/usecases/create_meeting.dart'
    as _i7;
import 'package:waterbus/features/meeting/domain/usecases/get_info_meeting.dart'
    as _i9;
import 'package:waterbus/features/meeting/domain/usecases/leave_meeting.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MeetingRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMeetingRepository extends _i1.Mock implements _i3.MeetingRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Meeting>>> getRecentJoined() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecentJoined,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Meeting>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Meeting>>(
          this,
          Invocation.method(
            #getRecentJoined,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Meeting>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Meeting>>(
          this,
          Invocation.method(
            #getRecentJoined,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Meeting>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>> createMeeting(
          _i7.CreateMeetingParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #createMeeting,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
            _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #createMeeting,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
                _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #createMeeting,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>> updateMeeting(
          _i7.CreateMeetingParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateMeeting,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
            _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #updateMeeting,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
                _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #updateMeeting,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>> joinMeeting(
          _i7.CreateMeetingParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #joinMeeting,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
            _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #joinMeeting,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
                _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #joinMeeting,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>> leaveMeeting(
          _i8.LeaveMeetingParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #leaveMeeting,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
            _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #leaveMeeting,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
                _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #leaveMeeting,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>> getInfoMeeting(
          _i9.GetMeetingParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInfoMeeting,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
            _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #getInfoMeeting,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>.value(
                _FakeEither_0<_i5.Failure, _i6.Meeting>(
          this,
          Invocation.method(
            #getInfoMeeting,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Meeting>>);
  @override
  _i2.Either<_i5.Failure, bool> cleanAllRecentJoined() => (super.noSuchMethod(
        Invocation.method(
          #cleanAllRecentJoined,
          [],
        ),
        returnValue: _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #cleanAllRecentJoined,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #cleanAllRecentJoined,
            [],
          ),
        ),
      ) as _i2.Either<_i5.Failure, bool>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i10.Participant>> getParticipantById(
          int? participantId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getParticipantById,
          [participantId],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i10.Participant>>.value(
                _FakeEither_0<_i5.Failure, _i10.Participant>(
          this,
          Invocation.method(
            #getParticipantById,
            [participantId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i10.Participant>>.value(
                _FakeEither_0<_i5.Failure, _i10.Participant>(
          this,
          Invocation.method(
            #getParticipantById,
            [participantId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i10.Participant>>);
}
