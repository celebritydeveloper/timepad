import 'dart:io';

//import 'package:casham_app/screens/qr_scanner.dart';
import 'package:wrizt/pages/qr_scanner.dart';
import 'package:wrizt/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  // Directory tempDir = await getTemporaryDirectory();
  // String tempPath = tempDir.path;
  // final ts = DateTime.now().millisecondsSinceEpoch.toString();
  // String path = '$tempPath/$ts.png';

//   final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);
// await writeToFile(picData, path);

// Future<void> writeToFile(ByteData data, String path) async {
//   final buffer = data.buffer;
//   await File(path).writeAsBytes(
//     buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
//   );
// }

// Future<String> createQrPicture(String qr) async {
//   String path = await createQrPicture(qr);

// await Share.shareFiles(
//   [path],
//   mimeTypes: ["image/png"],
//   subject: 'My QR code',
//   text: 'Please scan me'
// );
//   return path;
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        leading: BackButton(color: Colors.black,),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.ios_share_outlined,
                  color: Colors.black, size: 30.0),
              onPressed: () async {
              //   Directory tempDir = await getTemporaryDirectory();
                
              //   String tempPath = tempDir.path;
              //   final ts = DateTime.now().millisecondsSinceEpoch.toString();
              //   String path = '$tempPath/$ts.png';

              //   final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);
              

              // Future<void> writeToFile(ByteData data, String path) async {
              //   final buffer = data.buffer;
              //   await File(path).writeAsBytes(
              //     buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
              //   );
                
              // }

              // await writeToFile(picData, path);

              // Future<String> createQrPicture(String qr) async {
              //   String path = await createQrPicture(qr);

              // await Share.shareFiles(
              //   [path],
              //   mimeTypes: ["image/png"],
              //   subject: 'My QR code',
              //   text: 'Please scan me'
              // );
              //   return path;
              // }
                Share.share('check out my website https://example.com', subject: 'Look what I made!');
              } //_onClickNotification,
              )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  QrImage(
                    data: 'Hello World',
                    backgroundColor: Colors.white,
                    //embeddedImage: AssetImage('assets/images/wrizt-white-icon.png'),
                    // embeddedImageStyle: QrEmbeddedImageStyle(
                    //   size: Size(60, 60),
                    // ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    gapless: false,
                    size: 260,
                    version: QrVersions.auto,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Saviour Essien',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Scan to pay @celebritydeveloper'),
                      Icon(Icons.verified_sharp, color: mainBlue, size: 15.0,)
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScanner()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.qrcode_viewfinder, size: 45.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('SCAN', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
