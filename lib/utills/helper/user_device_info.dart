// import 'package:flutter/services.dart';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// class UserDeviceInfo {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

//   PackageInfo _packageInfo = PackageInfo(
//     appName: 'Unknown',
//     packageName: 'Unknown',
//     version: 'Unknown',
//     buildNumber: 'Unknown',
//   );

//   getUserAgent() async {
//     final PackageInfo info = await PackageInfo.fromPlatform();
//     _packageInfo = info;
//     // print('=====');
//     // print('appName ${_packageInfo.appName}');
//     // print('packageName ${_packageInfo.packageName}');
//     // print('Version ${_packageInfo.version}');
//     // print('buildNumber ${_packageInfo.buildNumber}');

//     var deviceInfo = DeviceInfoPlugin();
//     String platformData = 'Undefined';
//     String appData = '${_packageInfo.packageName}|${_packageInfo.version}';
//     String deviceData = '';
//     String userAgent = '';

//     try {
//       if (kIsWeb){
//         WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
//         platformData = 'web';
//         deviceData =  '$platformData + ${webInfo.vendor} + ${webInfo.userAgent} + ${webInfo.hardwareConcurrency}';
//       } else if (Platform.isIOS) {
//         var iosDeviceInfo = await deviceInfo.iosInfo;
//         String deviceDetail;

//         String name =  iosDeviceInfo.name.toString();
//         String systemName =  iosDeviceInfo.systemName.toString();
//         String systemVersion =  iosDeviceInfo.systemVersion.toString();
//         String model =  iosDeviceInfo.model.toString();
//         String localizedModel =  iosDeviceInfo.localizedModel.toString();
//         String identifierForVendor =  iosDeviceInfo.identifierForVendor.toString();

//         deviceDetail = '$name|$systemName|$systemVersion|$model|$localizedModel|$identifierForVendor|';
//         platformData = 'ios';
//         deviceData = iosDeviceInfo.toString();

//       } else if (Platform.isAndroid) {
//         var androidDeviceInfo = await deviceInfo.androidInfo;
//         String deviceDetail;

//         String verSecurityPatch =  androidDeviceInfo.version.securityPatch.toString();
//         String verSdkInt = androidDeviceInfo.version.sdkInt.toString();
//         String verRelease = androidDeviceInfo.version.release.toString();
//         String verPreviewSdkInt = androidDeviceInfo.version.previewSdkInt.toString();
//         String verIncremental = androidDeviceInfo.version.incremental.toString();
//         String verCodename = androidDeviceInfo.version.codename.toString();
//         String verBaseOS = androidDeviceInfo.version.baseOS.toString();
//         String brand = androidDeviceInfo.brand.toString();
//         String device = androidDeviceInfo.device.toString();
//         String hardware = androidDeviceInfo.hardware.toString();
//         String host = androidDeviceInfo.host.toString();
//         String id = androidDeviceInfo.id.toString();
//         String manufacturer = androidDeviceInfo.manufacturer.toString();
//         String model = androidDeviceInfo.model.toString();
//         String product = androidDeviceInfo.product.toString();
//         String type = androidDeviceInfo.type.toString();
//         String androidId = androidDeviceInfo.id.toString();

//         deviceDetail = '$brand|${device}androidId:$androidId|$model|$product|id:$id|verSecurityPatch:$verSecurityPatch|verSdkInt:$verSdkInt|$verIncremental|$verCodename|$verBaseOS|$hardware|$host|$manufacturer|';
//         platformData = 'android';
//         deviceData = deviceDetail;
//       } else {
//         WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
//         platformData = 'web';
//         deviceData = '${webInfo.vendor} + ${webInfo.userAgent} + ${webInfo.hardwareConcurrency}';
//       }
//       userAgent = '$platformData|$appData|$deviceData';
//       return userAgent;
//     } on PlatformException {
//       deviceData = 'Failed to get platform version.';
//       userAgent = '$platformData|$appData|$deviceData';
//       return userAgent;
//     }
//   }

//   getIpAddress() async {
//     try {
//       final dio = Dio(
//         BaseOptions(
//             connectTimeout: const Duration(seconds: 5),
//             receiveTimeout: const Duration(seconds: 3),
//             headers: {
//               "Content-Type": 'application/json',
//             }
//         ),
//       );
//       const url = 'https://api.ipify.org';
//       final response = await dio.get(url);
//       return response.data;
//     } on DioException catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'version.securityPatch': build.version.securityPatch,
//       'version.sdkInt': build.version.sdkInt,
//       'version.release': build.version.release,
//       'version.previewSdkInt': build.version.previewSdkInt,
//       'version.incremental': build.version.incremental,
//       'version.codename': build.version.codename,
//       'version.baseOS': build.version.baseOS,
//       'board': build.board,
//       'bootloader': build.bootloader,
//       'brand': build.brand,
//       'device': build.device,
//       'display': build.display,
//       'fingerprint': build.fingerprint,
//       'hardware': build.hardware,
//       'host': build.host,
//       'id': build.id,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'product': build.product,
//       'supported32BitAbis': build.supported32BitAbis,
//       'supported64BitAbis': build.supported64BitAbis,
//       'supportedAbis': build.supportedAbis,
//       'tags': build.tags,
//       'type': build.type,
//       'isPhysicalDevice': build.isPhysicalDevice,
//       'androidId': build.id,
//       'systemFeatures': build.systemFeatures,
//     };
//   }

//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'systemName': data.systemName,
//       'systemVersion': data.systemVersion,
//       'model': data.model,
//       'localizedModel': data.localizedModel,
//       'identifierForVendor': data.identifierForVendor,
//       'isPhysicalDevice': data.isPhysicalDevice,
//       'utsname.sysname:': data.utsname.sysname,
//       'utsname.nodename:': data.utsname.nodename,
//       'utsname.release:': data.utsname.release,
//       'utsname.version:': data.utsname.version,
//       'utsname.machine:': data.utsname.machine,
//     };
//   }

//   Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'version': data.version,
//       'id': data.id,
//       'idLike': data.idLike,
//       'versionCodename': data.versionCodename,
//       'versionId': data.versionId,
//       'prettyName': data.prettyName,
//       'buildId': data.buildId,
//       'variant': data.variant,
//       'variantId': data.variantId,
//       'machineId': data.machineId,
//     };
//   }

//   Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
//     return <String, dynamic>{
//       'browserName': describeEnum(data.browserName),
//       'appCodeName': data.appCodeName,
//       'appName': data.appName,
//       'appVersion': data.appVersion,
//       'deviceMemory': data.deviceMemory,
//       'language': data.language,
//       'languages': data.languages,
//       'platform': data.platform,
//       'product': data.product,
//       'productSub': data.productSub,
//       'userAgent': data.userAgent,
//       'vendor': data.vendor,
//       'vendorSub': data.vendorSub,
//       'hardwareConcurrency': data.hardwareConcurrency,
//       'maxTouchPoints': data.maxTouchPoints,
//     };
//   }

//   Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
//     return <String, dynamic>{
//       'computerName': data.computerName,
//       'hostName': data.hostName,
//       'arch': data.arch,
//       'model': data.model,
//       'kernelVersion': data.kernelVersion,
//       'osRelease': data.osRelease,
//       'activeCPUs': data.activeCPUs,
//       'memorySize': data.memorySize,
//       'cpuFrequency': data.cpuFrequency,
//     };
//   }
// }