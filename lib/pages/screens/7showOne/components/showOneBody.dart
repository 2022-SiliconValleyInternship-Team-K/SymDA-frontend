import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ShowOneBody extends StatelessWidget {
  const ShowOneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(width: 3, color: Color(0xffA98467)), // 테투리 선 설정
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        _buildTop(), // 윗쪽 간격 조정
        _buildDate(), // 감정스티커와 날짜
        _buildTop(), // 간격 조정
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        _buildWriting(), // 일기 내용
        _buildImage(), // 일기에 첨부된 사진
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        _buildComment(), // 한 줄 코멘트
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        _buildMusic(), // 추천 음악
      ]),
    );
  }
}

Padding _buildTop() {
  // 간격 조정용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 7,
      // horizontal: 16,
    ),
  );
}

Padding _buildDate() {
  var toDate = DateFormat('yyyy-MM-dd\nHH:mm').format(DateTime.now());

  // 날짜
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Text.rich(
          // 일기 작성 날짜
          TextSpan(
            children: [
              TextSpan(text: toDate, style: textTheme().headline3),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding _buildWriting() {
  // 일기 내용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          text:
              '오늘 나의 하루는 행복으로 가득 찼다! 상쾌한 기분으로 일어나서 별일 없이 잘 보낸것 같다. 저녁에 평소 먹고 싶던 과일빙수도 먹어주었다❤️ 오늘 나의 하루는 행복으로 가득 찼다! 상쾌한 기분으로 일어나서 별일 없이 잘 보낸것 같다. 저녁에 평소 먹고 싶던 과일빙수도 먹어주었다❤️',
          style: textTheme().subtitle1,
          // maxLines: null,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.start,
        ),
      ),
    ),
  );
}

// Visibility _buildImage() {
//   // 일기에 첨부된 사진
//   return Visibility(
//     // visible: writing.contentImg != '', // 일기에 사진이 첨부되었을 경우 위젯을 표시
//     visible: true,
//     child: Padding(
//       padding: EdgeInsets.only(
//         left: 16,
//         right: 16,
//         bottom: 16,
//       ),
//       child: Image.asset(
//         'src/images/logo.png',
//         height: 200,
//         width: double.infinity,
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }
Padding _buildImage() {
  // 일기에 첨부된 사진 - 크기 조정을 위해 임시로 asset에 있는 사진을 보여주도록 함
  return Padding(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 16,
    ),
    child: Image.asset(
      'src/images/logo.png',
      // height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}

Padding _buildComment() {
  // 코멘트 내용
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '오늘의 한 마디\n\n', style: textTheme().headline2),
        TextSpan(
            style: textTheme().subtitle2,
            text: '당신이 서있는 오늘과 걸어온 모든 하루를 응원해요! \n푹 쉬고 내일도 화이팅:)'),
      ])),
    ),
  );
}

Padding _buildMusic() {
  // 유튜브 추천 음악
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    child: InkWell(
      child: Text(
        "오늘의 추천 음악을 눌러보세요",
        style: TextStyle(
            fontFamily: "Kyobo",
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
      onTap: () => launch('https://www.youtube.com/'),
    ),
  );
}
