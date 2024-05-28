package controllers;


import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Word;
import util.DBUtil;

@WebServlet("/random")
public class StudyRandomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        try {
            EntityTransaction tx = em.getTransaction();
            tx.begin();

            TypedQuery<Word> query = em.createNamedQuery("getAllWordData", Word.class);
            List<Word> records = query.getResultList();

            Random random = new Random();
            Word randomRecord = null;
            if (records != null && !records.isEmpty()) {
                int randomIndex = random.nextInt(records.size());
                randomRecord = records.get(randomIndex);
            }

            tx.commit();

            // JSPにランダムなレコードを渡す
            request.setAttribute("randomRecord", randomRecord);
            request.getRequestDispatcher("/WEB-INF/views/word/random.jsp").forward(request, response);
        } catch (Exception e) {
            // 例外が発生した場合の処理
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new ServletException(e);
        } finally {
            em.close();
        }
    }


}