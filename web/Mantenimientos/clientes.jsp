<%-- 
    Document   : clientes
    Created on : 19/10/2021, 11:16:41
    Author     : justo
--%>
<%@page import="modelo.Clientes" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario clientes</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
             <form action="../sr_clientes" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                <label for="lbl_direccion" ><b>Nit</b></label>
                <input type="text"  name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: C/f" required>
                <label for="lbl_direccion" ><b>Genero</b></label>
                <input type="text"  name="txt_genero" id="txt_genero" class="form-control" placeholder="Ejemplo: Masculino" required>      
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>
                <label for="lbl_direccion" ><b>Correo electronico</b></label>
                <input type="mail"  name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: prueba@gmail.com" required>    
                <label for="lbl_direccion" ><b>Fecha ingreso</b></label>
                <input type="date"  name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
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
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Nit</th>
        <th>Genero</th>
        <th>Telefono</th>
        <th>Correo electronico</th>
        <th>Ingreso</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <% 
        Clientes clientes = new Clientes();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = clientes.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + ">");
            out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
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
       $("#txt_codigo").val('');
       $("#txt_nombres").val('');
       $("#txt_apellidos").val('');
       $("#txt_nit").val('');
       $("#txt_genero").val('');
       $("#txt_telefono").val('');
       $("#txt_correo").val('');
       $("#txt_fecha_ingreso").val('');
    }
   
    $('#tbl_empleados').on('click','tr td',function(evt){
       var target,id,codigo,nombres,apellidos,nit,genero,telefono,correo,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id'); 
       nombres= target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       nit = target.parent("tr").find("td").eq(3).html();
       genero = target.parent("tr").find("td").eq(4).html();
       telefono = target.parent("tr").find("td").eq(5).html();
       correo = target.parent("tr").find("td").eq(6).html();
       fecha_ingreso = target.parent("tr").find("td").eq(7).html();
       $("#txt_id").val(id);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_nit").val(nit);
       $("#txt_genero").val(genero);
       $("#txt_telefono").val(telefono);
       $("#txt_correo").val(correo);
       $("#txt_fecha_ingreso").val(fecha_ingreso);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>
