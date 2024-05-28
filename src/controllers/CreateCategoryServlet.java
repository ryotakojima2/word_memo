package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import util.DBUtil;

/**
 * Servlet implementation class CreateCategoryServlet
 */
@WebServlet("/createCategory")
public class CreateCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCategoryServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();
            em.getTransaction().begin();

            Category c = new Category();

            String categoryName = request.getParameter("categoryName");
            c.setCategoryName(categoryName);

            em.persist(c);
            em.getTransaction().commit();
            em.close();

            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

}
