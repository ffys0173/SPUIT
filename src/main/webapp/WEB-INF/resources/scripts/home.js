new Vue({
	el: '#app',
	vuetify: new Vuetify(),
	data: {
		ListofArticle: null
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
	    fixChatBox(){
	    	if(window.scrollY >= 47){
		    	document.getElementById("chatBox").setAttribute("style", "position: fixed; top:30px")    		
	    	}
	    	else{
	    		document.getElementById("chatBox").setAttribute("style", "position: relative;")
	    	}
	    }
	},
	mounted() {
    	axios.post('/api/thread/getRecommend')
    	.then((res) => {
    		this.ListofArticle = res.data
    	})
	},
	created: function() {
		window.addEventListener('scroll', this.fixChatBox)
	},
	destroyed: function() {
		window.removeEventListener('scroll', this.fixChatBox)
	}
})