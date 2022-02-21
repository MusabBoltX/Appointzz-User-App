import 'dart:io';
import 'package:appointz_client/Services/toast.dart';
import 'package:flutter/cupertino.dart';

class InternetChecker{

  final ToastMsg toast = ToastMsg();

  Future connectionStatus() async {
    try {
      final result = await InternetAddress.lookup('www.healthsolutions.com.pk');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected ::: $result');
      }
    } on SocketException catch (e) {
      debugPrint('Socket Exception! $e');
      toast.showToast('No internet!');
    } on HttpException catch (e) {
      debugPrint('Http Exception! $e');
      toast.showToast('Http request failed!');
    } catch (e) {
      debugPrint('Different Exception $e');
      toast.showToast('Unknown error occurred!');
    }
  }

 }