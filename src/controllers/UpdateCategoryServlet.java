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
 * Servlet implementation class UpdateCategoryServlet
 */
@WebServlet("/updateCategory")
public class UpdateCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategoryServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからカテゴリーのIDを取得して
            // 該当のIDのカテゴリー1件のみをデータベースから取得
            Category c = em.find(Category.class, (Integer)(request.getSession().getAttribute("categoryId")));

            // フォームの内容を各フィールドに上書き
            String categoryName = request.getParameter("categoryName");
            c.setCategoryName(categoryName);

            // データベースを更新
            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();

            // セッションスコープ上の不要になったデータを削除
            request.getSession().removeAttribute("categoryId");

            // indexページへリダイレクト
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

}
