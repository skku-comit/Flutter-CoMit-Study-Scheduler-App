class StudyModel {
  final String image;
  final String title;
  final String date;
  final String level;
  final String language;
  final String location;
  final String description;

  StudyModel({
    required this.image,
    required this.title,
    required this.date,
    required this.level,
    required this.language,
    required this.location,
    required this.description,
  });
}

final studyInfoList = [
  StudyModel(
    image: 'assets/logos/flutter-logo.png',
    title: '모바일 앱 개발',
    date: '목 19:30 ~ 21:30',
    level: '초급',
    language: 'Flutter',
    location: '율전',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
  StudyModel(
    image: 'assets/logos/unity-logo.png',
    title: 'Unity 게임 개발',
    date: '목 19:30 ~ 21:30',
    level: '초급',
    language: 'C#',
    location: '온라인',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
  StudyModel(
    image: 'assets/logos/react-logo.png',
    title: '웹 개발',
    date: '목 19:30 ~ 21:30',
    level: '초급',
    language: 'React.js',
    location: '온라인',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
  StudyModel(
    image: 'assets/logos/python-logo.png',
    title: '데이터 분석',
    date: '목 19:30 ~ 21:30',
    level: '중급',
    language: 'Python',
    location: '온라인',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
  StudyModel(
    image: 'assets/logos/c++-logo.png',
    title: '알고리즘 초급 스터디',
    date: '목 19:30 ~ 21:30',
    level: '초급',
    language: 'C++',
    location: '온라인',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
  StudyModel(
    image: 'assets/logos/c++-logo.png',
    title: '알고리즘 중급 스터디',
    date: '목 19:30 ~ 21:30',
    level: '중급',
    language: 'C++',
    location: '온라인',
    description: '모바일 앱 개발을 위한 스터디입니다.',
  ),
];
