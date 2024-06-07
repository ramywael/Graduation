import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EditDataStates{}

class EditDataInitialState extends EditDataStates{}


class GetNewDataStateLoading extends EditDataStates{}
class GetNewDataStateSuccess extends EditDataStates{}
class GetNewDataStateFailure extends EditDataStates{}