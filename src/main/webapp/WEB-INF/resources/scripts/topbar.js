new Vue ({
	el: '#topbar',
	vuetify: new Vuetify(),
	data: {
		login: null,
		query: null,
		dialog: false
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
	    }
	}
})