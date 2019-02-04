import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/localization.dart';
import 'package:pdf_previewer/pdf_previewer.dart';
import 'dart:io';
import 'dart:async';
import 'package:share_extend/share_extend.dart';
import 'package:documents_picker/documents_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appId = 'ca-app-pub-xxxxxxxxxxxx';

const APP_VERSION = "2.0.17";

const APP_NAME = 'Mobius Omni PDF';

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['pdf', 'education', 'books'],
  childDirected: false,
);

BannerAd myBanner = BannerAd(
  adUnitId: "ca-app-pub-xxxxxxxxxxxx",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

void main() {
  runApp(Mobius());
}

class PdfPagePreview extends StatefulWidget {
  final String imgPath;
  PdfPagePreview({@required this.imgPath});
  _PdfPagePreviewState createState() => new _PdfPagePreviewState();
}

class _PdfPagePreviewState extends State<PdfPagePreview> {
  bool imgReady = false;
  ImageProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPreview(needsRepaint: true);
  }

  @override
  void didUpdateWidget(PdfPagePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imgPath != widget.imgPath) {
      _loadPreview(needsRepaint: true);
    }
  }

  void _loadPreview({@required bool needsRepaint}) {
    if (needsRepaint) {
      imgReady = false;
      provider = FileImage(File(widget.imgPath));
      final resolver = provider.resolve(createLocalImageConfiguration(context));
      resolver.addListener((imgInfo, alreadyPainted) {
        imgReady = true;
        if (!alreadyPainted) setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: imgReady
          ? new ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: provider,
              ))
          : new CircularProgressIndicator(
              strokeWidth: 8,
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[400]),
            ),
    );
  }
}

class Mobius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (BuildContext context) =>
            MobiusLocalizations.of(context).title,
        localizationsDelegates: [
          const MobiusLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English
          const Locale('ar', ''), // Arabic
          const Locale('ca', ''), // Catalan
          const Locale('de', ''), // Dutch
          const Locale('es', ''), // Spanish
          const Locale('fr', ''), // French
          const Locale('hi', ''), // Hindi
          const Locale('it', ''), // Italian
          const Locale('ja', ''), // Japanese
          const Locale('ru', ''), // Russian
          const Locale('tr', ''), // Turkish
          const Locale('zh', ''), // Chinese Simplified
        ],
        home: Omniverse());
  }
}

class Omniverse extends StatefulWidget {
  @override
  _OmniverseState createState() => _OmniverseState();
}

class _OmniverseState extends State<Omniverse> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  SharedPreferences prefs;
  static const kMobiusTheme = 'mobius_theme';
  bool mobiusTheme = false;
  int index = 0;
  String mobiusVersion = '';

  List<dynamic> docPaths = [];
  String omniPath = '';
  void loadTheme() {
    setState(() {
      this.mobiusTheme = this.prefs.getBool(kMobiusTheme) ?? false;
    });
  }

  Future<Null> setTheme(bool val) async {
    await this.prefs.setBool(kMobiusTheme, val);
    loadTheme();
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: appId);
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this.prefs = prefs);
        loadTheme();
      });
  }
  viewPDF() async {
    PdfViewer.loadFile(docPaths[0],
          );
  }

  shareDocs() async {
    File testFile = new File(docPaths[0]);
    if (!await testFile.exists()) {
      await testFile.create(recursive: true);
      testFile.writeAsStringSync("share documents");
    }
    ShareExtend.share(testFile.path, "file");
  }

  pickDocuments() async {
    try {
      docPaths = await DocumentsPicker.pickDocuments;
    } on PlatformException {}
    if (!mounted) return;
    omniPath = await PdfPreviewer.getPagePreview(
        filePath: docPaths[index], pageNumber: 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
    return MaterialApp(
      theme: mobiusTheme ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text(
                    MobiusLocalizations.of(context).theme,
                    //"theme",
                    textAlign: TextAlign.center,
                  ),
                  trailing: RaisedButton.icon(
                    icon: Icon(Icons.lightbulb_outline),
                    label: Text("theme"),
                    onPressed: () => this.setTheme(!this.mobiusTheme),
                  )),
              ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    MobiusLocalizations.of(context).about,
                    //"about",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    // The function showDialog<T> returns Future<T>.
                    // Use Navigator.pop() to return value (of type T).
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: const Text(
                              APP_NAME,
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              APP_VERSION,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () => Navigator.pop(context, 'OK'),
                                color: Colors.red,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                    MobiusLocalizations.of(context).licenses,
                                    style: TextStyle(color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LicensePage()),
                                  );
                                },
                                color: Colors.red,
                              ),
                              RaisedButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () => launch(
                                    'https://play.google.com/store/apps/details?id=space.mobiusomniverse.pdf'),
                                child: Text('Rate App',
                                    style: TextStyle(color: Colors.black)),
                              )
                            ],
                          ),
                    ).then<String>((returnVal) {
                      if (returnVal != null) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You clicked: $returnVal'),
                            action:
                                SnackBarAction(label: 'OK', onPressed: () {}),
                          ),
                        );
                      }
                    });
                  }),
              ListTile(
                leading: Icon(Icons.face),
                title: Text(
                  MobiusLocalizations.of(context).dev,
                  //"dev",
                  textAlign: TextAlign.center,
                ),
                onTap: () => launch('https://facebook.com/mobiusomniverse'),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text(
                  MobiusLocalizations.of(context).donate,
                  //"donate",
                  textAlign: TextAlign.center,
                ),
                onTap: () => launch('https://www.paypal.me/afamobius'),
              ),
            ],
          ),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'PDF Library',
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.redAccent,
              ),
              RaisedButton(
                child: Icon(Icons.library_books),
                onPressed: () => pickDocuments(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.redAccent,
              )
            ],
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0),
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              return Card(
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                              onTap: viewPDF(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 200,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    docPaths[index].split('/').last,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            color: Colors.orange,
                          )),
                      Expanded(
                          flex: 3,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: Colors.redAccent,
                              child: PdfPagePreview(
                                imgPath: omniPath,
                              ))),
                      Expanded(
                          flex: 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                              onTap: ()=> shareDocs(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 200,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'Share',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            color: Colors.green,
                          )),
                    ],
                  ));
            }, childCount: docPaths.length),
          ),
        ]),
      ),
    );
  }
}
