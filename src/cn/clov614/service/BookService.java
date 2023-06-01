package cn.clov614.service;

import cn.clov614.bean.Book;
import cn.clov614.bean.ReaderBook;
import cn.clov614.dao.BookDao;
import cn.clov614.dao.ReaderBookDao;

import java.util.*;
import java.util.stream.Collectors;


public class BookService {
    /**
     * 获取读者借阅的所有图书
     * @param readerID
     * @return
     */
    public List<Book> getBorrowBook(int readerID) {
        List<Book> books = new ArrayList<>();
        ReaderBookDao readerBookDao = new ReaderBookDao();
        List<ReaderBook> list = readerBookDao.list();
        //筛选指定id的读者
        list = list.stream()
                .filter(user -> user.getReader_id()==readerID)
                .collect(Collectors.toList());
        //获取所有图书信息
        List<Book> bookList = new BookDao().list();
        Map<Integer, Book> bookMap = new HashMap<>();
        //将图书ISBN编号和图书对象存入map
        for (Book book : bookList) {
            bookMap.put(book.getISBN(),book);
        }
        //将读者借阅的图书，放入结果集中
        for (ReaderBook readerBook : list) {
            books.add(bookMap.get(readerBook.getBook_ISBN()));
        }
        return books;
    }
}
