<%-- 
    Document   : userhome
    Created on : 24 Jul, 2017, 5:59:59 PM
    Author     : Aditya raj
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MyPackage.DatabaseManager"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Zone</title>
        <link href="css/userstyle.css" rel="stylesheet"/>
        <link href="">
    </head>
    <body style="background-image:url('images/bulb.jpg');"> 
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        if (session.getAttribute("username") == "" || session.getAttribute("username") == null)
            response.sendRedirect("../login.jsp");

        else {
        %>
        <form action="usercode/postanscode.jsp" method="post">

            <div id="wrapper">
                <div id="header">
                    <div id="logo">
                        <img src="images/logo.png" width="150" height="150"/>
                    </div>
                    <div id="sitetitle">
                        E-Study zone 
                    </div>
                </div>
                <div id="contain1" >
                    <div id="date">
<%
                     java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
                     out.print(sdf.format(new java.util.Date()));

%>
                    </div>
                    <div id="name">
                        <%
                            DatabaseManager dm = new DatabaseManager();
                            String username = session.getAttribute("username").toString();
                            String query = "select student_name from student_registration where username='" + username + "'";
                            ResultSet rs = dm.selectQuery(query);
                            if (rs.next() == true) {
                                out.print(rs.getString(1));
                            }
                        %>
                    </div>
                </div>
            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                     <li><a href="postquestion.jsp">Discussion Board</a></li>
                      <li><a href="complain.jsp">Complain</a></li>
                       <li><a href="feedback.jsp">Feedback</a></li>
                    <li><a href="changepassword.jsp">Change password</a></li>
                     <li><a href="logout.jsp">Logout</a></li>
                </ul>	
            </div>
                  
                    <div id="contain2" style="background-image:url('images/contain2.jpg');">
                        <center>
                            <h2>Post Reply</h2>
                            <br><br>
                            <table>
                                <tr>
                                <th>Question : </th>
                                <th> <%=request.getParameter("questiontext")%></th>
                                <td><input type="hidden" name="qid" value="<%=request.getParameter("qid")%>"></td>
                                
                                
                                </tr>
                                <tr>
                                     <th>Enter Answer:</th>
                                    <td><textarea name="answer"></textarea></td>
                                    <td><input type="submit" value="Post Reply"></td>
                                </tr>
                            </table>
                        </center>
                    </div>
                <div id="footer">
                    <div class="subfooter">
                        Copyright &copy; to E-Study Zone
                    </div>
                    <div class="subfooter">
                        Devloped By:Aditya Raj
                    </div>
                </div>

            </div>
        </form>
    </body>
</html>
<%
    }
%>