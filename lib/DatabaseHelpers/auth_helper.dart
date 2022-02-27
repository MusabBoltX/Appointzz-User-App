import 'dart:async';
import 'dart:io';

import 'package:appointz_client/Services/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollectionHelper {
  late FirebaseFirestore firestore;
  final ToastMsg _toast = ToastMsg();

  initialize1() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> createUserCollection(String fullName, String email, String phoneNumber, String country) async {
    try {
      CollectionReference ref =
          await FirebaseFirestore.instance.collection('Doctors');

      String userId = ref.doc().id;

      await firestore.collection("Users Collection").add({
        'full_name': fullName,
        'email': email,
        'phone_number': phoneNumber,
        'country': country,
      });
    } on SocketException {
      _toast.showToast('Sign Failed Sockets Suspension');
      debugPrint('Sign In Failed Sockets Suspension');
    } on HttpException {
      _toast.showToast('Http request failed');
      debugPrint('Sign In Failed Http request failed');
    } on FirebaseException catch (firebaseError) {
      debugPrint(firebaseError.toString());
    } catch (e) {
      _toast.showToast("Sign In Failed");
      debugPrint('Sign In Failed $e');
    }
  }

  Future<void> createNewAppointment() async {String doctorName, patientName, gender, age, appointmentType, tokenNumber, date, time, specialty) async {}
}
