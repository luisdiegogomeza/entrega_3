<%-- 
    Document   : menu
    Created on : 27/10/2021, 18:14:57
    Author     : justo
--%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.menu"%>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menus</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Menu</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
             <form action="../sr_menu" method="post" class="form-group">
               <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                <label for="lbl_nombres" ><b>Titulo</b></label>
                <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" placeholder="Ejemplo: Productos" required>   
                <label for="lbl_nombres" ><b>Nivel</b></label>
                <input type="number" name="txt_nivel" id="txt_nivel" class="form-control" placeholder="Ejemplo: 1" required>   
                <label for="lbl_puesto" ><b>Hijo de:</b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <% 
                        menu menu = new menu();
                        HashMap<String,String> drop = menu.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                         
                    
                    %>
                </select>
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
        <th>Nombre</th>
        <th>Nivel</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <% 
        menu Menu = new menu();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = Menu.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,3) + ">");
            out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
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
       $("#txt_nombre").val('');
       $("#txt_nivel").val('');
    }
   
    $('#tbl_empleados').on('click','tr td',function(evt){
       var target,id,id_p,nombre,nivel; 
       target = $(event.target);
       id = target.parent().data('id'); 
       id_p = target.parent().data('id_p'); 
       nombre= target.parent("tr").find("td").eq(1).html();
       nivel= target.parent("tr").find("td").eq(2).html();
       $("#txt_id").val(id);
       $("#txt_nombre").val(nombre);
       $("#txt_nivel").val(nivel);
       $("#drop_puesto").val(id_p);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>

