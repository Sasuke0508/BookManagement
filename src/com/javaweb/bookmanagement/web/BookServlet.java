package com.javaweb.bookmanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.bookmanagement.dao.BookDAO;
import com.javaweb.bookmanagement.model.Book;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookServlet() {
		super();
		// TODO Auto-generated constructor stub
		bookDAO = new BookDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getServletPath();
		try {
			switch (action) {
			/*
			 * case "/new": showNewForm(request, response); break;
			 */
			case "/insert":
				insertBook(request, response);
				break;
			case "/delete":
				deleteBook(request, response);
				break;
			/*
			 * case "/edit": showEditForm(request, response); break;
			 */
			case "/update":
				updateBook(request, response);
				break;
			case "/search":
				searchBook(request, response);
				break;
			default:
				listBook(request, response);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void listBook(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ClassNotFoundException {
		List<Book> listBook = bookDAO.selectAllBook();
		request.setAttribute("listBook", listBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookListPage.jsp");
		dispatcher.forward(request, response);
	}
	/*
	 * private void showNewForm(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { RequestDispatcher dispatcher
	 * = request.getRequestDispatcher("BookForm.jsp"); dispatcher.forward(request,
	 * response); }
	 */

	/*
	 * private void showEditForm(HttpServletRequest request, HttpServletResponse
	 * response) throws SQLException, ServletException, IOException,
	 * ClassNotFoundException { int id =
	 * Integer.parseInt(request.getParameter("id")); Book existingBook =
	 * bookDAO.selectBookById(id); System.out.println("Sách sửa " +
	 * existingBook.getTitle()); RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("BookForm.jsp"); request.setAttribute("book",
	 * existingBook); dispatcher.forward(request, response); }
	 */

	private void insertBook(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book newBook = new Book(title, type, author, price);
		/* System.out.println("Sách: " + title); */
		bookDAO.insertBook(newBook);
		response.sendRedirect(request.getContextPath() + "/list");
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		float price = Float.parseFloat(request.getParameter("price"));

		Book updateBook = new Book(id, title, type, author, price);
//		System.out.println(updateBook.toString());
		bookDAO.updateBook(updateBook);
//		System.out.println("Query was called!");
		response.sendRedirect("list");
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		int idBook = Integer.parseInt(request.getParameter("id"));
		bookDAO.deleteBook(idBook);
		response.sendRedirect(request.getContextPath() + "/list");
	}

	private void searchBook(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		String name = request.getParameter("keySearch");
		List<Book> listBook = bookDAO.selectBookByTitle(name);
		request.setAttribute("listBook", listBook);
		RequestDispatcher dispatcher = request.getRequestDispatcher("BookListPage.jsp");
		dispatcher.forward(request, response);
	}
}
