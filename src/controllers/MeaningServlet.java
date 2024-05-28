package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Word;
import util.DBUtil;

@WebServlet("/meaning")
public class MeaningServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストからIDを取得してデータベースから対応するレコードを取得
        int id = Integer.parseInt(request.getParameter("id"));
        EntityManager em = DBUtil.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Word record = em.find(Word.class, id);

        tx.commit();
        em.close();

        // JSPに意味を渡す
        request.setAttribute("meaning", record.getMean());
        request.getRequestDispatcher("/random.jsp").forward(request, response);
    }
}