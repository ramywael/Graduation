abstract class ChatStates {}

class ChatInitialState extends ChatStates {}


class SendMessageState extends ChatStates {}

class ListeningState extends ChatStates{}

class ScrollDownStateSuccess extends ChatStates{}
class ScrollDownStateFailure extends ChatStates{}

class BuildMessageListState extends ChatStates{}
class ErrorState extends ChatStates{}
class WaitingState extends ChatStates{}
class ShowListViewState extends ChatStates{}


class BuildMessageItemState extends ChatStates{}

class BuildUserInputState extends ChatStates{}



