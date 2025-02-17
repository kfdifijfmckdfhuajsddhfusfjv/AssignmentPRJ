/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forSeeeker;

import DAO.ApplicationDAO;
import DAO.CVDAO;
import DAO.JobDAO;
import Model.Application;
import Model.CV;
import Model.Job;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "ApplyForSeeker", urlPatterns = {"/Apply"})
public class ApplyForSeeker extends HttpServlet {

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
            out.println("<title>Servlet ApplyForSeeker</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyForSeeker at " + request.getContextPath() + "</h1>");
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
        ApplicationDAO appDAO = new ApplicationDAO();
        HttpSession session = request.getSession();
        JobSeeker seeker = (JobSeeker) session.getAttribute("account1");
        String jobID = request.getParameter("jobID");
        String cvID = request.getParameter("cvId");
        System.out.println("jobID: " + jobID);
        System.out.println("cvID: " + cvID);
        JobDAO jobDAO = new JobDAO();
        CVDAO cvDAO = new CVDAO();
        String mess = null;
        try {
            int jobId = Integer.parseInt(jobID);
            int cvId = Integer.parseInt(cvID);
            Job job = jobDAO.getById(jobId);
            CV cv = cvDAO.getByCvID(cvId);
            SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
            Date curDate;
            curDate = Calendar.getInstance().getTime();
            String status = "Pending";
            Application app = new Application(0, job, cv, curDate, status);
            System.out.println(app.getStatus());
            ArrayList<Application> list = appDAO.getBySeeker(cv.getJobseeker().getSeekerId());
            System.out.println(list.size());
            int cnt = 0;
            for (Application a : list) {
                if (a.getJob().getJobId() == job.getJobId() && a.getCv().getJobseeker().getSeekerId() == seeker.getSeekerId()
                        && a.getStatus().equalsIgnoreCase("Pending")) {
                    System.out.println(a.getCv().getCvId());
                    System.out.println(cvId);
                    appDAO.updateCV(cvId,a.getApplicationId());       
                    cnt++;
                }else if(a.getJob().getJobId() == job.getJobId() && a.getCv().getJobseeker().getSeekerId() == seeker.getSeekerId()
                        && a.getStatus().equalsIgnoreCase("Accept")){
                    cnt++;
                }
            }
            if (cnt == 0) {
                appDAO.insert(app);
            }
            request.getRequestDispatcher("JobDetail?jobId="+jobId).forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        System.out.println("không ra");
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
