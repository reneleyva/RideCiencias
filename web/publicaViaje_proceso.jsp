<%@page import="controlador.Ruta;"%>
<%@page import="controlador.Usuario;"%>

<%
    
    String destino = request.getParameter("destino");
    String salida = request.getParameter("salida");
    String horas = request.getParameter("horas");
    String minutos = request.getParameter("minutos");
    String fecha = request.getParameter("fecha");
    int cupo = Integer.parseInt(request.getParameter("cupo"));
    int precio = Integer.parseInt(request.getParameter("precio"));
    
    Ruta ruta = new Ruta();
    Usuario user = (Usuario) session.getAttribute("usuario");
    System.out.println("Usuario!!!" + user.getIdusuario());
    boolean estado = false;

    ruta.conecta();
    int id = ruta.getMaximoId();
    System.out.println("MAximo ID ruta: " + id);
    id += 1;
    estado = ruta.guardaRuta(id, destino, salida, fecha, horas + ":" + minutos, cupo, user.getIdusuario(), precio);
    ruta.desconecta();

    if (estado) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Se registr� el viaje correctamente!');");
        out.println("location='paginaUsuario.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Hubo un error registrando el viaje.');");
        out.println("location='paginaUsuario.jsp';");
        out.println("</script>");
    }
%>