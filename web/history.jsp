<%@ page import="cn.clov614.dao.BookDao" %>
<%@ page import="cn.clov614.bean.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.clov614.dao.HistoryDao" %>
<%@ page import="cn.clov614.bean.Reader" %>
<%@ page import="cn.clov614.bean.HistoryBook" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书借阅</title>
    <%@include file="include/taglib.jsp"%>
</head>
<style>
    * {
        font-family: '萝莉体 第二版';
    }
    body{
        background-image: url("./img/bodybg.jpg");
        background-size: cover;
        background-repeat: no-repeat;
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
<body>

<%@include file="include/readerheader.jsp"%>

<%
    Reader reader = (Reader) request.getSession().getAttribute("user");
    HistoryDao historyDao = new HistoryDao();
    List<HistoryBook> list = historyDao.list(reader.getId());
    request.setAttribute("bookList",list);

%>

<div style="    margin: auto;text-align: center" >
    <p class="notice_head">书籍借阅历史</p>
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr style="text-align: center">
            <th>序号</th>
            <th>书籍名称</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>借阅时间</th>
        </tr>
        <c:forEach items="${bookList}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.name}</td>
                <td>${book.isbn}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>${book.time}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="include/footer.jsp"%>

</body>
</html>
