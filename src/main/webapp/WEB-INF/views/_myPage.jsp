<%@ page pageEncoding="UTF-8"%>

<script type="text/x-template" id="mypage">
	<v-container class="d-flex justify-center align-center">
	<v-col>
			<v-card style="padding: 15px">
				<v-card-title>회원 정보 변경</v-card-title>
				<v-card-subtitle>회원의 기본 정보를 변경합니다.</v-card-subtitle>
				<v-text-field v-model="name" label="이름 변경" hint="변경 후 3개월 후 재 변경 가능"></v-text-field>
				<v-text-field v-model="email" label="이메일 변경"></v-text-field>
				<v-btn @click="infoChange">Confirm</v-btn>
			</v-card>
			
			<v-card style="margin-top: 14px; padding: 15px">
				<v-card-title>Password Change</v-card-title>
				<v-card-subtitle>최근 비밀번호 변경  : </v-card-subtitle>
				<v-text-field v-model="pw" label="이전 패스워드"></v-text-field>
				<v-text-field v-model="pwck" label="신규 패스워드"></v-text-field>
				<v-btn outlined @click="pwChange">비밀번호 변경</v-btn>
			</v-card>
			
			<v-card style="margin-top: 14px; padding: 15px">
				<v-card-title>관심사 변경</v-card-title>
				<v-card-subtitle>보여지는 기사에 적용되는 관심사를 재 설정합니다.</v-card-subtitle>
				<router-link to="/setFavorites">관심사 설정 하러 가기</a>
			</v-card>
		<v-col>
	</v-container>
</script>

<script>
mypage = Vue.component('mypage', {
	template: '#mypage',
	data: function () {
		return {			
			name: '',
			email: '',
			pw: '',
			pwck: ''
		}
	},
	methods: {
		pwChange : function () {
			axios.post('/api/user/auth/pwModify', {pw: this.pw})
			.then((res) => {
				alert('성공')
				window.location.href = '/'
			})
		},
		infoChange: function() {
			axios.post('/api/user/auth/infoModify', {name: this.name, email: this.email})
			.then((res) => {
				alert('성공')
				window.location.href = '/'
			})
		}
	}
})
</script>