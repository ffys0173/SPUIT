new Vue ({
	el: '#search',
	vuetify: new Vuetify(),
	data: {
		ListofArticle: null
	},
	mounted: function() {
		var url = decodeURIComponent(location.href)
		var param = url.substring( url.indexOf('?')+1, url.length)
		var query = param.split("=")[1]
		
		axios.post('/api/thread/search', {query: query})
		.then((res) => {
			this.ListofArticle = res.data
			console.log(this.ListofArticle)
		})
	},
	methods: {
		
	}
})