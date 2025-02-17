/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forSeeeker;

import Controller.*;
import DAO.JobDAO;
import DAO.JobSeekerDAO;
import DAO.SaveJobDAO;
import Model.Job;
import Model.JobSeeker;
import Model.SaveJob;
import Model.Users;
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
@WebServlet(name = "SaveJob", urlPatterns = {"/savejob"})
public class SaveJObManager extends HttpServlet {

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
            out.println("<title>Servlet SaveJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveJob at " + request.getContextPath() + "</h1>");
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
        String check = request.getParameter("check");
        String jobId = request.getParameter("jobId");
        System.out.println(jobId);
        if (check == null) {
            try {
                SaveJobDAO svDAO = new SaveJobDAO();
                JobDAO jobDAO = new JobDAO();
                JobSeekerDAO seekerDAO = new JobSeekerDAO();
                HttpSession session = request.getSession();
                JobSeeker jobseeker = (JobSeeker) session.getAttribute("account1");
                int id = Integer.parseInt(jobId);
                Job job = jobDAO.getById(id);
                SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                Date curDate;
                curDate = Calendar.getInstance().getTime();
                String date = dateformat.format(curDate);
                SaveJob savejob = new SaveJob(0, jobseeker, job, date);
                svDAO.insert(savejob);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            request.getRequestDispatcher("home").forward(request, response);
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
        String jobId = request.getParameter("jobId");
        boolean save = Boolean.parseBoolean(request.getParameter("save"));
        boolean isSaved = false;
        // Xử lý lưu/bỏ lưu công việc trong cơ sở dữ liệu
        try {
            SaveJobDAO svDAO = new SaveJobDAO();
            JobDAO jobDAO = new JobDAO();
            JobSeekerDAO seekerDAO = new JobSeekerDAO();
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("account");
            JobSeeker seeker = seekerDAO.getByUserId(user.getUserId());
            int id = Integer.parseInt(jobId);
            Job job = jobDAO.getById(id);
            ArrayList<SaveJob> listForDelete = svDAO.listOfSaveJobtBySeeker(seeker.getSeekerId());
            System.out.println(listForDelete.size());
            if (save) {
                SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                Date curDate;
                curDate = Calendar.getInstance().getTime();
                String date = dateformat.format(curDate);
                SaveJob savejob = new SaveJob(0, seeker, job, date);
                int cnt = 0;
                for (SaveJob sv : listForDelete) {
                    if (sv.getJob().getJobId()== job.getJobId() && sv.getJobseeker().getSeekerId()== seeker.getSeekerId()) {
                        cnt++;
                    }
                }
                System.out.println(cnt);
                if (cnt == 0) {
                    svDAO.insert(savejob);
                    System.out.println("insert");
                    isSaved = true;
                }else{
                    isSaved = false;
                }
                
                
            } else {
                for (SaveJob sv : listForDelete) {
                    if (sv.getJob().getJobId()== job.getJobId() && sv.getJobseeker().getSeekerId()== seeker.getSeekerId()) {
                        svDAO.delete(sv.getSaveJobId());
                        System.out.println("delete");
                        break;
                    }
                }
                isSaved = false;
            }

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        // Trả về kết quả cho AJAX (có thể trả về JSON nếu cần)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isSaved\": " + isSaved + "}");
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
