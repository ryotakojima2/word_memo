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

@WebServlet("/checkbox")
public class CheckboxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストからIDとチェックボックスの値を取得
        int id = Integer.parseInt(request.getParameter("id"));
        String checkboxValue = request.getParameter("checkbox");

        // チェックボックスの値をint型で管理する（チェックされている場合は1、されていない場合は0）
        int fragment = checkboxValue != null && checkboxValue.equals("on") ? 1 : 0;

        EntityManager em = DBUtil.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            // データベースから対応するレコードを取得
            Word record = em.find(Word.class, id);

            // チェックボックスの値でフラグメントを更新
            record.setFragment(fragment);

            // トランザクションをコミット
            tx.commit();
        } catch (Exception e) {
            // トランザクションのロールバック
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new ServletException(e);
        } finally {
            em.close();
        }

        // JSPにチェック状態を渡す
        request.setAttribute("isChecked", fragment);
        request.getRequestDispatcher("/WEB-INF/views/word/random.jsp").forward(request, response);
    }
}