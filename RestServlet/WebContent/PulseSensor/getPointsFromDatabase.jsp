<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="it.uniroma2.pulsesensor.servlet.Shared"%>
<%@ page import="java.lang.NumberFormatException"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="it.uniroma2.pulsesensor.data.Point"%>
<%@ page import="it.uniroma2.pulsesensor.database.MysqlConnect" %>
<%@ page import="java.sql.SQLException" %>

<%	
	String selectedUid = request.getParameter("uid");
	String strDateFrom = request.getParameter("dateFrom");
	String strDateTo = request.getParameter("dateTo");

	//System.out.println("DB: " + request.getMethod());
	
	Long uid = null;
	Long dateFrom = null;
	Long dateTo = null;
	
	try
	{		
		if(selectedUid != null)
			uid = Long.parseLong(selectedUid);
		if(strDateFrom != null)
			dateFrom = Long.parseLong(strDateFrom);
		if(strDateTo != null)
			dateTo = Long.parseLong(strDateTo);
			
		MysqlConnect mysql = MysqlConnect.getDbCon();
		
		ArrayList<Point> points = mysql.getPointsByUidAndDate(uid, dateFrom, dateTo);
		
		JSONArray json = new JSONArray(points);
		
		//out.println(points.size());
		out.println(json.toString());	
	}
	catch(SQLException e)
	{
		out.println("[]"); //array vuoto
		return;
	}
	catch(NumberFormatException e)
	{
		out.println("[]"); //se un valore non valido, invio array vuoto
		return;
	}
	
%>