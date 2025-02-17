/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.forCV;

import DAO.CVDAO;
import Model.CV;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "ReadFileCV", urlPatterns = {"/readfile"})
public class ReadFileCV extends HttpServlet {

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
            out.println("<title>Servlet ReadFileCV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReadFileCV at " + request.getContextPath() + "</h1>");
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
    private static final String UPLOAD_DIR = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy đường dẫn file từ request hoặc từ session (từ database)
        String cvId = request.getParameter("cvId");
        CVDAO cvDAO = new CVDAO();
        try {
            int cvID = Integer.parseInt(cvId);
            CV cv = cvDAO.getByCvID(cvID);
            String fileName = cv.getCvLink(); // Giả sử fileName được lấy từ session hoặc database
            String filePath = getServletContext().getRealPath("") + File.separator +fileName;
            System.out.println(filePath);
            File downloadFile = new File(filePath);
            if (!downloadFile.exists()) {
                response.getWriter().println("File không tồn tại nhu con cac !");
                return;
            }

            // Đặt kiểu nội dung cho file (cần thiết để trình duyệt nhận biết)
            String mimeType = getServletContext().getMimeType(filePath);
            if (mimeType == null) {
                // Nếu không xác định được kiểu nội dung, mặc định là binary stream
                mimeType = "application/octet-stream";
            }
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());

            // Đặt tiêu đề tải xuống cho file
            response.setHeader("Content-Disposition", "inline; filename=\"" + downloadFile.getName() + "\"");

            // Gửi dữ liệu file tới trình duyệt
            try (FileInputStream inStream = new FileInputStream(downloadFile); OutputStream outStream = response.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;

                // Đọc file và gửi dữ liệu qua OutputStream
                while ((bytesRead = inStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
            }
        } catch (IOException | NumberFormatException e) {
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
