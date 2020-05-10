/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ups.edu.dao;


import ups.edu.mysql.jdbc.JDBCTelefonoDAO;
import ups.edu.mysql.jdbc.JDBCUsuarioDAO;


public class JDBCDAOFactory extends DAOFactory{

    @Override
    public void createTables() {
        this.getUsuarioDAO().createTable();
        this.getTelefonoDAO().createTable();
    }

    @Override
    public UsuarioDAO getUsuarioDAO() {
        return new JDBCUsuarioDAO();
    }

    @Override
    public TelefonoDAO getTelefonoDAO() {
        return new JDBCTelefonoDAO();
    }
    
}
