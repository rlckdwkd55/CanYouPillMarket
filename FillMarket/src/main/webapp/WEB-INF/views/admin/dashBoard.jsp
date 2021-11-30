<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>대시보드</title>

<style>
    .cardBox{
        position: relative;
        padding: 20px;
        width: 100%;
        display: grid;
        grid-template-columns: repeat(4,1fr);
        grid-gap: 30px;
        margin-left: 280px;

    }
    .cardBox .card{
        position: relative;
        background: white;
        padding: 30px;
        box-shadow: 0 7px 25px rgba(0,0,0,0.08);
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        cursor: pointer;
        flex-direction: row;

    }

    .cardBox .card .numbers{
        position: relative;
        font-weight: 500;
        font-size: 2.5em;
        color: blue;
    }
    .cardBox .card .cardName{
        color: black;
        font-size: 1.1em;
        margin: 5px;

    }
    .cardBox .card .iconBox{
        font-size: 3.5em;
        color: var(--black2);
    }
	.tableBox{
		margin-left: 280px;
		
	}
	
	.details{
            position: relative;
            width: 785px;
            padding-right: 20px;
            padding-bottom: 20px;
            display: inline-table;
            grid-template-columns: 2fr 1fr;
            grid-gap: 30px;
            margin-top: 10px;
            
        }
        .details .recentOrders{
            position: relative;
            display: grid;
            min-height: 500px;
            background: white;
            padding: 20px;
            box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
            border-radius: 20px;
        }
        .cardHeader{
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .cardHeader h2{
            font-weight: 500;
            color: blue;
        }
        .btn{
            position: relative;
            padding: 5px 10px;
            background: blue;
            text-decoration: none;
            color: white;
            border-radius: 6px;
        }
        .details table{
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .details table thead td{
            font-weight: 600;
        }
        .details .recentOrders table tr{
            color: black;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
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
</head>
<c:import url="../common/adminSide.jsp" />
<body>
    <div class="cardBox col-md-10">
        <div class="card">
            <div>
                <div class="numbers">${memberCount}</div>
                <div class="cardName">회원</div>
            </div>
            <div class="iconBox">
                <ion-icon name="person-outline"></ion-icon>
            </div>
        </div>
        <div class="card">
            <div>
                <div class="numbers">${productCount }</div>
                <div class="cardName">상품</div>
            </div>
            <div class="iconBox">
                <ion-icon name="bag-outline"></ion-icon>
            </div>
        </div><div class="card">
            <div>
                <div class="numbers">${qnaCount }</div>
                <div class="cardName">문의</div>
            </div>
            <div class="iconBox">
                <ion-icon name="chatbox-ellipses-outline"></ion-icon>
            </div>
        </div><div class="card">
            <div>
                <div class="numbers">1,405</div>
                <div class="cardName">Daily viwe</div>
            </div>
            <div class="iconBox">
                <ion-icon name="browsers-outline"></ion-icon>
            </div>
        </div>
    </div>
    <div class="tableBox col-md-12">
    	<div class="details">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>상품리스트</h2>
                <a href="${pageContext.request.contextPath}/admin/adminProductList.do" class="btn">All view</a>
            </div>
            <table style="text-align: center;">
                <thead>
                    <tr>
                        <td>상품번호</td>
                        <td>상품명</td>
                        <td>카테고리</td>
                        <td>재고</td>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${productList}" var="p">
                    <tr>
                        <td>${p.pno }</td>
                        <td>${p.pname}</td>
                        <td>${p.cno }</td>
                        <td>${p.pstock }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="details">
        <div class="recentOrders">
            <div class="cardHeader" style="height: 110px;">
                <h2>매출그래프</h2>
                <a href="${pageContext.request.contextPath}/admin/adminSalesManagement.do" class="btn">All view</a>
            </div>
           <div id="chartdiv" style="height: 340px;"></div>
        </div>
    </div>
    <div class="details">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>사용자리스트</h2>
                <a href="${pageContext.request.contextPath}/admin/adminInfo.do" class="btn">All view</a>
            </div>
            <table>
                <thead>
                    <tr>
                        <td>아이디</td>
                        <td>이름</td>
                        <td>성별</td>
                        <td>상태</td>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach items="${userList}" var="u">
                    <tr>
                        <td>${u.userId}</td>
                        <td>${u.userName }</td>
                        <td>${u.gender}</td>
                        <td>${u.status }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="details">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>문의</h2>
                <a href="${pageContext.request.contextPath}/admin/adminQNAList.do" class="btn">All view</a>
            </div>
            <table>
                <thead>
                    <tr>
                        <td>이름</td>
                        <td>문의제목</td>
                        <td>업로드</td>
                        <td>상태</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${QnAList}" var="q">
                    <tr>
                        <td>${q.qauserid}</td>
                        <td>${q.qatitle }</td>
                        <td>${q.qauploaddate }</td>
                        <td>${q.status }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </div>
</body>
</html>