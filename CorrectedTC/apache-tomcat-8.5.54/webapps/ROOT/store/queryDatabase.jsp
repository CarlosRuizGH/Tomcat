<%/******
 This page create a connection to the Department database, and count all departments in the table department using the 
//ut.JAR.CPEN410.MySQLConnector class.**/
%>
<%//Import the ut.JAR.CPEN410 package for accessing the database %>
<%@ page import="storeClasses.JAR.classes.*"%>
<%//Import the java.sql package to use the ResultSet class %>
<%@ page import="java.sql.*"%>

<html>
	<head>
		<title>Your first web form!</title>
	</head>
	<body>
	<%
	
	System.out.println("Testing");
		
		//Define the fields to be projected, the tables to be selected and the where clause
		String fields, tables, whereClause;
		//Define the projected fields
		fields ="dep_name, dep_desc";
		//Define the selected tables
		tables="department";
		//Establish the where clause
		whereClause="dep_name!='Merengue'";		
		
		//Try to connect the database using the MySQLConnector class	
		try{
			//Create a MySQLConnector object
			MySQLCompleteConnector conn = new MySQLCompleteConnector();
			System.out.println("Connecting...");
			//Open the connection
			conn.doConnection();
			//Perform the query
			ResultSet res=conn.doSelect(fields, tables, whereClause);
		
		
			//Iterate over the ResulSet containing all departments in the database, and count how many tuples were retrieved
			int count=0;
			while (res.next())
			{
				count++;
				
			}%>
			Amount of Departments:  <%=count%>;
			
			<%res.close();
			conn.closeConnection();
			
		} catch(Exception e)
		{
			e.printStackTrace();
		}%>		
		
	</body>
</html>