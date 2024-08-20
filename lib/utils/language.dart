
mixin Traductor {
  static const String title = 'cambiar';

  static const Map<String, dynamic> ES = {title: 'Espanol TITULO'};
  static const Map<String, dynamic> AY = {title: 'Aymara TITULO'};
  static const Map<String, dynamic> QUE = {title: 'Quechua TITULO'};
}

mixin AppLocale2 {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  static const Map<String, dynamic> EN = {
    title: 'Localization',
    thisIs: 'This is %a package, version %a.',
  };
  static const Map<String, dynamic> KM = {
    title: 'ការធ្វើមូលដ្ឋានីយកម្ម',
    thisIs: 'នេះគឺជាកញ្ចប់%a កំណែ%a.',
  };
  static const Map<String, dynamic> JA = {
    title: 'ローカリゼーション',
    thisIs: 'これは%aパッケージ、バージョン%aです。',
  };
}