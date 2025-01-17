<%@ page import="cn.clov614.dao.BookDao" %>
<%@ page import="cn.clov614.bean.Reader" %>
<%@ page import="cn.clov614.service.BookService" %>
<%@ page import="cn.clov614.bean.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书归还</title>
    <%@include file="include/taglib.jsp"%>

    <style>
        * {
            font-family: '萝莉体 第二版';
        }
        body{
            background-image: url("./img/bodybg.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        th {
            text-align: center;
        }
        .notice_head {
            text-align: center;
            font-size: 20px;
            color: blue;
        }
        table{
            background: pink;
        }
        th{
            background: #bea4fd;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("button[id='return']").click(function () {
                alert("确认要归还该书吗？")
                var bookISBN=$(this).val();
                $.ajax({
                    type:"post",//请求方式
                    url:"/returnbook",//请求传输的位置
                    data:{
                        "bookISBN":bookISBN
                    },
                    error:function () {
                        alert("提交错误");
                    },
                    success:function (data) {
                        alert("归还成功！")
                        //自动刷新页面
                        location.reload(true);
                    }
                });
            });
        });
    </script>
</head>
<body>

<%@include file="include/readerheader.jsp"%>

<%
    Reader reader = (Reader) request.getSession().getAttribute("user");
    List<Book> bookList = new BookService().getBorrowBook(reader.getId());
    //获取的是读者所借阅的所有图书
    request.setAttribute("bookList",bookList);
%>

<div style="    margin: auto;text-align: center" >
    <p class="notice_head">图书归还</p>
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr style="text-align: center">
            <th>序号</th>
            <th>书籍名称</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${bookList}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.name}</td>
                <td>${book.ISBN}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>借阅中</td>
                <td >
                    <button class="btn btn-primary" value="${book.ISBN}" id="return">归还</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="include/footer.jsp"%>

</body>
</html>
