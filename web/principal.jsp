<%-- 
    Document   : principal
    Created on : Sep 27, 2014, 11:01:04 PM
    Author     : absalom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>principal</title>
    </head>
    <body>

        <%
            if(session.getAttribute("user")==null){
                response.sendRedirect("index.jsp");
            }
            if (request.getParameter("sessionClose") == null) {
                
                session = request.getSession();
                out.print("Bienvenido "
                        + session.getAttribute("user"));
        %>
        <form>
        <input type="hidden" name="sessionClose" value="true">
        <input type="submit" value="logout" formaction="principal.jsp" formmethod="post">
        </form>
        <%} else {
                session.removeAttribute("user");
                session.removeAttribute("pass");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
