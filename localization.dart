
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
class MobiusLocalizations {
  MobiusLocalizations(this.locale);

  final Locale locale;

  static MobiusLocalizations of(BuildContext context) {
    return Localizations.of<MobiusLocalizations>(context, MobiusLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Light Mode',
      'about': 'App Information',
      'nightmode': 'PDF Night Mode',
      'donate': 'Donate Anything, Thanks',
      'choose': 'Choose a PDF',
      'choosedifferent': 'Choose a different PDF',
      'dev': 'Developer Information',
      'nofile': 'No File Selected',
      'read': 'Read  ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'Licenses',
    },
    'ar': {
      'title': 'PDF - موبيوس أومني بي دي إف',
      'theme': 'وضع الضوء',
      'about': 'معلومات التطبيق',
      'nightmode': 'الوضع الليلي  ل PDF',
      'donate': 'تبرع بأي شيء ، شكرا',
      'choose': 'اختر وثيقة PDF',
      'choosedifferent': 'اختر وثيقة PDF مختلفة',
      'dev': 'معلومات حول المطور',
      'nofile': 'لم يتم اختيار اي وثيقة PDF',
      'read': 'اقرأ  ',
      'appname': 'PDF موبيوس أومني بي دي إف',
      'licenses': 'تراخيص',
    },
    'ca': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Mode de llum',
      'about': 'informació de l\'aplicació',
      'nightmode': 'Modalitat nocturna en format PDF',
      'donate': 'Dona qualsevol cosa, gràcies',
      'choose': 'Trieu un PDF',
      'choosedifferent': 'Trieu un PDF diferent',
      'dev': 'Informació sobre el desenvolupador',
      'nofile': 'No hi ha cap fitxer seleccionat',
      'read': 'llegir  ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'llicències',
    },
    'de': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Lichtmodus',
      'about': 'app informatie',
      'nightmode': 'PDF-nachtmodus',
      'donate': 'Doneer iets, bedankt',
      'choose': 'Kies een PDF',
      'choosedifferent': 'Kies een andere PDF',
      'dev': 'Informatie over de ontwikkelaar',
      'nofile': 'Geen bestand geselecteerd',
      'read': 'lezen ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'licenties',
    },
    'es': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Modo de luz',
      'about': 'información de la aplicación',
      'nightmode': 'PDF Modo Noche',
      'donate': 'Dona cualquier cosa, gracias',
      'choose': 'Elige un PDF',
      'choosedifferent': 'Elige un PDF diferente',
      'dev': 'Información sobre el desarrollador.',
      'nofile': 'Ningún archivo seleccionado',
      'read': 'leer  ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'licencias',
    },
    'fr': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Mode lumière',
      'about': 'informations sur l\'application',
      'nightmode': 'Mode nuit PDF',
      'donate': 'Faites un don, merci',
      'choose': 'Choisissez un PDF',
      'choosedifferent': 'Choisissez un autre PDF',
      'dev': 'Informations sur le développeur',
      'nofile': 'Aucun fichier sélectionné',
      'read': 'lis ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'licences',
    },
    'hi': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'लाइट मोड',
      'about': 'ऐप की जानकारी',
      'nightmode': 'पीडीएफ रात मोड',
      'donate': 'कुछ भी दान करें, धन्यवाद',
      'choose': 'एक पीडीएफ चुनें',
      'choosedifferent': 'एक अलग पीडीएफ चुनें',
      'dev': 'डेवलपर के बारे में जानकारी',
      'nofile': 'किसी भी फाइल का चयन नहीं',
      'read': 'पढ़ना ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'लाइसेंस',
    },
    'it': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Light Mode',
      'about': 'App Information',
      'nightmode': 'PDF Night Mode',
      'donate': 'Donate Anything, Thanks',
      'choose': 'Choose a PDF',
      'choosedifferent': 'Choose a different PDF',
      'dev': 'Developer Information',
      'nofile': 'No File Selected',
      'read': 'Read  ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'Licenses',
    },
    'ja': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Modalità luce',
      'about': 'informazioni sull\'app',
      'nightmode': 'PDF Modalità notturna',
      'donate': 'Dona nulla, grazie',
      'choose': 'Scegli un PDF',
      'choosedifferent': 'Scegli un PDF diverso',
      'dev': 'Informazioni sullo sviluppatore',
      'nofile': 'Nessun file selezionato',
      'read': 'leggere ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'licenze',
    },
    'ru': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Легкий режим',
      'about': 'информация о приложении',
      'nightmode': 'Ночной режим PDF',
      'donate': 'Пожертвовать что-нибудь, спасибо',
      'choose': 'Выберите PDF',
      'choosedifferent': 'Выберите другой PDF',
      'dev': 'Информация о застройщике',
      'nofile': 'Файл не выбран',
      'read': 'читать ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'лицензии',
    },
    'tr': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': 'Işık modu',
      'about': 'uygulama bilgisi',
      'nightmode': 'PDF Gece Modu',
      'donate': 'Her Şeye Bağış Yapın, Teşekkürler',
      'choose': 'PDF seçin',
      'choosedifferent': 'Farklı bir PDF seçin',
      'dev': 'Geliştirici hakkında bilgi',
      'nofile': 'Dosya seçilmedi',
      'read': 'okumak ',
      'appname': 'Mobius Omni PDF',
      'licenses': 'lisansları',
    },
    'zh': {
      'title': 'PDF - Mobius Omni PDF',
      'theme': '灯光模式',
      'about': '应用信息',
      'nightmode': 'PDF夜间模式',
      'donate': '捐出一切，谢谢',
      'choose': '选择一个PDF',
      'choosedifferent': '选择其他PDF',
      'dev': '有关开发人员的信息',
      'nofile': '没有选择文件',
      'read': '读 ',
      'appname': 'Mobius Omni PDF',
      'licenses': '许可证',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get theme {
    return _localizedValues[locale.languageCode]['theme'];
  }

  String get about {
    return _localizedValues[locale.languageCode]['about'];
  }

  String get nightmode {
    return _localizedValues[locale.languageCode]['nightmode'];
  }

  String get donate {
    return _localizedValues[locale.languageCode]['donate'];
  }

  String get choose {
    return _localizedValues[locale.languageCode]['choose'];
  }

  String get choosedifferent {
    return _localizedValues[locale.languageCode]['choosedifferent'];
  }

  String get dev {
    return _localizedValues[locale.languageCode]['dev'];
  }

  String get nofile {
    return _localizedValues[locale.languageCode]['nofile'];
  }

  String get read {
    return _localizedValues[locale.languageCode]['read'];
  }

  String get appname {
    return _localizedValues[locale.languageCode]['appname'];
  }

  String get licenses {
    return _localizedValues[locale.languageCode]['licenses'];
  }
}

class MobiusLocalizationsDelegate
    extends LocalizationsDelegate<MobiusLocalizations> {
  const MobiusLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
    'en',
    'ar',
    'ca',
    'de',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ru',
    'tr',
    'zh'
  ].contains(locale.languageCode);

  @override
  Future<MobiusLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<MobiusLocalizations>(MobiusLocalizations(locale));
  }

  @override
  bool shouldReload(MobiusLocalizationsDelegate old) => false;
}
