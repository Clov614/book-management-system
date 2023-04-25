<%@ page import="cn.clov614.dao.BookDao" %>
<%@ page import="cn.clov614.bean.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书借阅</title>
    <%@include file="include/taglib.jsp"%>

    <style>
        th {
            text-align: center;
        }
        .notice_head {
            text-align: center;
            font-size: 20px;
            color: blue;
            font-family: "Academy Engraved LET";
        }
        /*搜索框相关*/
        .search-box {
            position: relative;
            width: 300px;
            margin: 20px auto;
        }

        .search-box input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
        }

        .search-box .icon {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .search-box i {
            color: #a0a5b1;
        }

        .search-box input:focus {
            border-color: #3F51B5;
            outline: none;
        }

        .search-box input:focus + .icon i {
            color: #3F51B5;
        }
        /*复选框*/
        .options {
            /* 之前的样式 */
        }

        .left {
            float: left;
            width: 50%;
        }

        .right {
            float: left;
            width: 50%;
        }

        .options input {
            /* input样式 */
        }

        .options label {
            /* label样式 */
        }
    </style>

    <script>
        $(document).ready(function () {
           $("button[id='borrow']").click(function () {
                var bookISBN=$(this).val();
               $.ajax({
                   type:"post",//请求方式
                   url:"/borrowbook",//请求传输的位置
                   data:{
                       "bookISBN":bookISBN
                   },
                   error:function () {
                       alert("提交错误");
                   },
                   success:function (data) {
                       if (data==-1) {
                           alert("没有该图书")
                       } else if (data==-2) {
                           alert("图书不足");
                       } else if (data==-3) {
                           alert("当前正在借阅该书");
                       } else {
                           alert("借阅成功！")
                           //自动刷新页面
                           location.reload(true);
                       }
                   }
               });
           });
        });
        // 搜素相关
        $(document).ready(function () {
            $("button[id='btn_search']").click(function () {
                var searchStr=$("#search").val()
                var radioValue = $("input[name='choice']:checked").val();
                // 构造URL
                var url = "/borrowbook.jsp?searchStr=" + searchStr + "&searchType=" + radioValue;
                // 跳转至URL加载JSP页面
                location.href = url;
            });
        });
    </script>
</head>
<body>

<%@include file="include/readerheader.jsp"%>

<%
    String searchStr = request.getParameter("searchStr");
    String radioValue = request.getParameter("searchType");
    if (searchStr != null) {
        request.setAttribute("searchText",searchStr); // 动态同步搜索框内容
        if (radioValue.equals("isbn")) {
            BookDao bookDao = new BookDao();
            List<Book> list = bookDao.isbn2list(Integer.parseInt(searchStr));
            request.setAttribute("bookList",list);
        }else if (radioValue.equals("bname")) {
            BookDao bookDao = new BookDao();
            List<Book> list = bookDao.bname2list(searchStr);
            request.setAttribute("bookList",list);
        }
    }else {
        BookDao bookDao = new BookDao();
        List<Book> list = bookDao.list();
        request.setAttribute("bookList",list);
    }


%>

<div style="    margin: auto;text-align: center" >
    <div class="search-box">
        <input id="search" type="text" placeholder="查找图书" value="${searchText}">
        <span class="icon"><i class="fa fa-search"></i></span>
        <div class="options">
            <div class="left">
                <input type="radio" name="choice" id="o1" value="isbn" checked="checked">
                <label for="option1">isbn</label>
            </div>
            <div class="right">
                <input type="radio" name="choice" id="o2" value="bname">
                <label for="option2">书名</label>
            </div>
        </div>
        <button style="margin-top: 10px" id="btn_search">Search</button>
    </div>
    <p class="notice_head">所有书籍</p>
    <table  class="table table-striped" style="text-align: center;margin: auto;width: 80%">
        <tr style="text-align: center">
            <th>序号</th>
            <th>书籍名称</th>
            <th>ISBN</th>
            <th>作者</th>
            <th>价格</th>
            <th>剩余数量</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${bookList}" var="book" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${book.name}</td>
                <td>${book.ISBN}</td>
                <td>${book.writer}</td>
                <td>${book.price}</td>
                <td>${book.num}</td>
                <td >
                    <button class="btn btn-primary" value="${book.ISBN}" id="borrow">借阅</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="include/footer.jsp"%>

</body>
</html>
