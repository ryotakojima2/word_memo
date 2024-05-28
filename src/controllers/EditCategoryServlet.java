package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import util.DBUtil;

/**
 * Servlet implementation class EditCategoryServlet
 */
@WebServlet("/editCategory")
public class EditCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategoryServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 該当のIDのカテゴリー1件のみをデータベースから取得
        Category c = em.find(Category.class, Integer.parseInt(request.getParameter("categoryId")));
        em.close();

        // カテゴリー情報とセッションIDをリクエストスコープに登録
        request.setAttribute("categoryName", c);
        request.setAttribute("_token", request.getSession().getId());

        // カテゴリーデータが存在しているときのみ
        // カテゴリーIDをセッションスコープに登録
        if(c != null) {
            request.getSession().setAttribute("categoryId", c.getCategoryId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/messages/editCategory.jsp");
        rd.forward(request, response);
    }

}
