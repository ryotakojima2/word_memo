package controllers;


import java.io.IOException;
import java.util.List;

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

/**
 * Servlet implementation class NextRecordServlet
 */
@WebServlet("/nextrecord")
public class NextRecordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        TypedQuery<Word> query = em.createQuery("SELECT w FROM Word w WHERE w.id > :id ORDER BY w.id ASC", Word.class);
        query.setParameter("id", Integer.parseInt(request.getParameter("id")));
        query.setMaxResults(1);
        List<Word> records = query.getResultList();
        Word randomRecord = null;
        if (records != null && !records.isEmpty()) {
            randomRecord = records.get(0);
        }

        tx.commit();
        em.close();

        request.setAttribute("randomRecord", randomRecord);
        request.getRequestDispatcher("/WEB-INF/views/word/random.jsp").forward(request, response);
    }
}