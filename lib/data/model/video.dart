class Video {
  static final String categoryThammaBanYai = 'ธรรมบรรยาย';
  static final String categoryWor = 'ว.วชิรเมธี';
  static final String categorySomphong = 'พระมหาสมปอง';
  static final String categoryPromBandit = 'พระพรหมบัณฑิต';
  static final String categoryKosajan = 'สมเด็จพระพุทธโฆษาจารย์';
  static final String categoryPanya = 'หลวงพ่อปัญญานันทภิกขุ';
  static final String categoryJaran = 'หลวงพ่อจรัญ';
  static final String categoryLanna = 'เทศน์ล้านนา';
  static final String categoryPuthatart = 'ท่านพุทธทาส';
  static final String categoryPatebatTham = 'การปฏิบัติธรรม';
  static final String categoryWipassana = 'วิปัสสนา';
  static final String categoryKhammuang = 'เทศน์คำเมือง';
  static final String categoryRubSeen = 'รับศีล';

  static final List<String> category = [
    categoryThammaBanYai,
    categoryKhammuang,
    categoryKosajan,
    categoryPromBandit,
    categoryWor,
    categorySomphong,
    categoryPanya,
    categoryJaran,
    categoryLanna,
    categoryPuthatart,
    categoryPatebatTham,
  ];

  final String title;
  final String id;
  final String thumbnailUrl;
  final List<String> categories;

  Video({
    this.title,
    this.id,
    this.thumbnailUrl,
    this.categories,
  });

  bool isInCategories(List<String> categories) {
    bool matched = false;

    categories.forEach((category) {
      if (this.categories.contains(category)) {
        matched = true;
      }
    });

    return matched;
  }

  static List<Video> getWipasanaVideos() {
    final wipasanaCategory = [categoryWipassana];
    return generate().where((Video video) => video.isInCategories(wipasanaCategory)).toList();
  }

  static List<Video> getRubSeenVideos() {
    final videos = [
      Video(
        id: '2qqxd3wHW08',
        title: "บทสวดสมาทานศีล ๕",
        thumbnailUrl: "https://i.ytimg.com/vi/2qqxd3wHW08/sddefault.jpg",
        categories: [categoryRubSeen],
      ),
      Video(
        id: 'vlT1X-LXy3Y',
        title: "บทสวดสมาทานศีล ๘",
        thumbnailUrl: "https://i.ytimg.com/vi/vlT1X-LXy3Y/sddefault.jpg",
        categories: [categoryRubSeen],
      )
    ];

    return videos;
  }

  @override
  String toString() {
    return '$categories';
  }

  static List<Video> generate() {
    return [
      Video(
        id: "GWo2OGXRkCA",
        title: "สุขทานกถา ว่าด้วยการให้ความสุข",
        thumbnailUrl: "https://i.ytimg.com/vi/GWo2OGXRkCA/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryPromBandit],
      ),
      Video(
        id: "7WImsxpQefY",
        title: "บุญนิธิกถา ว่าด้วยขุมทรัพย์คือบุญ",
        thumbnailUrl: "https://i.ytimg.com/vi/GWo2OGXRkCA/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryPromBandit],
      ),
      Video(
        id: "uB4S4NDPJvs",
        title: "สติพลกถา ว่าด้วยสติมาปัญญาเกิด",
        thumbnailUrl: "https://i.ytimg.com/vi/uB4S4NDPJvs/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryPromBandit],
      ),
      Video(
        id: "mwm7qRlUsk4",
        title: "ใช้ชีวิต..สุขที่สุด",
        thumbnailUrl: "https://i.ytimg.com/vi/mwm7qRlUsk4/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryKosajan],
      ),
      Video(
        id: 'A8CZCErrb5M',
        title: 'มีความสุข..ได้ทุกวัน ธรรมบรรยาย โดย ท่าน ว.วชิรเมธี',
        thumbnailUrl: "https://i.ytimg.com/vi/A8CZCErrb5M/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'LSIvXvK2qWg',
        title: "\"ประตูสู่ความสุข\" ธรรมบรรยาย โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/LSIvXvK2qWg/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'PWMG9ouNtX8',
        title: "สุขง่าย..แค่เข้าใจ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/PWMG9ouNtX8/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'mEgRQOKzf4w',
        title: "ทักษะการใช้ชีวิต โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/mEgRQOKzf4w/hqdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'pSVqy0XQADs',
        title: "เราเป็นอย่างที่เราคิด โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/pSVqy0XQADs/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: '2w63r5hTDn8',
        title: "ให้กำลังใจตัวเองบ้าง โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/2w63r5hTDn8/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: '1_e6V34svhg',
        title: "หลุมพรางของชีวิต โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/1_e6V34svhg/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'MqLIXw5SRQg',
        title: "หัวร้อนไป..ก็เผาใจตัวเอง โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/MqLIXw5SRQg/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: '1-uy3Dyy9bA',
        title: "\"คิดเป็น..ก็เห็นสุข\" โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/1-uy3Dyy9bA/hqdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'fCtPnjO_r2g',
        title: "ธรรมบรรยาย ขอบคุณความทุกข์ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/fCtPnjO_r2g/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'OAP-3Z_DChs',
        title: "เพื่อความเป็นที่รัก ธรรมบรรยาย โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/OAP-3Z_DChs/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'j_ehjZk-_2c',
        title: "ทำใจได้  ก็ไร้ทุกข์ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/j_ehjZk-_2c/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'ofTFQo9NrMU',
        title: "ยิ้มรับทุกข์..อย่างรู้ทัน โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/ofTFQo9NrMU/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'ilNWrqqCUxA',
        title: "ชีวิตที่พ้นไปจากทุกข์ โดย ท่าน ว.วชิรเมธี (ธรรมะวันวิสาขบูชา)",
        thumbnailUrl: "https://i.ytimg.com/vi/ilNWrqqCUxA/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'T1-jfAGyIXk',
        title: "เมตตาภาวนาเยียวยาทุกอย่าง โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/T1-jfAGyIXk/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'arc6DmPEnoQ',
        title: "ปล่อยลง ปลงเป็น เห็นสุข โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/arc6DmPEnoQ/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'CJMXj00x_gM',
        title: "หลักคิด ชีวิตดีมีสุข  โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/CJMXj00x_gM/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'cLaab7F1H3E',
        title: "รับมือกับความทุกข์ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/cLaab7F1H3E/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'TACt-OTrjHo',
        title: "ปาฏิหาริย์แห่งการคิดบวก  โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/TACt-OTrjHo/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'dERl6Bx7byE',
        title: "ไม่ยึด...ก็ไม่ทุกข์ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/dERl6Bx7byE/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: '1AKKlMv1dmw',
        title: "บอกชีวิตให้เข้าใจ โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/1AKKlMv1dmw/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'w_n-VZ9Rfaw',
        title: "ธรรมบรรยาย \"บันไดแห่งความสุข\" โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/w_n-VZ9Rfaw/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'qD3hiyMNtsU',
        title: "ฟังธรรมะ \"รู้ทันธรรมดา\" เสียงธรรม โดย ท่าน ว.วชิรเมธี",
        thumbnailUrl: "https://i.ytimg.com/vi/qD3hiyMNtsU/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryWor],
      ),
      Video(
        id: 'SCp5AJUWsSY',
        title: "ธรรมะก่อนนอน พระมหาสมปอง ท้อใจ ทำยังไง ให้หายทุกข์ ลองฟังธรรมะสิ คลายเครียด และได้ข้อคิดีดี",
        thumbnailUrl: "https://i.ytimg.com/vi/SCp5AJUWsSY/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'MPR3FGc2DLI',
        title: "ธรรมะก่อนนอน พระมหาสมปอง หลับสบาย คลายเครียด สนุกและได้ความรู้ธรรม",
        thumbnailUrl: "https://i.ytimg.com/vi/MPR3FGc2DLI/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'ZG9GsORm9vs',
        title: "ธรรมะก่อนนอน เครียดไปทำไม กับพระมหาสมปอง ฟังแล้วนอนหลับฝันดี",
        thumbnailUrl: "https://i.ytimg.com/vi/ZG9GsORm9vs/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'sq-v_eUmD28',
        title: "ธรรมะสอนใจ ฟังก่อนนอน กับ พระมหาสมปอง เฮฮาธรรม ก่อนนอน จิตเป็นนาย กายเป็นบ่าว ",
        thumbnailUrl: "https://i.ytimg.com/vi/sq-v_eUmD28/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'VH1BClJvAFY',
        title: "พระมหาสมปอง ความสุข อยู่หนใด ธรรมะดีดีฟังก่อนนอน",
        thumbnailUrl: "https://i.ytimg.com/vi/VH1BClJvAFY/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'NfohkCWSxIY',
        title: "ธรรมะก่อนนอน พระมหาสมปอง ดึงสติ ให้เกิดปัญญา ธรรมะเฮฮา ฟังแล้วดีมากๆ",
        thumbnailUrl: "https://i.ytimg.com/vi/NfohkCWSxIY/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'WSM6-PenPaw',
        title: "ธรรมะก่อนนอน พระมหาสมปอง ธรรมะโลกแตก ขำๆ ฟังก่อนนอน",
        thumbnailUrl: "https://i.ytimg.com/vi/WSM6-PenPaw/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'UJVgoTz7Q3Y',
        title: "ธรรมะก่อนนอน พระมหาสมปอง ความสุขอยู่ที่ตัวเราคิด ทุกสิ่งอยู่ที่ตัวเราทำ ธรรมะชุดนี้ สนุก และดีมาก",
        thumbnailUrl: "https://i.ytimg.com/vi/UJVgoTz7Q3Y/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'ypn24D5h-Mg',
        title: "ธรรมะก่อนนอน พระมหาสมปอง คนเราเกิดมา เพื่ออะไร ธรรมะดีดี สนุกๆ สุดฮา ชุดนี้ดีมากๆ",
        thumbnailUrl: "https://i.ytimg.com/vi/ypn24D5h-Mg/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'wXe-dtIeISk',
        title: "ธรรมะก่อนนอน พระมหาสมปอง ทำอย่างไรให้มีความสุข ธรรมะชุดนี้เฮฮาและดีมากๆ",
        thumbnailUrl: "https://i.ytimg.com/vi/wXe-dtIeISk/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categorySomphong],
      ),
      Video(
        id: 'ICOoO_t9Ydc',
        title: "ผู้สูงอายุควรอยู่อย่างไร ",
        thumbnailUrl: "https://i.ytimg.com/vi/ICOoO_t9Ydc/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'YW3q7FDJpug',
        title: "วิธีรักษาสุขภาพจิต ",
        thumbnailUrl: "https://i.ytimg.com/vi/YW3q7FDJpug/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'YbsymvHJNqs',
        title: "ชีวิตคืออะไร ",
        thumbnailUrl: "https://i.ytimg.com/vi/YbsymvHJNqs/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: '3dwXZNG83ec',
        title: "ชาวพุทธที่ดีไม่มีเรื่องไสยศาสตร์ ",
        thumbnailUrl: "https://i.ytimg.com/vi/3dwXZNG83ec/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'gOw6xnBfbYM',
        title: "รู้จักคิดชีวิตไม่ทุกข์  ",
        thumbnailUrl: "https://i.ytimg.com/vi/gOw6xnBfbYM/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: '_TUv2HJ4ezw',
        title: "เนื้อแท้ของพระพุทธศาสนา  ",
        thumbnailUrl: "https://i.ytimg.com/vi/_TUv2HJ4ezw/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: '4K_rAh2nJ8c',
        title: "การปล่อยวางจากสิ่งทั้งปวง ",
        thumbnailUrl: "https://i.ytimg.com/vi/4K_rAh2nJ8c/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'PFEH4LIz2i8',
        title: "เกิดเป็นคนต้องพึ่งตนเอง ",
        thumbnailUrl: "https://i.ytimg.com/vi/PFEH4LIz2i8/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'dySnDjALWys',
        title: "แก้ปัญหาชีวิตที่ตัวเราเอง  ",
        thumbnailUrl: "https://i.ytimg.com/vi/dySnDjALWys/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'Z98HRRUki8Q',
        title: "เจริญภาวนาเพื่ออะไร  ",
        thumbnailUrl: "https://i.ytimg.com/vi/Z98HRRUki8Q/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'AZVbm3XABK0',
        title: "มาวัดแล้วได้อะไร",
        thumbnailUrl: "https://i.ytimg.com/vi/AZVbm3XABK0/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'FXcLlnsV-Wc',
        title: "ให้ทานที่เป็นประโยชน์แก่ผู้รับ",
        thumbnailUrl: "https://i.ytimg.com/vi/FXcLlnsV-Wc/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: '0-mxMl4ytdk',
        title: "อภัยทาน",
        thumbnailUrl: "https://i.ytimg.com/vi/0-mxMl4ytdk/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'T_BV3haa7s8',
        title: "รู้จักพอเป็นสุขทุกสถาน",
        thumbnailUrl: "https://i.ytimg.com/vi/T_BV3haa7s8/maxresdefault.jpg",
        categories: [categoryThammaBanYai, categoryPanya],
      ),
      Video(
        id: 'xksvEY7U8nM',
        title: "คาถาชนะมาร เรื่องเล่าหลวงพ่อจรัญกับพระภิกษุลึกลับ",
        thumbnailUrl: "https://i.ytimg.com/vi/xksvEY7U8nM/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryJaran],
      ),
      Video(
        id: '_AsdI0xIm4w',
        title: "หลวงพ่อจรัญ - ทำใจได้รวยมหาศาล",
        thumbnailUrl: "https://i.ytimg.com/vi/_AsdI0xIm4w/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryJaran],
      ),
      Video(
        id: '0ujE2wkJ_iQ',
        title: "เสียดายคนตายไม่ได้ฟัง คู่มือมนุษย์ท่านพุทธทาส ภิกขุ",
        thumbnailUrl: "https://i.ytimg.com/vi/0ujE2wkJ_iQ/sddefault.jpg",
        categories: [categoryThammaBanYai, categoryPuthatart],
      ),
      Video(
        id: 'AuNrBMhlcRA',
        title: "เริ่มฝึกวิปัสสนา ง่าย ๆ 10 นาที",
        thumbnailUrl: "https://i.ytimg.com/vi/AuNrBMhlcRA/maxresdefault.jpg",
        categories: [categoryWipassana],
      ),
      Video(
        id: '9YygEyLaIr8',
        title: "สาธิตวิธีเดินจงกรม ๑-๖ ระยะ",
        thumbnailUrl: "https://i.ytimg.com/vi/9YygEyLaIr8/hqdefault.jpg",
        categories: [categoryWipassana],
      ),
      Video(
        id: 'mKLGYgov3fA',
        title: "การสาธิตการปฏิบัติวิปัสสนากรรมฐาน ตามแนว สติปัฏฐาน ๔",
        thumbnailUrl: "https://i.ytimg.com/vi/mKLGYgov3fA/sddefault.jpg",
        categories: [categoryWipassana],
      ),
      Video(
        id: 'gYrJw0pdqkE',
        title: "เทศน์คำเมือง ล้านนา",
        thumbnailUrl: "https://i.ytimg.com/vi/gYrJw0pdqkE/sddefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: 'eSNMlKuGmCw',
        title: "มหาวิบาก เทสน์โดย ท่านชินวร วัดบ้านโซ้ พะเยา",
        thumbnailUrl: "https://i.ytimg.com/vi/eSNMlKuGmCw/sddefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: 'wm8QQAT_A4Q',
        title: "เทศน์ บะเก่าฉบับล้านนา 4  ฮ้องขวัญ มัทรี",
        thumbnailUrl: "https://i.ytimg.com/vi/wm8QQAT_A4Q/sddefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: 'TzesdRiDSeA',
        title: "เทศน์คำเมืองล้านนา \"กินข้าวแล้วก็ขี้ ทำความดีกันหรือยัง\"",
        thumbnailUrl: "https://i.ytimg.com/vi/TzesdRiDSeA/sddefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: 'JL6KAtoyw1s',
        title: "เทศน์คำเมืองล้านนาธรรมะตลก ชุดที่ 5 พระคุณพ่อ พระคุณแม่",
        thumbnailUrl: "https://i.ytimg.com/vi/JL6KAtoyw1s/maxresdefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: '9p8K2Gz8he4',
        title: "เทศน์คำเมือง ธรรมตลก 1",
        thumbnailUrl: "https://i.ytimg.com/vi/9p8K2Gz8he4/hqdefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: "GF3J0KjTbZM",
        title: "ธรรมบรรยาย ฮาเฮ พระอธิการโอฬาร เทศนาธรรม",
        thumbnailUrl: "https://i.ytimg.com/vi/GF3J0KjTbZM/maxresdefault.jpg",
        categories: [categoryKhammuang],
      ),
      Video(
        id: "AuNrBMhlcRA",
        title: "เริ่มฝึกวิปัสสนา ง่าย ๆ 10 นาที",
        thumbnailUrl: "https://i.ytimg.com/vi/AuNrBMhlcRA/sddefault.jpg",
        categories: [categoryPatebatTham],
      ),
      Video(
        id: "9YygEyLaIr8",
        title: "สาธิตวิธีเดินจงกรม ๑-๖ ระยะ",
        thumbnailUrl: "https://i.ytimg.com/vi/9YygEyLaIr8/sddefault.jpg",
        categories: [categoryPatebatTham],
      ),
      Video(
        id: "mKLGYgov3fA",
        title: "การสาธิตการปฏิบัติวิปัสสนากรรมฐาน ตามแนว สติปัฏฐาน ๔",
        thumbnailUrl: "https://i.ytimg.com/vi/mKLGYgov3fA/sddefault.jpg",
        categories: [categoryPatebatTham],
      ),
      Video(
        id: "gYrJw0pdqkE",
        title: "เทศน์คำเมือง ล้านนา",
        thumbnailUrl: "https://i.ytimg.com/vi/gYrJw0pdqkE/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "eSNMlKuGmCw",
        title: "มหาวิบาก เทสน์โดย ท่านชินวร วัดบ้านโซ้ พะเยา",
        thumbnailUrl: "https://i.ytimg.com/vi/eSNMlKuGmCw/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "wm8QQAT_A4Q",
        title: "เทศน์ บะเก่าฉบับล้านนา 4 ฮ้องขวัญ มัทรี",
        thumbnailUrl: "https://i.ytimg.com/vi/wm8QQAT_A4Q/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "TzesdRiDSeA",
        title: "เทศน์คำเมืองล้านนา กินข้าวแล้วก็ขี้ ทำความดีกันหรือยัง",
        thumbnailUrl: "https://i.ytimg.com/vi/TzesdRiDSeA/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "JL6KAtoyw1s",
        title: "เทศน์คำเมืองล้านนาธรรมะตลก ชุดที่ 5 พระคุณพ่อ พระคุณแม่",
        thumbnailUrl: "https://i.ytimg.com/vi/JL6KAtoyw1s/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "9p8K2Gz8he4",
        title: "เทศน์คำเมือง ธรรมตลก 1",
        thumbnailUrl: "https://i.ytimg.com/vi/9p8K2Gz8he4/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "GF3J0KjTbZM",
        title: "ธรรมบรรยาย ฮาเฮ พระอธิการโอฬาร เทศนาธรรม",
        thumbnailUrl: "https://i.ytimg.com/vi/GF3J0KjTbZM/sddefault.jpg",
        categories: [categoryLanna],
      ),
      Video(
        id: "2OyiVofe5OM",
        title: "3 เดินจงกรมระยะ 1 - สติปัฏฐาน4",
        thumbnailUrl: "https://i.ytimg.com/vi/2OyiVofe5OM/sddefault.jpg",
        categories: [categoryWipassana],
      ),
    ];
  }
}
