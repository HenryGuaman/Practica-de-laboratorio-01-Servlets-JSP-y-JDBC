package modelo;

import java.io.Serializable;
import java.util.Set;



public class Usuario implements Serializable {

	private static final long serialVersionUID=1L;
	private String cedula;
	private String nombre;
	private String apellido;
	private String correo;
	private String contrasenia;
	private Set<Telefono> telefonos;
	
	public Usuario(String cedula, String nombre, String apellido, String correo, String contrasenia,Set<Telefono> telefonos) {
		this.cedula = cedula;
		this.nombre = nombre;
		this.apellido = apellido;
		this.correo = correo;
		this.contrasenia = contrasenia;
		this.telefonos = telefonos;
	}
	public Usuario() {
	
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
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	public Set<Telefono> getTelefonos() {
		return telefonos;
	}
	public void setTelefonos(Set<Telefono> telefonos) {
		this.telefonos = telefonos;
	}
	@Override
	public String toString() {
		return "Usuario [cedula=" + cedula + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo
				+ ", contrasenia=" + contrasenia + "]";
	}
	
	
}
