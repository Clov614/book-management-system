<%@ page import="cn.clov614.dao.BookDao" %>
<%@ page import="cn.clov614.bean.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理</title>
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
        table{
            background: pink;
        }
        th{
            background: #bea4fd;
        }
    </style>
</head>
<body>

<%@include file="include/adminheader.jsp"%>

<%
    BookDao bookDao = new BookDao();
    List<Book> list = bookDao.list();
    request.setAttribute("bookList",list);
%>

<%--private String name;--%>
<%--private float price;--%>
<%--private int num;--%>
<%--private String writer;--%>
<%--private int ISBN;--%>
<div style="margin: auto;text-align: center">
    <table class="table table-striped" style="text-align: center;margin: auto;width: 80%" >
        <tr>
            <th>编号</th>
            <th>ISBN</th>
            <th>名称</th>
            <th>作者</th>
            <th>价格</th>
            <th>数量</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        <c:forEach items="${bookList}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.ISBN}</td>
                <td>${book.name}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>${book.num}</td>
                <td>
                    <a href="/editbook.jsp?bookISBN=${book.ISBN}" class="glyphicon glyphicon-edit"></a>
                </td>
                <td>
                    <a href="/deletebook?bookISBN=${book.ISBN}" class="glyphicon glyphicon-trash"></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="text-align: center">
    <a href="/addbook.jsp" class="btn btn-primary">添加图书</a>
</div>


<%@include file="include/footer.jsp"%>

</body>
</html>
