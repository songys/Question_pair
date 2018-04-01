#### 키워드 세팅 
keyword ='오버워치'
keyword = toupper(unlist(iconv(keyword, "cp949", "UTF-8", toRaw = TRUE)))
keyword = paste(keyword, collapse = "%")  
keyword = paste0("%", keyword)

# URL과 표적 태그 세팅 
link_front = 'http://kin.naver.com/search/list.nhn?query='
page_num = '&page='

#### 1단계 : 질문URL 1000개 따오기
library(httr) 
library(rvest)

link = NULL
for (i in (1:100)){
  urls = paste0(link_front, keyword, page_num,i)
  html = read_html(urls)
  htxt = html_nodes(html, 'dt')
  htxt = html_nodes(htxt , 'a')
  q_url = html_attr(htxt, 'href')
  link = append(q_url, link)
}

#### 2단계 : 1000개 URL에서 질문내용과 답변내용 따오기 
title = NULL
q_date = NULL
q_cont = NULL
a_date = NULL
a_cont = NULL
infor = NULL

for (i in (1:1000)){
  htxt = read_html(link[i])
  q_title = html_text(html_node(htxt, 'h3._endTitleText'))
  q_time = html_text(html_nodes(htxt, 'dd.date'))[4]
  q = html_text(html_nodes(htxt, 'div.end_content._endContents'))[1]
  a_time = html_text(html_nodes(htxt, 'dd.date'))[6]
  a = html_text(html_nodes(htxt, 'div.end_content._endContents'))[2]
  title = append(q_title, title)
  q_date = append(q_time, q_date)
  q_cont = append(q, q_cont)
  a_date = append(a_time, a_date)
  a_cont = append(a, a_cont)
}

# 데이터프레임으로 통합 및 텍스트전처리
kin = data.frame(title,q_date,q_cont,a_date, a_cont)
View(kin)

# 텍스트 전처리랑 저장은 셀프입니다!!ㅎㅎㅎ

