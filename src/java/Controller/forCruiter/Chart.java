/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forCruiter;

import DAO.ApplicationDAO;
import DAO.CategoryDAO;
import DAO.JobDAO;
import Model.Category;
import Model.Recruiter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Chart", urlPatterns = {"/chart"})
public class Chart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Chart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JobDAO jDAO = new JobDAO();
        CategoryDAO cDAO = new CategoryDAO();
        ApplicationDAO aDAO = new ApplicationDAO();
        ArrayList<Category> listC = cDAO.getAll();
        HttpSession session = request.getSession();
        Recruiter recruiter = (Recruiter) session.getAttribute("account1");
        ArrayList<String[]> listS = new ArrayList<>();
        ArrayList<String[]> list = new ArrayList<>();
        for (Category c : listC) {
            list.add(new String[]{c.getCategoryName(), String.valueOf(jDAO.countChart(recruiter.getRecruiterId(), c.getCategoryId()))});
        }
        listS.add(new String[]{
            "Pending", String.valueOf(aDAO.countForChart("Pending", recruiter.getRecruiterId()))
        });
        listS.add(new String[]{
            "Accept", String.valueOf(aDAO.countForChart("Accept", recruiter.getRecruiterId()))
        });
        listS.add(new String[]{
            "Reject", String.valueOf(aDAO.countForChart("Reject", recruiter.getRecruiterId()))
        });
        System.out.println(listS.size());
        for (String[] row : listS) {
            System.out.println("Status: " + row[0] + ", Count: " + row[1]);
        }
        for (String[] row : list) {
            System.out.println("Category: " + row[0] + ", Count: " + row[1]);
        }
        System.out.println(list.size());
        request.setAttribute("list", list);
        request.setAttribute("listS", listS);
        request.getRequestDispatcher("Chart.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JobDAO jDAO = new JobDAO();
        CategoryDAO cDAO = new CategoryDAO();
        ArrayList<Category> listC = cDAO.getAll();
        HttpSession session = request.getSession();
        Recruiter recruiter = (Recruiter) session.getAttribute("account1");
        ArrayList<String[]> list = new ArrayList<>();
        for (Category c : listC) {
            list.add(new String[]{c.getCategoryName(), String.valueOf(jDAO.countChart(recruiter.getRecruiterId(), c.getCategoryId()))});
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("Chart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
