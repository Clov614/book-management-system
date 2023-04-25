package cn.clov614.bean;

public class HistoryBook {
    private int reader_id;
    private String name;
    private float price;
    private int num;
    private String writer;
    private String time;
    private int isbn;
    public HistoryBook() {}
    public HistoryBook(int reader_id, String name, float price, int num, String writer, String time, int isbn) {
        this.reader_id = reader_id;
        this.name = name;
        this.price = price;
        this.num = num;
        this.writer = writer;
        this.time = time;
        this.isbn = isbn;
    }

    public int getReader_id() {
        return reader_id;
    }

    public void setReader_id(int reader_id) {
        this.reader_id = reader_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }
}
