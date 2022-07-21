import 'package:flutter/material.dart';
import 'package:symda/src/theme.dart';


class ShowAllBody extends StatelessWidget {
  const ShowAllBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xffD4D5DD)),
        ),
      ),
      child: Column(children: [
        _buildTop(), // 윗쪽 간격 조정
        _buildEmotion(), // 감정스티커와 날짜
        _buildTop(), // 간격 조정
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[300],
        ),
        _buildWriting(), // 일기 내용
        _buildImage(), // 일기에 첨부된 사진
      ]),
    );
  }
}

Padding _buildTop() {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 5,
      // horizontal: 16,
    ),
    // child: Row(    // 맨 윗쪽에 날짜 보이게
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(4),
    //       decoration: BoxDecoration(
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.all(Radius.circular(4)),
    //         // color: Color(0xffA98467),
    //       ),
    //       child: Text(
    //         '날짜',
    //         style: textTheme().headline3,
    //       ),
    //     ),
    //   ],
    // ),
  );
}

Padding _buildEmotion() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        CircleAvatar(
          // 감정 스티커 작게 보이게
          backgroundColor: Color(0xffA98467),
          backgroundImage: AssetImage('src/images/emotions/joy.png'),
        ),
        SizedBox(
          // 감정 스티커와 날짜 사이의 간격 조정
          width: 10,
        ),
        Text.rich(
          // 일기 작성 날짜
          TextSpan(
            children: [
              TextSpan(text: '6월 29일 수요일', style: textTheme().headline3),
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
      vertical: 16,
      horizontal: 16,
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '오늘 나의 하루는 행복으로 가득 찼다! 상쾌한 기분으로 일어나서 별일 없이 잘 보낸것 같다. 저녁에 평소 먹고 싶던 과일빙수도 먹어주었다❤️ 오늘 나의 하루는 행복으로 가득 찼다! 상쾌한 기분으로 일어나서 별일 없이 잘 보낸것 같다. 저녁에 평소 먹고 싶던 과일빙수도 먹어주었다❤️',
        style: textTheme().subtitle1,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
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
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}
