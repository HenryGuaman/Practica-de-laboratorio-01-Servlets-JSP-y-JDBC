/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ups.edu.servlets;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ups.edu.dao.DAOFactory;
import ups.edu.dao.UsuarioDAO;
import ups.edu.modelo.Usuario;


@WebServlet(name = "Registro", urlPatterns = {"/registro"})
public class Registro extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/html/pagina-registro.html");
        dispatcher.forward(request, response);
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
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String mail = request.getParameter("mail");
        String pass = request.getParameter("pass");
        int activo = 1;
        UsuarioDAO usuarioDao = DAOFactory.getDAOFactory().getUsuarioDAO();
        Usuario usuario = new Usuario(cedula, nombre, apellido, mail, pass, activo);
        if (usuarioDao.create(usuario)) {
            response.sendRedirect("login");
        }else{
            System.out.println("Usuario No Creado");
            response.sendRedirect("registro");
        }
        
        
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
