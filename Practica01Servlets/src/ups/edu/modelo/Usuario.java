package ups.edu.modelo;

import java.io.Serializable;
import java.util.List;



public class Usuario implements Serializable {

	private static final long serialVersionUID=1L;
	private String cedula;
	private String nombre;
	private String apellido;
	private String correo;
	private String pass;
	private int activo;
	private List<Telefono> telefonos;
	
	
	
	
	
	
	public Usuario() {
		
	}
	public Usuario(String cedula, String nombre, String apellido, String correo, String pass, int activo,
			List<Telefono> telefonos) {
		
		this.cedula = cedula;
		this.nombre = nombre;
		this.apellido = apellido;
		this.correo = correo;
		this.pass = pass;
		this.activo = activo;
		this.telefonos = telefonos;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getActivo() {
		return activo;
	}
	public void setActivo(int activo) {
		this.activo = activo;
	}
	public List<Telefono> getTelefonos() {
		return telefonos;
	}
	public void setTelefonos(List<Telefono> telefonos) {
		this.telefonos = telefonos;
	}
	@Override
	public String toString() {
		return "Usuario [cedula=" + cedula + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo
				+ ", pass=" + pass + ", activo=" + activo + ", telefonos=" + telefonos + "]";
	}
	
	
	
}