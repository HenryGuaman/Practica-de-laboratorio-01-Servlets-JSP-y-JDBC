/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ups.edu.mysql.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ups.edu.dao.DAOFactory;
import ups.edu.dao.UsuarioDAO;
import ups.edu.modelo.Telefono;
import ups.edu.modelo.Usuario;


public class JDBCUsuarioDAO extends JDBCGenericDAO<Usuario, String> implements UsuarioDAO {

    @Override
    public void createTable() {
        conexionUno.update("CREATE TABLE IF NOT EXISTS usuario ("
                + "	usu_cedula VARCHAR(10) NOT NULL,"
                + "	usu_nombre VARCHAR(50),"
                + "	usu_apellido VARCHAR(50),"
                + "	usu_correo VARCHAR(100),"
                + "	usu_pass VARCHAR(255),"
                + "	usu_activo INT,"
                + "	PRIMARY KEY (usu_cedula)"
                + ");");
    }

    @Override
    public boolean create(Usuario user) {
        return conexionUno.update("INSERT INTO usuario VALUES ('" + user.getCedula() + "', '" + user.getNombre() + "', '" + user.getApellido() + "', '" + user.getCorreo() + "', '" + user.getPass() + "'," + user.getActivo() + ");");
    }

    @Override
    public Usuario findById(String cedula) {
    	Usuario usuario = null;
        ResultSet res = conexionUno.query("SELECT * FROM usuario WHERE usu_cedula = '" + cedula + "';");
        try {
            if (res != null && res.next()) {
            	usuario = new Usuario(res.getString("usu_cedula"), res.getString("usu_nombre"), res.getString("usu_apellido"), res.getNString("usu_correo"), res.getNString("usu_pass"), res.getInt("usu_activo"));
                List<Telefono> telefono = DAOFactory.getDAOFactory().getTelefonoDAO().findByUserId(usuario.getCedula());
                usuario.setTelefonos(telefono);
            }
        } catch (SQLException e) {
            System.out.println(">>>WARNING (JDBCUserDAO:findById): " + e.getMessage());
        }
        return usuario;
    }

    @Override
    public boolean update(Usuario usuario) {
        return conexionUno.update("UPDATE usuario SET "
                + "	usu_nombre = '" + usuario.getNombre() + "',"
                + "	usu_apellido = '" + usuario.getApellido() + "',"
                + "	usu_pass  = '" + usuario.getPass() + "'"
                + "	WHERE usu_cedula = '" + usuario.getCedula() + "';");
    }

    @Override
    public boolean delete(Usuario usuario) {
        return conexionUno.update("UPDATE usuario SET "
                + "	usu_activo = " + usuario.getActivo()
                + "	WHERE usu_cedula = '" + usuario.getCedula() + "';");
    }

    @Override
    public List<Usuario> find() {
        List<Usuario> usuario = new ArrayList<>();

        ResultSet rs = conexionUno.query("SELECT * FROM usuario;");
        try {
            while (rs.next()) {
                Usuario user = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"), rs.getNString("usu_apellido"), rs.getNString("usu_correo"), rs.getNString("usu_pass"), rs.getInt("usu_activo"));
                List<Telefono> phones = DAOFactory.getDAOFactory().getTelefonoDAO().findByUserId(user.getCedula());
                user.setTelefonos(phones);
                usuario.add(user);
            }
        } catch (SQLException e) {
            System.out.println(">>>WARNING (JDBCUserDAO:find): " + e.getMessage());
        }
        return usuario;
    }

    @Override
    public Usuario findUser(String correo, String pass) {
    	
        Usuario user = null;
        ResultSet rs = conexionUno.query("SELECT * FROM usuario WHERE usu_correo = '" + correo + "' AND usu_pass = '" + pass + "';");
        try {
            if (rs != null && rs.next()) {
                user = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"), rs.getNString("usu_apellido"), rs.getNString("usu_correo"), rs.getNString("usu_pass"), rs.getInt("usu_activo"));
                List<Telefono> phones = DAOFactory.getDAOFactory().getTelefonoDAO().findByUserId(user.getCedula());
                user.setTelefonos(phones);
            }
        } catch (SQLException e) {
            System.out.println(">>>WARNING (JDBCUserDAO:findUser): " + e.getMessage());
        }
        return user;
    }

    @Override
    public List<Usuario> findByIdOrMail(String context) {
        List<Usuario> users = new ArrayList<>();
        if (context.equals("all")) {
            ResultSet rs = conexionUno.query("SELECT * FROM usuario;");
            try {
                if (rs != null && rs.next()) {
                    Usuario user = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"), rs.getString("usu_apellido"), rs.getString("usu_correo"), rs.getString("usu_pass"), rs.getInt("usu_activo"));
                    List<Telefono> phones = DAOFactory.getDAOFactory().getTelefonoDAO().findByUserId(user.getCedula());
                    user.setTelefonos(phones);
                    users.add(user);
                }
            } catch (SQLException e) {
                System.out.println(">>>WARNING (JDBCUserDAO:findByIdOrMail): " + e.getMessage());
            }
            System.out.println("Todos los usuarios....."+users.toString());
        } else {
            ResultSet rs = conexionUno.query("SELECT * FROM usuario "
                    + "WHERE usu_cedula = '" + context + "' OR usu_correo = '" + context + "';");
            try {
                if (rs != null && rs.next()) {
                    Usuario user = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"), rs.getString("usu_apellido"), rs.getString("usu_correo"), rs.getString("usu_pass"), rs.getInt("usu_activo"));
                    List<Telefono> phones = DAOFactory.getDAOFactory().getTelefonoDAO().findByUserId(user.getCedula());
                    user.setTelefonos(phones);
                    users.add(user);
                }
            } catch (SQLException e) {
                System.out.println(">>>WARNING (JDBCUserDAO:findByIdOrMail): " + e.getMessage());
            }
        }

        return users;
    }
}
