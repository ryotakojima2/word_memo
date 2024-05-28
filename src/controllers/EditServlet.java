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
 * Servlet implementation class EditServlet
 */
@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 該当のIDのメッセージ1件のみをデータベースから取得
        Word e = em.find(Word.class, Integer.parseInt(request.getParameter("id")));

     // カテゴリー一覧を取得
        request.setAttribute("category", new Category());

        List<Category> categories = em.createNamedQuery("getAllCategoryData", Category.class).getResultList();


        em.close();

        // メッセージ情報とセッションIDをリクエストスコープに登録
        request.setAttribute("word", e);
        request.setAttribute("_token", request.getSession().getId());

        request.setAttribute("categories", categories);

        // メッセージIDをセッションスコープに登録
        request.getSession().setAttribute("word_id", e.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/word/edit.jsp");
        rd.forward(request, response);
    }
}
