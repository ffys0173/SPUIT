<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<title>SPUIT - 당신이 찾던 모든 것</title>
</head>
<body>
	<div id="error">
		<v-app>
			<v-container class="d-flex justify-center align-center">
			<v-card style="padding: 20px">
				<v-card-title class="display-3 font-weight-light">어디로 가야하죠 아저씨...?</v-card-title>
				<v-divider></v-divider>
				<v-card-subtitle class="display-1 font-weight-light">Error Code - 404 : URL등 을 확인하세요.</v-card-subtitle>
				<a href="/">..메인 페이지로</a>
				</v-card>
			</v-container>
		</v-app>	
	</div>
</body>
<script>
	new Vue({
		el: '#error',
		vuetify: new Vuetify({
			theme: { dark: true }
		}),
		data: {
			
		}
	})
</script>
</html>