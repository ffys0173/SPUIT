new Vue ({
	el: '#search',
	vuetify: new Vuetify(),
	data () {
		return {
			ListofArticle: null,
			query: "검색어"			
		}
	},
	mounted: function() {
		var url = decodeURIComponent(location.href)
		var param = url.substring( url.indexOf('?')+1, url.length)
		this.query = param.split("=")[1]
		
		axios.post('/api/thread/search', {query: this.query})
		.then((res) => {
			this.ListofArticle = res.data
			console.log(this.ListofArticle)
		})
	},
	methods: {
		
	}
})