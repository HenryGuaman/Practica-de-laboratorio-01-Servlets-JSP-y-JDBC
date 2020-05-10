/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ups.edu.dao;

import ups.edu.modelo.Telefono;

import java.util.List;


public interface TelefonoDAO extends GenericDAO<Telefono, Integer>{
    public abstract List<Telefono> findByUserId(String cedula);
}
