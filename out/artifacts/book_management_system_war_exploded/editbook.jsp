<%@ page import="cn.clov614.dao.BookDao" %>
<%@ page import="cn.clov614.bean.Book" %>
<%@ page import="javax.xml.transform.Source" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑图书</title>
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
        .notice_head {
            text-align: center;
            font-size: 20px;
            color: blue;
            margin-top: 40px;
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
            $("#confirm").click(function () {
                let price = $("#price").val();
                let writer = $("#writer").val();
                let num = $("#num").val();
                let name = $("#name").val();
                let ISBN = $(this).val();
                $.ajax({//ajax传输json数据
                    type: "post",//请求方式
                    url: "/editbook",//请求传输的位置
                    data: {
                        "price": price,
                        "writer": writer,
                        "num": num,
                        "name":name,
                        "ISBN":ISBN
                    },
                    error: function () {
                        alert("修改错误");
                    },
                    success: function (data) {
                        alert("修改成功！");
                        window.location.href="/managebook.jsp";
                    }
                });
            });
        });
    </script>
</head>
<body>

<%
    String bookISBN = request.getParameter("bookISBN");
    BookDao bookDao = new BookDao();
    Book book = bookDao.get(Integer.parseInt(bookISBN));
    request.setAttribute("book",book);
%>

<div style="margin: auto;text-align: center">
    <p class="notice_head">修改书本信息</p>
    <table class="table table-striped" style="text-align: center;margin: auto;width: 80%" >
        <tr>
            <td>ISBN:</td>
            <td>${book.ISBN}</td>
        </tr>
        <tr>
            <td>书名:</td>
            <td>
                <input type="text" value="${book.name}" id="name">
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input type="text" value="${book.price}" id="price">
            </td>
        </tr>
        <tr>
            <td>作者:</td>
            <td>
                <input type="text" value="${book.writer}" id="writer">
            </td>
        </tr>
        <tr>
            <td>数量:</td>
            <td>
                <input type="text" value="${book.num}" id="num">
            </td>
        </tr>
    </table>
    <div style="text-align: center">
        <table style="margin: auto">
            <tr>
                <td>
                    <button class="btn btn-primary" id="confirm" value="${book.ISBN}">确认</button>
                </td>
                <td>
                    <a class="btn btn-primary" href="managebook.jsp">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<%@include file="include/footer.jsp"%>
</body>
</html>
