<%-- 
    Document   : productos
    Created on : 19/10/2021, 13:25:07
    Author     : justo
--%>
<%@page import="modelo.Marcas" %>
<%@page import="modelo.Productos" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario productos</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
             <form action="../sr_producto" method="POST" enctype="multipart/form-data" class="form-group" >
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>Producto</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Nombre1" required>
                <label for="lbl_puesto" ><b>Marcas</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <% 
                        Marcas marcas = new Marcas();
                        HashMap<String,String> drop = marcas.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                         
                    
                    %>
                </select>
                <label for="lbl_direccion" ><b>Imagen</b></label>
                <input type="file"  name="fileImagen" id="txt_imagen" class="form-control" >
                <label for="lbl_apellidos" ><b>Descripcion</b></label>
                <textarea type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: Es un producto con mas de..." required></textarea>
                <label for="lbl_telefono" ><b>Precio costo</b></label>
                <input type="number" name="txt_precio_costo" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>
                <label for="lbl_direccion" ><b>Precio venta</b></label>
                <input type="number"  name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 3456765-445-345" required>
                <label for="lbl_direccion" ><b>Existencias</b></label>
                <input type="number"  name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: Masculino" required>
                <label for="lbl_direccion" ><b>Fecha ingreso</b></label>
                <input type="date"  name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" >
                <br>
                <button type="submit" name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                <button type="submit" name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button type="submit" name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
      </div>
      
    </div>
  </div>
                
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Imagen</th>
        <th>Precio costo</th>
        <th>Precio venta</th>
        <th>Existencias</th>
        <th>Fecha ingreso</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <% 
        Productos prouctos = new Productos();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = prouctos.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,3) + ">");
            out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            //out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td><img src='" + tabla.getValueAt(t,5) + "' width='30%'></td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,9) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript">
    function limpiar(){
        $("#txt_id").val(0);
       $("#txt_producto").val('');
       $("#drop_puesto").val(1);
       $("#txt_descripcion").val('');
       $("#txt_imagen").val('');
       $("#txt_precio_costo").val('');
       $("#txt_precio_venta").val('');
       $("#txt_existencia").val('');
       $("#txt_fecha_ingreso").val('');
    }
   
    $('#tbl_empleados').on('click','tr td',function(evt){
       var target,id,id_p,producto,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p'); 
       producto= target.parent("tr").find("td").eq(1).html();
       descripcion = target.parent("tr").find("td").eq(3).html();
       imagen = target.parent("tr").find("td").eq(4).html();
       precio_costo = target.parent("tr").find("td").eq(5).html();
       precio_venta = target.parent("tr").find("td").eq(6).html();
       existencia = target.parent("tr").find("td").eq(7).html();
       fecha_ingreso = target.parent("tr").find("td").eq(8).html();
       $("#txt_id").val(id);
       $("#txt_producto").val(producto);
       $("#drop_puesto").val(id_p);
       $("#txt_descripcion").val(descripcion);
       //$("#txt_imagen").val(imagen);
       $("#txt_precio_costo").val(precio_costo);
       $("#txt_precio_venta").val(precio_venta);
       $("#txt_existencia").val(existencia);
       $("#txt_fecha_ingreso").val(fecha_ingreso);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>
