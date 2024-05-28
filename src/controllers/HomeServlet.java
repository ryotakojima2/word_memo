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
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 単語の一覧を取得
        List<Word> homewords = em.createNamedQuery("getAllWordData", Word.class).getResultList();

        // ジャンルの一覧を取得
        // ※カテゴリーのみアプリケーションスコープを使用するかも
        List<Category> homecategorys = em.createNamedQuery("getAllCategoryData", Category.class).getResultList();
        em.close();

        request.setAttribute("words", homewords);
        request.setAttribute("categorys", homecategorys);


        // ビューに接続
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/word/home.jsp");
        rd.forward(request, response);
    }

}
