new Vue({
	    el: '#app',
	    vuetify: new Vuetify(),
	    data: {
			id: '',
			pw: '',
	    },
	    methods: {
	    	requestLogin : function() {
	    		axios.post('/api/login', {id: this.id, pw: this.pw})
	    		.then(((res) => {
	    			if(res.data === 1){
	    				window.location.href = '/'
	    			}
	    			else{
	    				alert('로그인에 실패했습니다.')	    				
	    			}
	    		}))
	    	}
	    },
	    computed: {
	  	  
	    },
	  })