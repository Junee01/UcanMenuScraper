= Ucan 앱 식단 크롤러

이 프로그램은 대학 연합 커뮤니트 유캔(UCAN)에서 런칭할 앱에 들어갈 대학교 식단 크롤러입니다.
식단을 제공하는 대학 대상(대학 코드)은 다음과 같습니다. 계속 추가될 예정입니다.

1. 동덕여자대학교(11)
2. 덕성여자대학교(2)
3. 한성대학교(3)
4. 한양대학교 에리카캠퍼스(10)
5. 인하대학교(9)
6. 명지대학교 인문캠퍼스(4)
7. 삼육대학교(5)
8. 광운대학교(8)
9. 동아대학교 승학캠퍼스(6)
10. 동아대학교 구덕/부민캠퍼스(7)

==사용된 Gem 목록

1. 'nokogiri' => HTML/XML Paser.
(html 파서)
2. 'open-uri' => Get request to web page.
(html 코드를 가져오도록 요청을 돕는 잼)
3. 'json'	  => Convert String to Json.
(json 형태로 변환하기 위한 잼)
4. 'net/http' => Get Request to local page when background process.
(background 작업 시 해당 서버에 get 요청을 보내기 위한 잼.)
5. 'whenever' => Crontab maker.
(Crontab을 편하게 작성하도록 도와주는 잼.)
6. 'schema_to_scaffold' It helps making commandline that change existing schema to rails scaffold.
(기존의 Mysql Schema를 Rails 프로젝트로 Dump하는 것을 도와주는 잼.)

==참고사항

- 모든 정보를 가져오지는 않고, 필요하다고 판단된 대상만 가져옵니다.
- 모든 대학이 쉬는 날이나 특별한 날에 대한 정해진 포맷이 없어서, 가끔은 문제가 있을 수 있습니다.
- 필요시 예외처리를 추가할 예정입니다.
- Database는 Mysql을 기준으로 구현되어 있습니다.
- Ruby 2.3.1 / Rails 4.2.5.1
- rvm으로 가상 개발환경 형태로 자체 설치 및 구현이 되어있기 때문에 Gemfile에는 추가 Gem이 들어가 있지 않습니다.

=

[동작 순서]

1. Crontab에 Job 등록 후 Background 작업으로 구동. (매일 새벽 2시에 Get Request.)
2. 각 대학별로 클래스가 구현되어 있고, 각 대학별로 크롤링이 진행된다.
3. 만약 Request나 자체적으로 Error가 발생한다면, 우선 회복(Rescue)되고 에러 메시지가 기록되고 다음 학교로 넘어간다.
4. 각각의 학교마다 해당 페이지에 접속하여 HTML과 CSS구조를 구분하고 원하는 데이터를 Json의 배열형태로 DB(Mysql)에 넣는다.

=

* 대학교 식단을 전문적으로 크롤링해서 제공하는 '밥대생'을 참고하여 카테고리를 분류하고 제작하였습니다.