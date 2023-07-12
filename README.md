# 디지털 하나로 Backend Project
- Mysql + JSP 하나은행 고객통지 관리자 페이지


## 🖥 ️Introduce
- DB에 저장된 하나은행 고객 데이터를 기반으로 메시지를 송신, CRUD를 수행한 프로젝트입니다.
- 소량의 데이터가 아닌, 하나은행 주거래 고객 수 200만명에 맞추어 프로젝트를 진행했습니다.


## 🕰 Period
* 23.06.05 - 23.07.02

## 🧑‍🤝‍🧑 Members
 - 팀장 : [이수창](https://github.com/eternalclash) - DB총괄, 메인페이지, 수신 상품 프로모션 메시지 전송/관리/내역 구현, DB 인덱싱/샤딩 처리, 발표
 - 팀원1 : [남송윤](https://github.com/songy00n) - ERD 제작, 보이스피싱 예방 안내 메시지 전송/관리/내역 구현, PPT 제작
 - 팀원2 : [이병석](https://github.com/leebyeongseok) - 어플 프로모션 메시지 전송 / 관리 / 내역 구현, 서버 배포, 전송 프로모션 메시지 내용/페이지 구현
 - 팀원3 : [황영하](https://github.com/HwangYoungHa) - ERD 제작, 전체 안내 메시지, 상환 안내 메시지 전송/관리/내역 구현, PPT 제작, 고객 데이터 생성


## ⚙️ Stacks
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white) ![Github](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white) ![JAVA](https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white) ![CSS3](https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![JAVASCRIPT](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![Mysql](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![bootstrap](https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white) 
- **IDE** : IntelliJ
- **Database** : Mysql Workbench
- **SERVER** : amazon RDS, Apache Tomcat
- **ERD** : Lucidchart, ERD cloud
- **Communication** : Slack, GoogleMEET

## 📺 View 
| 메인 페이지  |  메시지 전송 페이지   |
| :-------------------------------------------: | :------------: |
|  <img width="329" src="https://github.com/hanaro-messaging-service/backend/assets/59431258/dca59dc3-aa17-46f2-8bdd-a0e3ec5886bc"/> |  <img width="329" src="https://github.com/hanaro-messaging-service/backend/assets/59431258/3d737849-5625-426f-9672-db6fffac14d4"/>|  
| 메시지 관리 페이지   |  메시지 발송내역 페이지 |  
| <img width="329" src="https://github.com/hanaro-messaging-service/backend/assets/59431258/c115a75d-3615-4142-b397-c532d6eaabe7"/>   |  <img width="329" src="https://github.com/hanaro-messaging-service/backend/assets/59431258/eb86d3c7-3f50-493b-b91a-060667171912"/>     |

## 📦Features 
### ⭐️ DB와 연동하여 고객 데이터를 동적으로 출력
- 메시지 전송 페이지에서 고객정보 클릭할 때마다 출력 데이터 반영 후 최신화
- DB에서 최대 10개씩만 읽어오는 방식의 페이지네이션으로 Read 속도 개선

### ⭐️ 마이메시지 기능으로 미리 만들어 놓은 메시지 사용 
- 미리 민들어 놓은 메시지 템플릿 로드 시 고객 정보 반영 후 출력
- text/html 방식을 구분하여 고객 타입에 맞게 편리하게 전송 가능
- 전송 이전 내용이나 제목을 수정 후 전송

### ⭐️ 메시지 전송
- SMTP 프로토콜을 활용해 네이버 메일에 직접 전송 가능
- 전송 후 로그 DB 저장

### ⭐️ 마이메시지 CRUD
- DB에 저장된 메시지 로드, 확인 가능
- 마이메시지 CRUD를 구현하여 원하는 메시지를 생성, 삭제, 수정 가능
- 메시지 클릭 시 타겟팅 정보 출력 페이지 이동, 정보에 맞게 출력

### ⭐️ 메시지 전송 내역
- DB에 저장된 메시지 전송내역 확인
- 내역 클릭 시 세부 전송내역 페이지 이동, 수정기능 비활성화

### ⭐️ 전송내역 시각화
- 상품 프로모션 관련 페이지 접속 시 접속량 카운트, 도식화하여 출력
