<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
	#imagefile{
		width: 30px;
        height: 30px;
		
	}
	
	#chartdiv{
		transition: 5s;
		box-shadow: 0 7px 25px rgba(0,0,0,0.08);
    border-radius: 20px;
	}
	#productChart{
		box-shadow: 0 7px 25px rgba(0,0,0,0.08);
    border-radius: 20px;
	}
</style>


<c:import url="../common/adminSide.jsp" />
	<script>
	function yearMonth(){
		$('#productChart').hide();
		$('#chartdiv').show(100);
		//$('#chartdiv').css('visibility', 'visible');
	}
	
		$(function(){
			$("tr[id]").on("click",function(){
				var pno = $(this).attr("id");
				console.log("pno="+pno);
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/productGraph.do",
					data : {pno : pno},
					dataType: "html",
			        success : function(data){
			        	$('#productChart').show();
			        	 $('#chartdiv').hide(100);
			        	// $('#chartdiv').css('visibility', 'hidden');
			        	$('#productChart').html(data);
			        }
					
				})
				
			});
			
			$("#Export").on("click", function(){
				// 캡쳐 라이브러리를 통해서 canvas 오브젝트를 받고 이미지 파일로 리턴한다.
				html2canvas(document.querySelector("#capture")).then(canvas => {
				saveAs(canvas.toDataURL('image/png'),"capture-test.png");
				});
				});
				function saveAs(uri, filename) {
				// 캡쳐된 파일을 이미지 파일로 내보낸다.
				var link = document.createElement('a');
				if (typeof link.download === 'string') {
				link.href = uri;
				link.download = filename;
				document.body.appendChild(link);
				link.click();
				document.body.removeChild(link);
				} else {
				window.open(uri);
				}
				}
		});
	</script>

<style>
    #chartdiv {
      width: 100%;
      height: 385px;
    }
    </style>
    
    <!-- Resources -->
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    
    <!-- Chart code -->
    <script>
    am5.ready(function() {
    
    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("chartdiv");
    
    
    // Set themes
    // https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
      am5themes_Animated.new(root)
    ]);
    
    
    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
      panX: false,
      panY: false,
      wheelX: "panX",
      wheelY: "zoomX",
      layout: root.verticalLayout
    }));
    
    
    // Add legend
    // https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
    var legend = chart.children.push(
      am5.Legend.new(root, {
        centerX: am5.p50,
        x: am5.p50
      })
    );
    
    var data = [{
      "year": "year",
      "bone": 30000000,
      "immunity": 22050000,
      "digestion": 47101050,
      "eye": 22512000,
      "hair": 26001100,
    }, {
      "year": "month",
      "bone": 2700010,
      "immunity": 3000010,
      "digestion": 2581010,
      "eye": 2700110,
      "hair": 2600010,
    }]
    
    
    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
      categoryField: "year",
      renderer: am5xy.AxisRendererX.new(root, {
        cellStartLocation: 0.1,
        cellEndLocation: 0.9
      }),
      tooltip: am5.Tooltip.new(root, {})
    }));
    
    xAxis.data.setAll(data);
    
    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
      renderer: am5xy.AxisRendererY.new(root, {})
    }));
    
    
    // Add series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    function makeSeries(name, fieldName) {
      var series = chart.series.push(am5xy.ColumnSeries.new(root, {
        name: name,
        xAxis: xAxis,
        yAxis: yAxis,
        valueYField: fieldName,
        categoryXField: "year"
      }));
    
      series.columns.template.setAll({
        tooltipText: "{name}, {categoryX}:{valueY}",
        width: am5.percent(90),
        tooltipY: 0
      });
    
      series.data.setAll(data);
    
      // Make stuff animate on load
      // https://www.amcharts.com/docs/v5/concepts/animations/
      series.appear();
    
      series.bullets.push(function () {
        return am5.Bullet.new(root, {
          locationY: 0,
          sprite: am5.Label.new(root, {
            text: "{valueY}",
            fill: root.interfaceColors.get("alternativeText"),
            centerY: 0,
            centerX: am5.p50,
            populateText: true
          })
        });
      });
    
      legend.data.push(series);
    }
    
    makeSeries("뼈/관절", "bone");
    makeSeries("면역력", "immunity");
    makeSeries("소화/장", "digestion");
    makeSeries("눈", "eye");
    makeSeries("모발", "hair");

    
    
    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    chart.appear(1000, 100);
    
    }); // end am5.ready()
    </script>
    
    <!-- HTML -->

</head>
<body>
<div class="col-md-10" style="margin-left:250px;" id="capture">
<div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom ">
          <h1 class="h2">매출</h1>
          <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group me-2">
              <button type="button" class="btn btn-sm btn-outline-secondary" onclick="yearMonth()">년/월</button>
              <button type="button" class="btn btn-sm btn-outline-secondary" id="Export">Export</button>
            </div>
       
          </div>
        </div>
  
    	<div id="chartdiv"></div>
    	<div id="productChart"></div>
        <!--<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="912" height="385" style="display: block; width: 912px; height: 385px;"></canvas>
 		--> 
        <h2>상품</h2>
        <div class="table-responsive justify-content-md-center">
          <table class="table table-hover table-sm">
            <thead>
              <tr>
                <th scope="col">상품번호</th>
                <th scope="col">분류</th>
                <th scope="col">이미지</th>
                <th scope="col">상품명</th>
                <th scope="col">재고</th>
                <th cope="col">판매가</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p"> 
					<tr id="${p.pno}">
						<td class="">${p.pno}</td>
						<td class="">
								<c:choose>
                        			<c:when test="${p.cno == 1 }">뼈/관절</c:when>
                        			<c:when test="${p.cno == 2 }">면역력</c:when>
                        			<c:when test="${p.cno == 3 }">소화/장</c:when>
                        			<c:when test="${p.cno == 4 }">눈</c:when>
                        			<c:when test="${p.cno == 5 }">모발</c:when>
                        	   </c:choose></td>
						<td class="" id="image">
							<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/productUpload/${p.changename}" id="imagefile">
						</td>
						<td>${p.pname}</td>
						<td class="">${p.pstock}</td>
						<td class=""><fmt:formatNumber pattern="###,###,###" value="${p.pprice }"/></td>
					</tr>
					</c:forEach>

            </tbody>
          </table>
          <c:out value="${pageBar}" escapeXml="false"/>
        </div>
      </div>
	
</body>
</html>