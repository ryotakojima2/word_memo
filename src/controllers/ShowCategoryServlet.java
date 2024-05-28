package controllers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import models.Word;
import util.DBUtil;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/showcategory")
public class ShowCategoryServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCategoryServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 該当のIDのカテゴリー1件のみをデータベースから取得
        Category category = em.find(Category.class, Integer.parseInt(request.getParameter("categoryId")));

        // Wordのデータを取得
     // EntityManagerを使用してJPQLクエリを実行し、カテゴリごとの単語リストを取得します
        List<Word> words = em.createQuery("SELECT w FROM Word w WHERE w.categoryId = :categoryId", Word.class)
                            .setParameter("categoryId", Integer.parseInt(request.getParameter("categoryId")))
                            .getResultList();

        em.close();

        // カテゴリーデータをリクエストスコープにセットしてshow_category.jspを呼び出す
        request.setAttribute("category", category);

        // ワードデータをリクエストスコープにセット
        request.setAttribute("words", words);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/word/show_category.jsp");
        rd.forward(request, response);
    }
}