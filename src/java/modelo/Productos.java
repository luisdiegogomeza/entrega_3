/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author justo
 */
public class Productos {
    private String producto,descripcion,imagen,fecha_ingreso;
    private int id,idMarca,precio_costo,precio_venta,existencia;
    Conexion cn;
    
    public Productos(){}

    public Productos(String producto, String descripcion, String imagen, String fecha_ingreso, int id, int idMarca, int precio_costo, int precio_venta, int existencia) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.fecha_ingreso = fecha_ingreso;
        this.id = id;
        this.idMarca = idMarca;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
        this.existencia = existencia;
    }
    
    

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(int precio_costo) {
        this.precio_costo = precio_costo;
    }

    public int getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(int precio_venta) {
        this.precio_venta = precio_venta;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }
    
    public DefaultTableModel leer(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT p.idProducto as id , p.producto , m.marca , m.idMarca , p.decripcion , p.imagen , p.precio_costo , p.precio_venta , p.existencia , p.fecha_ingreso FROM eccomerce_empresa.productos as p inner join eccomerce_empresa.marcas as m on p.idMarca = m.idMarca;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","producto","marca","idMarca","descripcion","imagen","precio_costo","precio_venta","existencia","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[10];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("producto");
          datos[2] = consulta.getString("marca");
          datos[3] = consulta.getString("idMarca");
          datos[4] = consulta.getString("decripcion");
          datos[5] = consulta.getString("imagen");
          datos[6] = consulta.getString("precio_costo");
          datos[7] = consulta.getString("precio_venta");
          datos[8] = consulta.getString("existencia");
          datos[9] = consulta.getString("fecha_ingreso");
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "insert into productos(producto,idMarca,decripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso) values(?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getProducto());
            parametro.setInt(2,getIdMarca());
            parametro.setString(3,getDescripcion());
            parametro.setString(4,getImagen());
            parametro.setInt(5,getPrecio_costo());
            parametro.setInt(6,getPrecio_venta());
            parametro.setInt(7,getExistencia());
            parametro.setString(8, getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }

    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE `eccomerce_empresa`.`prouctos` SET `producto` = ?, `idMarca` = ?, `descripcion` = ?, `imagen` = ?, `precio_costo` = ?, `precio_venta` = ?, `existencia` = ?, `fecha_ingreso` = ? WHERE (`idProducto` = ?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getProducto());
            parametro.setInt(2,getIdMarca());
            parametro.setString(3,getDescripcion());
            parametro.setString(4,getImagen());
            parametro.setInt(5,getPrecio_costo());
            parametro.setInt(6,getPrecio_venta());
            parametro.setInt(7,getExistencia());
            parametro.setString(8, getFecha_ingreso());
            parametro.setInt(9, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }

    public int eliminar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from productos  where idProducto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
}
