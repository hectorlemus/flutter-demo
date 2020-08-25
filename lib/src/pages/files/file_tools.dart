import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> get getDownloadPath async {
  try {
    final directory = await DownloadsPathProvider.downloadsDirectory;
    return directory.path;
  } catch (e) {
    return null;
  }
}

Future<bool> get requestPermissions async {
  try {
    final bool granted = await Permission.storage.isGranted;
    if (granted) {
      return granted;
    }
    await Permission.storage.request();
    return await Permission.storage.isGranted;
  } catch (e) {
    return false;
  }
}
