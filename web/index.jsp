<%-- 
    Document   : index
    Created on : Sep 24, 2014, 3:59:19 PM
    Author     : absalom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page isErrorPage="true" %>
<%@page errorPage="error.jsp?de=login.jsp"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%!
            static boolean isUser=true;

            public boolean doCheckout(String user, String pass) {
                if (user.equalsIgnoreCase("Absalom")) {
                    if (pass.equalsIgnoreCase("root")) {
                        return true;
                    }
                }
                return false;
            }
        %>
        <%
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            if (session.getAttribute("user") != null) {
                response.sendRedirect("principal.jsp");
            }
            if (user == null) {
                if (!isUser) {
                    out.println("Error al introducir el Usuario y contraseña");
                    isUser=true;
                }


        %>
        <div>
            <fieldset>
                <legend>Login</legend>
                <form name="frmLogin" method="post" action="index.jsp" >
                    <table class="tabla" >
                        <tr>
                            <th>User:</th>
                            <td><input type="text" name="user" id="txtUsuario" class="caja" placeholder="user"/></td>
                        </tr>
                        <tr>
                            <th>Password:</th>
                            <td><input type="password" name="pass" id="txtClave" class="caja" placeholder="pass"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="Ok" class="caja2"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </div>
        <%            } else {
//logica para verificar los datos del usuario
                if (doCheckout(request.getParameter("user"), request.getParameter("pass"))) {
                    session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("pass", pass);
                    response.sendRedirect("principal.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                    isUser=false;
                }
            }
        %>
    </body>
</html>
