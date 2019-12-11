<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>MyPage</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<!-- 상단바 -->
	<%@include file="_topbar.jsp" %>
	
	<div id="app" dark>
		<v-app>
		<v-container class="d-flex justify-center align-center">
			<v-sheet style="padding: 15px">
				<v-card style="padding: 15px" dark>
					<v-card-title>회원 정보 변경</v-card-title>
					<v-card-subtitle>회원의 기본 정보를 변경합니다.</v-card-subtitle>
					<v-text-field v-model="newName" label="이름 변경" hint="변경 후 3개월 후 재 변경 가능"></v-text-field>
					<v-text-field v-model="newEmail" label="이메일 변경"></v-text-field>
					<v-btn @click="nameChange" color="pimary">정보 변경</v-btn>
				</v-card>
				<div style="height: 15px"></div>
				<v-card dark style="padding: 15px">
					<v-card-title>Password Change</v-card-title>
					<v-card-subtitle>최근 비밀번호 변경  : </v-card-subtitle>
					<v-text-field v-model="oldPw" label="이전 패스워드" type="password"></v-text-field>
					<v-text-field v-model="newPw" label="신규 패스워드" type="password"></v-text-field>
					<v-btn @click="pwChange" color="pink">비밀번호 변경</v-btn>
				</v-card>
				<div style="height: 15px"></div>
				<v-card dark style="padding: 15px">
					<v-card-title>관심사 변경</v-card-title>
					<v-card-subtitle>보여지는 기사에 적용되는 관심사를 재 설정합니다.</v-card-subtitle>
					<a href="/user/auth/setFavorites">관심사 설정 하러 가기</a>
				</v-card>
			</v-sheet>
			</v-container>
		</v-app>
	</div>
	<!-- bottom navigㅁtion -->
</body>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>

<script src="/resources/scripts/topbar.js"></script>

<script type="text/javascript">
	new Vue({
		el: '#app',
		vuetify: new Vuetify({
			theme: { dark: true }
		}),
		data: {
			newName: '',
			newEmail: '',
			oldPw: '',
			newPw: ''
		},
		methods: {
			pwChange : function () {
				//axios
			},
			infoChange: function() {
				//axios	
			}
			
		},
	})
</script>
</html>