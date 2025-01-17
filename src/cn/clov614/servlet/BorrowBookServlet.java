package cn.clov614.servlet;

import cn.clov614.bean.Book;
import cn.clov614.bean.HistoryBook;
import cn.clov614.bean.Reader;
import cn.clov614.bean.ReaderBook;
import cn.clov614.dao.BookDao;
import cn.clov614.dao.HistoryDao;
import cn.clov614.dao.ReaderBookDao;
import cn.clov614.service.ReaderBookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "BorrowBookServlet")
public class BorrowBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookISBN = request.getParameter("bookISBN");
        Reader reader = (Reader) request.getSession().getAttribute("user");//登录的读者信息

        PrintWriter writer = response.getWriter();
        BookDao bookDao = new BookDao();
        ReaderBookDao readerBookDao = new ReaderBookDao();
        ReaderBookService readerBookService = new ReaderBookService();
        Book book = bookDao.get(Integer.parseInt(bookISBN));

        System.out.println(book);

        //对借阅进行判断
        if (book==null) {
            writer.print(-1);//-1 没有该图书
            return;
        }
        if (book.getNum()<=0) {
            writer.print(-2);//-2 图书不足
            return;
        }
        if (readerBookService.getByReaderAndBook(reader.getId(),Integer.parseInt(bookISBN))!=null) {
            writer.print(-3);//-3 读者正在借阅该书
            return;
        }

        //将借阅的书籍个数-1
        book.setNum(book.getNum()-1);
        bookDao.update(book);
        //将读者信息和书本信息存入reader_book
        ReaderBook readerBook = new ReaderBook();
        readerBook.setReader_id(reader.getId());
        readerBook.setBook_ISBN(Integer.parseInt(bookISBN));
        readerBookDao.add(readerBook);
        HistoryDao historyDao = new HistoryDao();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeStr = sdf.format(date);
        historyDao.add(new HistoryBook(reader.getId(),book.getName(),book.getPrice(),book.getNum(),book.getWriter(),
                timeStr,book.getISBN()));
        request.getRequestDispatcher("/borrowbook.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
