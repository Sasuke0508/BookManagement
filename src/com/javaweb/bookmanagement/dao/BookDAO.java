package com.javaweb.bookmanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaweb.bookmanagement.model.Book;

public class BookDAO {

	private String userName = "root";
	private String password = "19050820";

	protected Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://localhost:3306/Bookstore";
		Connection connection = DriverManager.getConnection(connectionURL, this.userName, this.password);
		return connection;
	}

	/* CRUDS SQL QUERY */
	private final String INSERT_BOOK = "INSERT INTO book(title, type, author, price) VALUES(?, ?, ?, ?);";
	private final String SELECT_ALL_BOOKS = "SELECT * FROM book;";
	private final String SELECT_BOOK_BY_ID = "SELECT * FROM book WHERE book_id = ?";
	private final String UPDATE_BOOK = "UPDATE book SET title = ?, type = ?, author = ?, price = ? WHERE book_id = ?";
	private final String DELETE_BOOK = "DELETE FROM book WHERE book_id = ?";
//	SEARCH
	private final String SEARCH_BOOK_BY_TITLE = "SELECT * FROM book WHERE title LIKE ?";

	public BookDAO() {
		// TODO Auto-generated constructor stub
	}

	/* CREATE NEW BOOK */
	public void insertBook(Book book) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK);
		preparedStatement.setString(1, book.getTitle());
		preparedStatement.setString(2, book.getType());
		preparedStatement.setString(3, book.getAuthor());
		preparedStatement.setFloat(4, book.getPrice());
		preparedStatement.executeUpdate();
		
		connection.close();
	}

	/* SELECT BOOKS */
	public List<Book> selectAllBook() throws ClassNotFoundException, SQLException {
		List<Book> books = new ArrayList<Book>();
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS);
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("book_id");
			String title = rs.getString("title");
			String type = rs.getString("type");
			String author = rs.getString("author");
			float price = rs.getFloat("price");
			Book book = new Book(id, title, type, author, price);
			books.add(book);

		}
		
		connection.close();
		return books;
	}

	
	public Book selectBookById(int id) throws ClassNotFoundException, SQLException {
		Book book = null;
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		
		while(rs.next()) {
			String title = rs.getString("title");
			String type = rs.getString("type");
			String author = rs.getString("author");
			float price = rs.getFloat("price");
			book = new Book(id, title, type, author, price);
		}
		return book;
	}
	
	/* UPDATE BOOK */
	public boolean updateBook(Book book) throws ClassNotFoundException, SQLException {
		boolean rowUpdate = false;
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK);
		preparedStatement.setString(1, book.getTitle());
		preparedStatement.setString(2, book.getType());
		preparedStatement.setString(3, book.getAuthor());
		preparedStatement.setFloat(4, book.getPrice());
		preparedStatement.setFloat(5, book.getId());
		rowUpdate = preparedStatement.executeUpdate() > 0;
		connection.close();
		return rowUpdate;
	}
	
	/* DELETE BOOK */
	public boolean deleteBook(int idBook) throws ClassNotFoundException, SQLException {
		boolean rowDelete = false;
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK);
		preparedStatement.setInt(1, idBook);
		
		rowDelete = preparedStatement.executeUpdate() > 0;
		connection.close();
		return rowDelete;
	}
	
	/* SEARCH BOOK BY NAME */
	public List<Book> selectBookByTitle(String titleSearch) throws ClassNotFoundException, SQLException {
		List<Book> books = new ArrayList<Book>();
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BOOK_BY_TITLE);
		preparedStatement.setString(1, "%" + titleSearch + "%");
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("book_id");
			String title = rs.getString("title");
			String type = rs.getString("type");
			String author = rs.getString("author");
			float price = rs.getFloat("price");
			Book book = new Book(id, title, type, author, price);
			books.add(book);
		}
		
		connection.close();
		return books;
	}
}
