package cn.clov614.test;

import cn.clov614.bean.Book;
import cn.clov614.dao.BookDao;
import org.testng.annotations.Test;

import static org.junit.jupiter.api.Assertions.*;

class addBookCheckisbnTest {
    @Test
    public static void main(String[] args) {
        int ISBN = 114514;
        float price = 13;
        int num = 2;
        String name = "linyi";
        String writer = "h1";
        BookDao bookDao = new BookDao();
        Book book = new Book(name, price, num, writer, ISBN);
        Book cbook = bookDao.get(114514);
        if (cbook == null) {
            System.out.println("is null");
        }else {
            System.out.println("not null");
        }
    }
}