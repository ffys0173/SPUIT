<%@ page pageEncoding="UTF-8"%>

<template type="text/x-template" id="regist">

	<v-container class="d-flex justify-center mt-6">
		<v-card width="500" height="425" style="margin-bottom: 40px; padding: 15px" dark>
			<v-card-title>Sign Up</v-card-title>
			<v-card-subtitle>welcome to SPUIT</v-card-subtitle>
			
			<v-form>
				<v-text-field v-model="id" label="id" type="text" required autocomplete="off"></v-text-field>
				
				<v-text-field v-model="pw" label="password" required type="'Password'"
							  hint="At least 8 characters" ></v-text-field>
							  
				<v-text-field v-model="name" label="name" required type="text"
							  hint="At least 1 characters" ></v-text-field>
							  
				<v-text-field v-model="email" label="E-mail" required type="'email'"
							  hint="input your email" ></v-text-field>

				<v-btn outlined color="primary" v-on:click="requestRegist">Done</v-btn>
			</v-form>
		</v-card>
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
})
</script>