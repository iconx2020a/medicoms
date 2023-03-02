<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://10.0.64.2:3306/testdb?autoReconnect=true&useSSL=false";
    String database = "testdb";
    String userid = "root";
    String password = "root";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection = null;
    Statement = null;
    ResultSet = null;
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>All Users</h1>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>first name</td>
                <td>last name</td>

            </tr>
            <%
                try {
  connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement = connection.createStatement();
                    String sql = "select * from Person";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getString("FirstName")%></td>
                <td><%=resultSet.getString("LastName")%></td>
                <td><%=resultSet.getInt("ID")%></td>
            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <h2> <a href="HomePage.jsp"> Home</a></h2>
    </body>
</html>
