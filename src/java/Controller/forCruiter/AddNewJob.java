/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forCruiter;

import DAO.CategoryDAO;
import DAO.JobDAO;
import Model.Category;
import Model.Job;
import Model.Recruiter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AddNewJob", urlPatterns = {"/addNewJob"})
public class AddNewJob extends HttpServlet {

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
            out.println("<title>Servlet AddNewJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewJob at " + request.getContextPath() + "</h1>");
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
        String title = request.getParameter("title");
        String Salary = request.getParameter("salary");
        String time = request.getParameter("time");
        String experience = request.getParameter("experience");
        String Numberneed = request.getParameter("numberneed");
        String skill = request.getParameter("skill");
        String requirement = request.getParameter("requirement");
        String description = request.getParameter("description");
        String categoryID = request.getParameter("category");
        HttpSession session = request.getSession();
        Recruiter recruiter = (Recruiter) session.getAttribute("account1");
        JobDAO jDAO = new JobDAO();
        CategoryDAO cDAO = new CategoryDAO();
        try {
            int categoryId = Integer.parseInt(categoryID);
            int numberneed = Integer.parseInt(Numberneed);
            float salary = Float.parseFloat(Salary);
            Category c = cDAO.getCategorybyId(categoryId);
            Job job = new Job(0, recruiter.getCompany(), recruiter, c, title, description, requirement, time, experience, skill, numberneed, salary);
            jDAO.insert(job);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("listJobRecruiter").forward(request, response);
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
