<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>slideBar</title>
  <style>
    .slide_P {
			padding-top: 12px;
		}

		ul,
		li {
			list-style: none;
		}

		.slideBar {
			height: 50px;
			overflow: hidden;
			margin: 0;
			padding: 0;
			font-family: Helvetica;
			font-size: 20px;
			font-weight: 400;
		}

		.slideBar ul {
			height: calc(100% * 4);
			animation: slide 8s infinite;
		}

		.slideBar li {
			background-color: rgba(0, 0, 0, 0.08);
			height: calc(100% / 4);
			text-align: center;
		}

		@keyframes slide {
			0% {
				margin-top: 0;
			}

			10% {
				margin-top: 0;
			}

			25% {
				margin-top: -50px;
			}

			35% {
				margin-top: -50px;
			}

			50% {
				margin-top: -100px;
			}

			60% {
				margin-top: -100px;
			}

			75% {
				margin-top: -150px;
			}

			85% {
				margin-top: -150px;
			}

			100% {
				margin-top: 0;
			}
		}
  </style>
</head>
<body>
  <div class="slideBar">
    <ul style="
    padding-left: 0px;
">
      <li><p class="slide_P">"환절기가 다가오는 계절, 캔유필마켓으로 지키세요"</p></li>
      <li><p class="slide_P">"강사님 감사합니다!"</p></li>
      <li><p class="slide_P">"훌륭한 개발자의 모습으로 나타날게요!"</p></li>
      <li><p class="slide_P"><strong>"기창, 지은, 창환, 예지, 승병" </strong> 올림</p></li>
    </ul>
  </div>
</body>
</html>

