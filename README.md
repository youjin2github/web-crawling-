# web-crawling-
인하대 통계학과 유동현 교수님 수업 통계소프트웨어 실습 - 웹크롤링 내용입니다! + 네이버 API, 유투브 API
R을 이용한 웹크롤링!

(자료 참고 : 인하대 통계학과 통계소프트웨어 및 실습 유동현 교수님 )

## **Ways to scrape data**

1. Human Copy-Paste → 인형 눈 붙이기 같은 느낌이랄까
2. Text pattern matching
3. API Interface 
4. DOM Parsing ⇒ 이것을 사용하 것입니당

R로 바로 들어가서! 코드를 작성해봅시당

######## 패키지 설치하기

install.packages('rvest')

######## 패키지 로딩하기

library(rvest)

[SelectorGadget](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb/related)

⇒ 여기 들어가서 확장 프로그램 다운로드 받기!

크롤링하고자 하는 웹 사이트 URL 가져오기!

[https://movie.naver.com/movie/bi/mi/basic.naver?cod=99702](https://movie.naver.com/movie/bi/mi/basic.naver?code=99702)

여기서 원하는 내용들을 선택해서 가져올 수 있다! *노란색 표시된 내용

이후 데이터 전처리해서 분석하면 될 듯!

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c6a8ee6d-4f80-47d6-825b-bcea51a0525c/Untitled.png)

단점 : URL을 하나하나 가져오고 원하는 내용을 직접 선택해야 하기 때문에 번거로울것 같다. 

참고자료 :

[](https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/)
