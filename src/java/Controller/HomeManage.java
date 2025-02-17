/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.CompanyDAO;
import DAO.JobDAO;
import DAO.JobSeekerDAO;
import DAO.NotificationDAO;
import DAO.SaveJobDAO;
import Model.Category;
import Model.Job;
import Model.JobSeeker;
import Model.Notification;
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
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "HomeManage", urlPatterns = {"/home"})
public class HomeManage extends HttpServlet {

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
            out.println("<title>Servlet HomeManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeManage at " + request.getContextPath() + "</h1>");
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
        CompanyDAO comDAO = new CompanyDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        ArrayList<Category> listCate = cateDAO.getAll();
        ArrayList<String> city = comDAO.getAllCity();
        request.setAttribute("listcity", city);
        request.setAttribute("listCategory", listCate);
        JobDAO jobdao = new JobDAO();
        ArrayList<Integer> listCount = new ArrayList<>();
        for (Category c : listCate) {
            listCount.add(jobdao.countByCategoryId(c.getCategoryId()));
        }
        request.setAttribute("listCount", listCount);
        System.out.println(listCount.size());
        ArrayList<Job> listOfJobAll = jobdao.getAll();
        ArrayList<Job> listOfJob = new ArrayList<>();
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            Users user = (Users) session.getAttribute("account");
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<Notification> listNotification = nDAO.listByUser(user.getUserId());
            System.out.println(listNotification.size());
            request.setAttribute("listNotification", listNotification);
        }

        // Lấy dữ liệu từ form
        String categoryOFjob = request.getParameter("categoryOFjob");
        String locationOFjob = request.getParameter("locationOFjob");
        String Page = request.getParameter("page");
        int pageNum = 0;
        int page = 0;
        try {
            if ((categoryOFjob != null && !categoryOFjob.equals("null"))
                    || (locationOFjob != null && !locationOFjob.equals("null"))) {

                for (Job job : listOfJobAll) {
                    boolean categoryMatch = true;
                    boolean locationMatch = true;

                    // Kiểm tra nếu người dùng chọn category
                    if (categoryOFjob != null && !categoryOFjob.equals("null")) {
                        int categoryId = Integer.parseInt(categoryOFjob);  // Sử dụng categoryId thay vì categoryName
                        categoryMatch = (job.getCategory().getCategoryId() == categoryId);
                    }

                    // Kiểm tra nếu người dùng chọn location
                    if (locationOFjob != null && !locationOFjob.equals("null")) {
                        locationMatch = job.getCompany().getCity().equalsIgnoreCase(locationOFjob);
                    }

                    // Thêm job nếu phù hợp với một trong các điều kiện
                    if (categoryMatch && locationMatch) {
                        listOfJob.add(job);
                    }
                }
            } else {
                ArrayList<Job> listBypage = new ArrayList<>();
                if (Page == null) {
                    listBypage = jobdao.getAllBypage(1);
                    request.setAttribute("currentPage", 1);
                } else {
                    try {
                        page = Integer.parseInt(Page);
                        listBypage = jobdao.getAllBypage(5 * page - 5);
                    } catch (NumberFormatException e) {
                        System.out.println(e);
                    }
                    request.setAttribute("currentPage", page);
                }
                listOfJob = listBypage; // Nếu không có điều kiện lọc, trả về toàn bộ danh sách
            }
            int size = listOfJobAll.size();
            pageNum = size / 5;
            if (size % 5 != 0) {
                pageNum += 1;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // In ra lỗi để kiểm tra
        }
        // Gửi dữ liệu tới JSP
        request.setAttribute("listOfJob", listOfJob);
        request.setAttribute("pageNum", pageNum);
        SaveJobDAO svDAO = new SaveJobDAO();
//        HttpSession session = request.getSession();
//        Users user = (Users) session.getAttribute("user");
//        JobSeekerDAO seekerDAO = new JobSeekerDAO();
//        JobSeeker seeker = seekerDAO.getByUserId(user.getUserId());
//        ArrayList<SaveJob> listSaveJob = svDAO.listOfSaveJobtBySeeker(seeker.getSeekerId());
//        for (SaveJob sv : listSaveJob) {
//            if (sv.getJob().equals(job) && sv.getJobseeker().equals(jobseeker)) {
//                isSaved = true;
//                break;
//            }
//        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        serchforJob s = new serchforJob();
        s.doGet(request, response);
        ListJob l = new ListJob();
        l.doGet(request, response);
        SaveJobDAO svDAO = new SaveJobDAO();
//        HttpSession session = request.getSession();
//        Users user = (Users) session.getAttribute("user");
//        JobSeekerDAO seekerDAO = new JobSeekerDAO();
//        JobSeeker seeker = seekerDAO.getByUserId(user.getUserId());
//        ArrayList<SaveJob> listSaveJob = svDAO.listOfSaveJobtBySeeker(seeker.getSeekerId());
//        for (SaveJob sv : listSaveJob) {
//            if (sv.getJob().equals(job) && sv.getJobseeker().equals(jobseeker)) {
//                isSaved = true;
//                break;
//            }
//        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
