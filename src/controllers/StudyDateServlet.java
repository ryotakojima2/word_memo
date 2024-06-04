package controllers;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Word;
import util.DBUtil;

@WebServlet("/date")
public class StudyDateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        try {
            // 時刻が遅い順にレコードを取得
            TypedQuery<Word> query = em.createQuery("SELECT w FROM Word w ORDER BY w.date DESC", Word.class);
            List<Word> words = query.getResultList();

            // 最初のレコードを取得
            Word word = words.isEmpty() ? null : words.get(0);

            request.setAttribute("date", word);
            request.getRequestDispatcher("/WEB-INF/views/word/date.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
}