
# 영화정보 가져오기!
# 진행할 내용 한 영화의 기본적인 정보들을 가져오는 방법!

import os
import sys
import requests

Client_ID = "비공개!"
Client_Secret = "비공개!"

movie = '장고:분노의 추적자'
header_parms = {"X-Naver-Client_id":Client_ID, "X-Naver-Client-Secret":Client_Secret}
url = "https://openapi.naver.com/v1/search/movie.json?query={movie}"
res = requests.get(url,headers=header_parms)
data = res.json()

title = data['items'][0]['title'].strip('</b>')
link = data['items'][0]['link']
date=data['items'][0]['pubDate']
director = data['items'][0]['actor'].split('|')[0]
actors = data['items'][0]['actor'].split('|')[:-1]
rating = float(data['items'][0]['userRating'])

import pandas as pd
df = pd.DataFrame([title,link,date,director,actors,rating]).T
df.columns = ["제목","링크","개봉년도","감독","출연진","평점"]