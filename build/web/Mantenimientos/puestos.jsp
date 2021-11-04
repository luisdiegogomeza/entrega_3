<%-- 
    Document   : puestos
    Created on : 18/10/2021, 21:12:33
    Author     : justo
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Puesto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Mantenimiento puestos</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        <div class="modal fade" id="modal_empleado" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <form action="../sr_puestos" method="post" class="form-group">
                            <label for="lbl_id" ><b>ID</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                            <label for="lbl_codigo" ><b>Nombre del Puesto</b></label>
                            <input type="text" name="puesto" id="puesto" class="form-control" placeholder="Ejemplo: Gerente" required>
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
                <th>Nombre del puesto</th>
              </tr>
            </thead>
            <tbody id="tbl_empleados">
                <% 
                Puesto empleado = new Puesto();
                DefaultTableModel tabla = new DefaultTableModel();
                tabla = empleado.leer();
                for (int t=0;t<tabla.getRowCount();t++){
                    out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,1) + ">");
                    out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
                    out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
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
               $("#txt_direccion").val('');
               $("#txt_telefono").val('');
               $("#txt_fn").val('');
               $("#drop_puesto").val(1);
            }

            $('#tbl_empleados').on('click','tr td',function(evt){
               var target,id,puesto; 
               target = $(event.target);
               id = target.parent().data('id');
               puesto= target.parent("tr").find("td").eq(1).html();
               $("#txt_id").val(id);
               $("#puesto").val(puesto);
               $("#modal_empleado").modal('show');
            });

        </script>
    </body>
</html>
