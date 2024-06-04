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

@WebServlet("/nextrecordd")
public class NextRecord_dServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();


            // 現在のレコードのIDを取得
            Long currentId = Long.parseLong(request.getParameter("id"));

            // 現在のレコードのIDよりも大きいIDを持つ次のレコードを検索
            TypedQuery<Word> query = em.createQuery("SELECT w FROM Word w WHERE w.id > :currentId ORDER BY w.id ASC", Word.class);
            query.setParameter("currentId", currentId);
            query.setMaxResults(1);
            List<Word> nextWords = query.getResultList();

            // 次のレコードが存在する場合は表示し、存在しない場合はメッセージを表示
            if (!nextWords.isEmpty()) {
                Word nextWord = nextWords.get(0);
                em.close();

                request.setAttribute("date", nextWord);
                request.getRequestDispatcher("WEB-INF/views/word//date.jsp").forward(request, response);
            } else {
                em.close();
                request.getRequestDispatcher("/WEB-INF/views/word/home.jsp").forward(request, response);

                // もうレコードがない場合は他のページにリダイレクトするか、メッセージを表示する

            }

                 }
    }
