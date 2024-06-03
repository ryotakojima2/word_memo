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

@WebServlet("/checkboxn")
public class Checkbox_nServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストからIDとチェックボックスの値を取得
        int id = Integer.parseInt(request.getParameter("id"));
        int fragmentValue = Integer.parseInt(request.getParameter("fragment"));

        // データベース更新
        EntityManager em = DBUtil.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Word record = em.find(Word.class, id);
        record.setFragment(fragmentValue);

        tx.commit();
        em.close();

        // 元のページに戻り、チェックボックスの状態を反映させる
        request.setAttribute("fragment", fragmentValue);
        request.setAttribute("nofragment", record); // ランダムなレコードも再度セットしておく
        request.getRequestDispatcher("/WEB-INF/views/word/nofragment.jsp").forward(request, response);
    }
}