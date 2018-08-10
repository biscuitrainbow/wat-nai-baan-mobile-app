class Survey {
  final String question;
  final List<String> answers;

  Survey({
    this.question,
    this.answers,
  });

  static List<Survey> getSurveys() {
    return [
      Survey(
        question: 'รู้สึกสบายและมีสุขภาพดี',
        answers: ['ก. ดีกว่าปกติ', 'ข. เหมือนปกติ', 'ค. แย่กว่าปกติ', 'ง. แย่กว่าปกติมาก'],
      ),
      Survey(
        question: 'รู้สึกต้องการยาบำรุงให้มีกำลังวังชา',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'รู้สึกทรุดโทรมและสุขภาพไม่ดี',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'รู้สึกไม่สบาย',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'เจ็บหรือปวดศีรษะ',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'รู้สึกตึงหรือคล้ายมีแรงกดที่ศีรษะ',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'มีอาการร้อนวูบวาบหรือหนาว',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'นอนไม่หลับเพราะกังวลใจ',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'ไม่สามารถหลับได้สนิทหลังจากหลับแล้ว',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      ),
      Survey(
        question: 'รู้สึกตึงเครียดอยู่ตลอดเวลา',
        answers: ['ก. ไม่เลย', 'ข. ไม่มากกว่าปกติ', 'ค. ค่อนข้างมากกว่าปกติ', 'ง. มากกว่าปกติมาก'],
      )
    ];
  }
}