part of 'meeting_bloc.dart';

abstract class MeetingState extends Equatable {
  const MeetingState({
    this.meeting,
    this.participant,
    this.callState,
  });

  final Meeting? meeting;
  final Participant? participant;
  final CallState? callState;

  @override
  List<Object?> get props => [
        meeting,
        participant,
        callState,
        identityHashCode(this),
      ];
}

class MeetingInitial extends MeetingState {
  const MeetingInitial();
}

class PreJoinMeeting extends MeetingState {
  const PreJoinMeeting({
    required super.meeting,
    required super.participant,
    required super.callState,
  });
}

class JoinedMeeting extends MeetingState {
  const JoinedMeeting({
    required super.meeting,
    required super.participant,
    required super.callState,
  });
}
