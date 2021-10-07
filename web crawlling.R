# R을 이용한 웹크롤링! (자료 참고 : 인하대 통계학과 통계소프트웨어 및 실습 유동현 교수님 )

## **Ways to scrape data**

#1. Human Copy-Paste → 인형 눈 붙이기 같은 느낌이랄까
#2. Text pattern matching
#3. API Interface 
#4. DOM Parsing ⇒ 이것을 사용하 것입니당

######## 패키지 설치하기

install.packages('rvest')

######## 패키지 로딩하기

library(rvest)

# [SelectorGadget](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb/related) ⇒ 여기 들어가서 확장 프로그램 다운로드 받기!
  
#  크롤링하고자 하는 웹 사이트 URL 가져오기!  [https://movie.naver.com/movie/bi/mi/basic.naver?cod=99702](https://movie.naver.com/movie/bi/mi/basic.naver?code=99702)

# 여기서 원하는 내용들을 선택해서 가져올 수 있다! *노란색 표시된 내용

# 이후 데이터 전처리해서 분석하면 될 듯!

# 예제

# IMDB Example
#Specifying the url for desired website to be scrapped
url <- 'https://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrap the rankings section
rank_data_html <- html_nodes(webpage,'.text-primary')
rank_data_html

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)

#Let's have a look at the rankings
head(rank_data)

rank = gsub("[.]","",rank_data)
rank
as.numeric(rank_data)

#Using CSS selectors to scrap the title section
title_data_html <- html_nodes(webpage,'.lister-item-header a')

#Converting the title data to text
title_data <- html_text(title_data_html)

#Let's have a look at the title
head(title_data)

data.frame(rank=as.numeric(rank_data),title=title_data)

# https://movie.naver.com/movie/bi/mi/basic.nhn?code=136900
# iframe src="/movie/bi/mi/pointWriteFormList.nhn?code=136900&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false"
url = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=136900&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false"

i = 1
url_temp = paste0(url,"&page=",i)
url_temp

mv_webpage = webpage <- read_html(url_temp)
tt_cnt_temp = html_nodes(mv_webpage,'.total em')
v_count = html_text(tt_cnt_temp)[2]
v_count
v_count = gsub("[,]","",v_count)
tt_cnt = as.numeric(v_count)
tt_cnt

page_indx = 1:ceiling(tt_cnt/10)
length(page_indx)

rating = numeric()
u_name = character()
for(i in 1:10)
{
  w_temp = read_html(paste0(url,"&page=",i))
  r_temp = html_nodes(w_temp, ".score_result .star_score em")
  rating = c(rating, as.numeric(html_text(r_temp)))
  u_temp = html_nodes(w_temp,".score_reple a span")
  u_txt = html_text(u_temp)
  u_txt = u_txt[u_txt!="BEST"]
  u_name = c(u_name,u_txt)
}

rating
data.frame(rating,u_name)

temp = gsub( ")","",u_name)
temp_list = strsplit(temp,"[(]")
res = sapply(temp_list, function(x) x[length(x)])
head(res)
