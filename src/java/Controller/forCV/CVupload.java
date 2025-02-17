/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forCV;

import Controller.*;
import DAO.CVDAO;
import Model.CV;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "CVupload", urlPatterns = {"/CVupload"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 0, // 1 MB: Giới hạn kích thước tối thiểu của file (dùng bộ nhớ tạm)
        maxFileSize = 1024 * 1024 * 10, // 10 MB: Giới hạn kích thước tối đa của file tải lên
        maxRequestSize = 1024 * 1024 * 15 // 15 MB: Giới hạn kích thước tối đa của toàn bộ request
)
public class CVupload extends HttpServlet {

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
            out.println("<title>Servlet CVupload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CVupload at " + request.getContextPath() + "</h1>");
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
    private final String UPLOAD_DIR = ""; // Thư mục lưu file

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
        String cvlink = request.getParameter("cvFile");
        HttpSession session = request.getSession();
        Part filePart = request.getPart("CvFile");
        String fileName = filePart.getSubmittedFileName();

        // Đường dẫn lưu file trên server
        String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Tạo thư mục nếu chưa tồn tại
        }
        
        // Ghi file vào thư mục
        String filePath = uploadPath + fileName;
        filePart.write(filePath);

        // Đường dẫn file (relative)
        String cvLink = UPLOAD_DIR + fileName;  // Lưu đường dẫn tương đối
        System.out.println(cvLink);
        session.setAttribute("link", cvLink);
        JobSeeker seeker = (JobSeeker)session.getAttribute("account1");
        CV cv = new CV(0,seeker,cvLink);
        System.out.println(cv.getJobseeker().getPosition());
        CVDAO cvDAO = new CVDAO();
        cvDAO.insert(cv);
        request.getRequestDispatcher("test.jsp").forward(request, response);
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

