
### 강의 진행에 필요한 사항

강의는 실습과 같이 진행됩니다. 강의를 들으시는 분들은 자신의 컴퓨터에 R과 RStudio가 설치되어 있어야 하며 RStudio에서 실습에 필요한 다음 패키지들을 설치하시기 바랍니다.

- R 설치 :  
    - https://www.r-project.org/
    - http://cran.nexr.com/
    

- RStudio 설치: 
    - https://www.rstudio.com/products/rstudio/download/#download

필요한 R 패키지 : R console에서 다음 명령어 실행

```
install.packages(c("knitr","shiny",”rmarkdown"))
install.packages(c("tidyverse","DT",”moonBook"))					
install.packages(c(“ggiraph","ggiraphExtra"))
devtools::install_github("cardiomoon/ggplotAssist")
```

6번째 앱에서 knitr Reports 중 pdf 다운로드를 위하여는 LaTex 설치가 필요하다. (http://ktug.or.kr)
