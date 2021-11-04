<%-- 
    Document   : index
    Created on : 11/08/2020, 15:53:07
    Author     : paiz2
--%>

<%@page import="modelo.menu"%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
    </head>
    <body>
        <header>
            <ul class="menu">
            <% 
        menu menu = new menu();
        DefaultTableModel tabla = new DefaultTableModel();
        DefaultTableModel tabla2 = new DefaultTableModel();
        DefaultTableModel tabla3 = new DefaultTableModel();
        tabla = menu.primer_nivel();
        tabla2 = menu.segundo_nivel();
        tabla3 = menu.tercer_nivel();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<li>"); 
            out.println(tabla.getValueAt(t,0)); 
            for (int t2=0;t2<tabla2.getRowCount();t2++){
                   out.println("<ul>"); 
                   out.println("<li>"); 
                   out.println(tabla2.getValueAt(t2,0)); 
                   for (int t3=0;t3<tabla3.getRowCount();t3++){
                   out.println("<ul>"); 
                   out.println("<li>" + tabla3.getValueAt(t3,0) + "<li>"); 
                   out.println("</ul>"); 
                }
                out.println("</li>");
                out.println("</ul>"); 
                }
                out.println("</li>");    
        }
        %>
            </ul>
        </header>
      

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
       var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento; 
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p'); 
       codigo = target.parent("tr").find("td").eq(0).html();
       nombres= target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       nacimiento = target.parent("tr").find("td").eq(5).html();
       $("#txt_id").val(id);
       $("#txt_codigo").val(codigo);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#txt_fn").val(nacimiento);
       $("#drop_puesto").val(id_p);
       $("#modal_empleado").modal('show');
    });
    
</script>
    </body>
</html>
