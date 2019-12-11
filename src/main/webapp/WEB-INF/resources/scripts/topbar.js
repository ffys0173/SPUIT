new Vue ({
	el: '#topbar',
	vuetify: new Vuetify(),
	data: {
		login: null,
		query: null,
		dialog: false,
		id: '',
		pw: '',
		loginDialog: false,
	},
	mounted: function() {
		axios.get('/api/user/isLogin')
		.then((res) => {
			this.login = res.data
		})
	},
	methods: {
		requestLogout : function() {
			axios.get('/api/user/logout')
	    	.then(((res) => {
	    		if(res.data === 1){
	    			window.location.href = '/'
	    		}
	    	}))
	    },
	    requestSearch : function() {
	    	window.location.href = '/search?query=' + this.query
	    },
	    requestLogin : function() {
    		axios.post('/api/user/login', {id: this.id, pw: this.pw})
    		.then(((res) => {
    			if(res.data === 1){
    				window.location.href = '/'
    			}
    			else{
    				alert('로그인에 실패했습니다.')	    				
    			}
    		}))
    	},
    	loginDialogOn: function() {
    		this.loginDialog = true
    	}
	}
})