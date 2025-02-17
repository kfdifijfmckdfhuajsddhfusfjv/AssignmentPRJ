/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ApplicationDAO;
import DAO.CVDAO;
import DAO.JobDAO;
import DAO.JobSeekerDAO;
import Model.Application;
import Model.CV;
import Model.Job;
import Model.JobSeeker;
import Model.Users;
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
@WebServlet(name = "JobDetail", urlPatterns = {"/JobDetail"})
public class JobDetail extends HttpServlet {

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
            out.println("<title>Servlet JobDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobDetail at " + request.getContextPath() + "</h1>");
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
        String jobID = request.getParameter("jobId");
        int jobId=0;
        JobDAO jobDAO = new JobDAO();
        Job job = new Job();
        try {
            jobId = Integer.parseInt(jobID);
            job = jobDAO.getById(jobId);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        System.out.println(jobId);
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("account");
        JobSeekerDAO seekerDAO = new JobSeekerDAO();
        JobSeeker seeker = seekerDAO.getByUserId(user.getUserId());
        CVDAO cvDAO = new CVDAO();
        ApplicationDAO appDAO = new ApplicationDAO();
        ArrayList<Application> listApp = appDAO.getBySeeker(seeker.getSeekerId());
        System.out.println(listApp.size());
        String mess = null;
        for (Application a : listApp) {
            if (a.getJob().getJobId() == job.getJobId() && a.getCv().getJobseeker().getSeekerId() == seeker.getSeekerId()) {
                mess = "exist";
                if(a.getStatus().equalsIgnoreCase("Accept")){
                    mess="accept";
                }
            }
        }
        ArrayList<Job> listRelate = jobDAO.listRelate(jobId, job.getCategory().getCategoryId());
        System.out.println(listRelate.size());
        System.out.println(mess);
        ArrayList<CV> listCV = cvDAO.getBySeeker(seeker.getSeekerId());
        request.setAttribute("mess", mess);
        request.setAttribute("listCV", listCV);
        request.setAttribute("jobgetById", job);
        request.setAttribute("listRelate", listRelate);
        request.getRequestDispatcher("job-detail.jsp").forward(request, response);
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
        processRequest(request, response);
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
