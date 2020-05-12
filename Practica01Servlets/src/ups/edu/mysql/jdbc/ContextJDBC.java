/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ups.edu.mysql.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ContextJDBC {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/practica?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "20CXRZgwzz17";
    private static ContextJDBC jdbc1 = null;
    private static ContextJDBC jdbc2 = null;
    private Statement statement = null;

    public ContextJDBC() {
        this.connect();
    }

    public void connect() {
        try {
            Class.forName(DRIVER);
            Connection connection = DriverManager.getConnection(URL, USER, PASS);
            this.statement = connection.createStatement();
        } catch (ClassNotFoundException e) {
            System.out.println(" (JDBC:connect)...problemas con el driver\n" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("WARNING (JDBC:connect)...problemas con la BD\n" + e.getMessage());
        }
    }

    //Metodo para realizar una consulta.
    public ResultSet query(String sql) {
        try {
            return this.statement.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("WARNING (JDBC:query): ---" + sql + "---" + e);
        }
        return null;
    }

    //Metodo para actualizar
    public boolean update(String sql) {
        try {
            this.statement.executeUpdate(sql);
            return true;
        } catch (SQLException e) {
            System.out.println("WARNING (JDBC:update)... actualizacion: ---" + sql + "---" + e);
            return false;
        }
    }

    //Metodos para retornar las conexiones
    protected static ContextJDBC getJDBC1() {
       
        if (jdbc1 == null) {
            jdbc1 = new ContextJDBC();
        }
        return jdbc1;

    }

    protected static ContextJDBC getJDBC2() {
        
        if (jdbc2 == null) {
            jdbc2 = new ContextJDBC();
        }
        return jdbc2;

    }

}
