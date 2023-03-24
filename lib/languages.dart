import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        // for eng
        'en_US': {
          'app_bar': 'Home Page',
          'language': 'English',
          'select_Language': 'Select Language.',
          'Ihram and Intentions': 'Day-1: Ihram and\n Intentions.',
          'Mina aka “City of tents”': 'Day-2: Mina aka “City of tents”',
          'Mina to Arafat': 'Day-3: Mina to Arafat',
          'Muzdalifah': 'Day-4: Muzdalifah',
          'Rami': 'Day-5: Rami– Stoning the devil',
          'Nahr': 'Day-6: Nahr',
          'Farewell Tawaf': 'Day-7: Farewell Tawaf',
        },
        // for Urdu
        'ur_PK': {
          'app_bar': 'ہوم پیج',
          'language': 'اردو',
          'select_Language': 'زبان منتخب کریں۔',
          'Ihram and Intentions':'پہلا دن: احرام اور نیت۔',
          'Mina aka “City of tents”':'دوسرا دن: مینا عرف "خیموں کا شہر"',
          'Mina to Arafat': 'تیسرا دن: منیٰ سے عرفات تک',
          'Muzdalifah': 'چوتھا دن: مزدلفہ',
          'Rami':'پانچواں دن: رامی- شیطان کو سنگسار کرنا',
          'Nahr': 'چھٹا دن: نہر',
          'Farewell Tawaf': 'ساتویں دن: الوداعی طواف',
        },
      };
}
