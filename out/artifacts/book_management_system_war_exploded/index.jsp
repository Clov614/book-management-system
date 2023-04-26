
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>欢迎使用图书管理系统</title>
    <%@include file="include/taglib.jsp"%>
    <style>
      * {
        box-sizing: border-box;font-family: '萝莉体 第二版';
      }

      /* body 样式 */
      body {
          font-family: '萝莉体 第二版';
          margin: 0;
          background-image: url("./img/bodybg.jpg");
          background-size: cover;
          background-repeat: no-repeat;
      }

      /* 列容器 */
      .row {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        -ms-flex-wrap: wrap; /* IE10 */
        flex-wrap: wrap;
      }

      /* 创建两个列 */
      /* 边栏 */
      .side {
          background: rgb(190, 164, 253);
        -ms-flex: 30%; /* IE10 */
        flex: 30%;
        padding: 20px;
      }

      /* 主要的内容区域 */
      .main {
        -ms-flex: 70%; /* IE10 */
          background: rgba(250, 165, 165, 0.71);
        flex: 70%;
        padding: 20px;
      }

      /* 测试图片 */
      .text_area {
          background: rgba(250, 165, 165, 0.71);
        width: 100%;
        padding: 20px;
      }

      /* 响应式布局 - 在屏幕设备宽度尺寸小于 700px 时, 让两栏上下堆叠显示 */
      @media screen and (max-width: 700px) {
        .row {
          flex-direction: column;
        }
      }

      /* 响应式布局 - 在屏幕设备宽度尺寸小于 400px 时, 让导航栏目上下堆叠显示 */
      @media screen and (max-width: 400px) {
        .navbar a {
          float: none;
          width: 100%;
        }
      }

      .welcome_head {
        color: 	#FF4040;
        font: 0.875em/1.5em"微软雅黑", "PTSans", "Arial", sans-serif;
        font-size: 30px;
        text-align: center;
        width: 100%;
      }

      #links p:hover {
        cursor: pointer;
        text-decoration: none;
        background-color: #3BD9FF;
        color: #f1f1f1;
        font: 20px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
        line-height: 30px;
        margin-top: 15px;
      }
      .container{
          background-image: url("./img/bodybg.jpg");
          background-size: cover;
          background-repeat: no-repeat;
      }
    </style>
  </head>
  <body>
  <%@include file="include/adminheader.jsp"%>

  <div class="container">
      <h1 class="welcome_head">欢迎使用图书管理系统</h1>
      <div class="row">
          <div class="side">
              <h3>更多内容</h3>

          </div>
          <div class="main">
              <h2>项目介绍</h2>
              <div class="text_area">
        <pre>
本系虽然是简单的CRUD，但也是一个从无到有的过程
系统包含管理员和读者
读者端包含的主要功能有：
  * 借阅：
      可以借阅库存中还有的书籍
  * 查找：
      可以通过关键词，查找对应的书籍
  * 通知：
      可以查看自己的图书借阅情况

管理员包含的主要功能如下：
  * 处理借阅：
      处理读者的借阅申请
  * 管理读者：
      管理读者的信息
  * 通知：
      显示上级下达的重要通知

其他部分：
  系统包含了完整的登录注册判断
        </pre>
              </div>
              <br>
              <h2>联系我们</h2>
              <div class="text_area">
        <pre>
            <a href="https://blog.iaimi.cn/">个人小站 https://blog.iaimi.cn/</a>
        </pre>
              </div>
          </div>
      </div>
  </div>


  <%@include file="include/footer.jsp"%>

  </body>
</html>
