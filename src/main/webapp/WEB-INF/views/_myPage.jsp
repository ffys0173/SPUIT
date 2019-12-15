<%@ page pageEncoding="UTF-8"%>

<template type="text/x-template" id="mypage">
	<v-container class="d-flex justify-center align-center">
	<v-col>
			<v-card style="padding: 15px">
				<v-card-title>회원 정보 변경</v-card-title>
				<v-card-subtitle>회원의 기본 정보를 변경합니다.</v-card-subtitle>
				<v-text-field v-model="name" label="이름 변경" hint="재 로그인 후에 적용" autocomplete="off"></v-text-field>
				<v-text-field v-model="email" label="이메일 변경" autocomplete="off"></v-text-field>
				<v-btn outlined @click="infoChange">Submit</v-btn>
			</v-card>
			
			<v-card style="margin-top: 14px; padding: 15px">
				<v-card-title>비밀번호 변경</v-card-title>
				<v-text-field type="password" v-model="pw" label="새 비밀번호"></v-text-field>
				<v-text-field type="password" v-model="pwck" label="새 비밀번호 확인"></v-text-field>
				<v-btn outlined @click="pwChange">Submit</v-btn>
			</v-card>
			
			<v-card style="margin-top: 14px; padding: 15px">
				<v-card-title>회원 탈퇴</v-card-title>
				<v-text-field type="password" v-model="pwleave" label="최종 확인을 위해 비밀번호를 입력해주세요."></v-text-field>
				<v-btn class="red" @click="leave">Submit</v-btn>
			</v-card>
			
			<v-card style="margin-top: 14px; padding: 15px">
				<v-card-title>관심사 변경</v-card-title>
				<v-card-subtitle>보여지는 기사에 적용되는 관심사를 재 설정합니다.</v-card-subtitle>
				<router-link to="/app/auth/setFavorites">관심사 설정 하러 가기</a>
			</v-card>
		<v-col>
	</v-container>
</template>

<script>
var mypage = Vue.component('mypage', {
	template: '#mypage',
	data: function () {
		return {
			name: '',
			email: '',
			pw: '',
			pwck: '',
			pwleave: ''
		}
	},
	methods: {
		pwChange : function () {
			if(this.pw == ''){
				alert('새 비밀번호를 입력해주세요.')
			}
			else if(this.pwck == ''){
				alert('새 비밀번호 확인을 입력해주세요.')				
			}
			else if(this.pw == this.pwck){
				axios.post('/api/user/auth/pwModify', {pw: this.pw})
				.then((res) => {
					alert('성공')
					window.location.href = '/'
				})				
			}
			else {
				alert('비밀번호를 확인해주세요.')
			}
		},
		infoChange: function() {
			if(this.name != '' || this.email != ''){				
				axios.post('/api/user/auth/infoModify', {name: this.name, email: this.email})
				.then((res) => {
					alert('성공')
					window.location.href = '/'
				})
			}
			else {
				alert('변경할 이름 또는 이메일을 입력해주세요.')
			}
		},
		leave: function() {
			axios.post('/api/user/auth/leave', {pw: this.pwleave})
			.then((res) => {
				if(res.data == 1){					
					alert('이용해 주셔서 감사합니다.')
					window.location.href = '/'
				}
				else{
					alert('실패')
				}
			})
		}
	},
	mounted: function () {
		this.$emit('false')
	}
})
</script>