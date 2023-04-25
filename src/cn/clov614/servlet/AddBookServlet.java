package cn.clov614.servlet;

import cn.clov614.bean.Book;
import cn.clov614.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBookServlet")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //这里写业务代码
        int ISBN = Integer.parseInt(request.getParameter("ISBN"));
        float price = Float.parseFloat(request.getParameter("price"));
        int num = Integer.parseInt(request.getParameter("num"));
        String name = request.getParameter("name");
        String writer = request.getParameter("writer");

        PrintWriter w = response.getWriter();//用来向ajax的回调函数返回数据

        BookDao bookDao = new BookDao();
        Book book = new Book(name, price, num, writer, ISBN);
        if (bookDao.get(ISBN) != null) {
            w.print(-1); // ISBN存在的情况下
        }else {
            bookDao.add(book);
        }

        //点击确认，添加业务代码后，要将页面跳转回管理界面
        // request.getRequestDispatcher("/managebook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
