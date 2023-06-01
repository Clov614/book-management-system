
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--这里不包含taglib，因为重复包含，会导致500的错误--%>
<html>
<head>
    <title>首栏</title>
    <script>
        $(document).ready(function () {
            $("#resign_link").click(function () {
                ${sessionScope.clear()}
                window.location.href="./login.jsp";
            });
        });
    </script>
    <style>
        #resign_link:hover {
            cursor: pointer;
        }
        /*点击后active*/
        li.active a {
            background-color: #bea4fd;
            color: #fff;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">图书管理</a>
        </div>

        <div class="collapse navbar-collapse header" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="./readerindex.jsp">首页<span class="sr-only">(current)</span></a></li>
                <li ><a href="./borrowbook.jsp">图书借阅</a></li>
                <li><a href="./returnbook.jsp">图书归还</a></li>
                <li><a href="./history.jsp">借阅历史</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎 ${sessionScope.username}</a></li>
                <li><a id="resign_link">注销</a></li>
            </ul>
        </div>
    </div>
</nav>
<%--动态改变li标签中的active类 实现动态改变headernav中用户点击后的背景色--%>
<script>
    const navLinks = document.querySelectorAll('.nav li a');

    for (let i = 0; i < navLinks.length; i++) {
        navLinks[i].addEventListener('click', () => {
            for (let j = 0; j < navLinks.length; j++) {
                navLinks[j].parentElement.classList.remove('active');
            }
            navLinks[i].parentElement.classList.add('active');
        })
    }
</script>
</body>
</html>
