<%@ page pageEncoding="UTF-8"%>

<template type="text/x-template" id="regist">

	<v-container class="d-flex justify-start mt-6">
		<v-col cols="5">
		</v-col>
		<v-col cols="7">
			<v-card class = "pa-4" width="500" height="455" dark>
				<v-card-title>Sign Up</v-card-title>
				<v-card-subtitle>welcome to SPUIT</v-card-subtitle>
				
				<v-form>
					<v-text-field v-model="id" label="ID" type="text" required autocomplete="off" autofocus="true" maxlength="19"></v-text-field>
					<v-text-field v-model="pw" label="Password" required type="Password" hint="8 ~ 20 characters" minlength="8" maxlength="20"></v-text-field>			  
					<v-text-field v-model="name" label="Name" required autocomplete="off" type="text" hint="At least 1 characters" maxlength="19"></v-text-field>
					<v-text-field v-model="email" label="E-mail" required autocomplete="off" type="email" hint="input your email" maxlength="49"></v-text-field>
	
					<v-btn color="primary" v-on:click="requestRegist">Done</v-btn>
				</v-form>
			</v-card>
		</v-col>		
	</v-container>
	
</template>

<script>
var regist = Vue.component('regist', {
	template: '#regist',
    data: function () {
		return {
			id: "",
			pw: "",
			name: "",
			email: "",
			chips: []
    	}
    },
    created: function () {
    	this.$emit('false')
    },
    methods: {
  		requestRegist: function() {
  			if(this.id == ''){  				
  				alert('ID를 입력해주세요.')
  			}
  			else if(this.pw.length < 8){
  				alert('비밀번호를 8자 이상 입력해주세요.')
  			}
  			else if(this.name == ''){
  				alert('이름을 입력해주세요.')
  			}
  			else if(this.email == ''){
  				alert('이메일을 임력해주세요.')
  			}
  			else {
	  			axios.post('/api/user/regist', {id: this.id, pw: this.pw, name: this.name, email: this.email})
	  			.then (((res) => {
	  				if(res.data === 1){
	  					alert("성공")
						window.location.href = '/app/auth/setFavorites'
	  				}
	  				else {
	  					alert("실패")
	  				}
				}))
  			}
		}
	}
})
</script>