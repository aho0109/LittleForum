## 執行  
須先建立起始資料，SQL Server指令如附檔   
預設SQL連線資料(如需修改可訪問`DemoForum/src/main/resources/application.properties`)  
```
spring.datasource.username=stargazer
spring.datasource.password=P@ssw0rd
```
找到並執行 `DemoForum/src/main/java/com/joyfulgarden/JoyfulGardenSpringBootProjectApplication.java`  
專案進入點：http://localhost:8085/allPosts-google.html  

## 環境
前端：html配合cdn引入的方式使用Vue語法  
後端：SpringBoot  
資料庫：SQL Server  
文字編輯器：CKEditor  
非同步請求：Axios  

## 架構  
(參考國內論壇巴哈姆特)  
有多個討論版可發表文章  
文章可以被回覆，也可以被留言；回覆可以被留言  

## 功能  
（目前會員資訊僅能由SQL Server指令得知，尚無會員頁面）  
可列出所有文章，亦可依討論版篩選文章  
有模糊搜尋（依據對象是文章標題、文章內文，回覆內文）
文章排序預設最新發表在上，另可選依據最新動態（依據對象是最新文章、最新回覆、最新留言）  
若文章內有上傳圖片，在文章列表時會呈現其縮圖  
每個文章、回覆、留言的開頭，都有發布者資訊，點擊後可前往觀看該發布者所有紀錄  

登入後才能看到發表，編輯，刪除等功能鍵
