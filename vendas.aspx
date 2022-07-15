<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      //google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
     /* function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['FIAT', 3300],
          ['FORD', 1151.5],
          ['VOLKS', 1500],
          ['TOYOTA', 1445.61],
          ['HYUNDAI', 2121]
        ]);
        var options = {'title':'Vendas do Periodo 01/08/2016 a 31/08/2016'};

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }*/

      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>    
    <!--<div id="chart_div" style="width: 900px; height: 500px;"></div>-->
    <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
</html>
