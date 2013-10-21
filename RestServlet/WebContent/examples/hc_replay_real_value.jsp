<!DOCTYPE HTML>
<html>

<%@ include file="checkIfLogged.jsp" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<script type="text/javascript" src="jquery/jquery-ui-timepicker-addon.js" ></script>

	<script type="text/javascript" src="highstock/js/highstock.js" ></script>
	<script type="text/javascript" src="highstock/js/modules/exporting.js" ></script>
	<script type="text/javascript" src="highstock/js/themes/dark-blue.js" ></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#datetimepicker').datetimepicker( {
				addSliderAccess: true,
				sliderAccessArgs: { touchonly: false }
			});
			$('#datetimepicker2').datetimepicker({
				addSliderAccess: true,
				sliderAccessArgs: { touchonly: false }
			});
		});
	</script>
		
	<!-- HighStock -->
	<script type="text/javascript">
	
		$(function ()
		{
			// Create the chart
			$('#container').highcharts('StockChart', {
				chart: {
			    	zoomType: 'x',		
				},
	
			    rangeSelector: {
			        selected: 1
			    },
	
			    title: {
			        text: 'Pulse Sensor Replay'
			    },
			    
			    series: [{
			    	name: 'replay',
		            data: (function() 
		               	   {
		            			var data = new Array();
	                    		data.push({x: 0, y: 0}); //inserisco almeno un punto perch� altrimenti non disegna nulla
			                    return data;
		               		})(),
		            //data: data,
			        type: 'spline',
			        tooltip: {
			        	valueDecimals: 2
			        }
			    }]
			});
		});	
	</script>
</head>
<body>
	<div id="wrapper">	
		<div id="sidebar">
			<div id="infoID">
			</div>
			<div id="datetime">
				<form name="date_form">
					<div><h3>From:</h3>
					<input name="date_from" id="datetimepicker"/>
					</div>
					<div><h3>To:</h3>
					<input name="date_to" id="datetimepicker2"/>
					</div>
					<div>
					<input id="idate" type="button" value="Invia" onclick="getDateAndTime()">
					</div>					
				</form>
			</div>	
		</div>
		<div id="chart_wrapper">
			<div id="container"></div>
		</div>
	</div>
</body>
</html>