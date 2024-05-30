package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Word;
import util.DBUtil;

@WebServlet("/nofragment")
public class StudyNoFragmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = DBUtil.createEntityManager();
        TypedQuery<Word> query = entityManager.createQuery("SELECT w FROM Word w WHERE w.fragment = 0", Word.class);
        List<Word> words = query.getResultList();
        entityManager.close();

        Random random = new Random();
        Word word = words.get(random.nextInt(words.size()));

        request.setAttribute("nofragment", word);
        request.getRequestDispatcher("/WEB-INF/views/word/nofragment.jsp").forward(request, response);
    }
}