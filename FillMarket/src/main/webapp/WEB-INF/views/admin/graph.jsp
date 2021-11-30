<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
    #chartdivv {
      width: 100%;
      height: 500px;
    }
</style>
    

    <!-- Chart code -->
    <script>
    am5.ready(function() {
    
    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("chartdivv");
    
    
    // Set themes
    // https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
      am5themes_Animated.new(root)
    ]);
    
    
    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
      panX: true,
      panY: true,
      wheelX: "panX",
      wheelY: "zoomX"
    }));
    
    chart.get("colors").set("step", 3);
    
    
    // Add cursor
    // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);
    
    
    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xAxis = chart.xAxes.push(am5xy.DateAxis.new(root, {
      maxDeviation: 0.3,
      baseInterval: {
        timeUnit: "day",
        count: 1
      },
      renderer: am5xy.AxisRendererX.new(root, {}),
      tooltip: am5.Tooltip.new(root, {})
    }));
    
    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
      maxDeviation: 0.3,
      renderer: am5xy.AxisRendererY.new(root, {})
    }));
    
    
    // Add series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    var series = chart.series.push(am5xy.LineSeries.new(root, {
      name: "Series 1",
      xAxis: xAxis,
      yAxis: yAxis,
      valueYField: "value1",
      valueXField: "date",
      tooltip: am5.Tooltip.new(root, {
        labelText: "{valueX}  :  {valueY}"
      })
    }));
    
    series.strokes.template.setAll({
      strokeWidth: 3
    });
    
    series.get("tooltip").get("background").set("fillOpacity", 0.5);
    
    
    
    // Set date fields
    // https://www.amcharts.com/docs/v5/concepts/data/#Parsing_dates
    root.dateFormatter.setAll({
      dateFormat: "yyyy-MM-dd",
      dateFields: ["valueX"]
    });
    
 
    // Set data
    var data = [{
      date: new Date(2021, 10, 17).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 
    }, {
      date: new Date(2021, 10, 18).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 

    }, {
      date: new Date(2021, 10, 19).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 

    }, {
      date: new Date(2021, 10, 20).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 
 
    }, {
      date: new Date(2021, 10, 21).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 

    }, {
      date: new Date(2021, 10, 22).getTime(),
      value1: ${productDay.pprice } * Math.floor(Math.random() * 101) 

    }, {
      date: new Date(2021, 10, 23).getTime(),
      value1: ${productDay.psell }
    }]
    
    series.data.setAll(data);
    
    
    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    series.appear(1000);
    chart.appear(1000, 100);
    
    }); // end am5.ready()
    </script>
 </head>
    
  <!-- HTML -->
    <div id="chartdivv"></div>
    
 </html>