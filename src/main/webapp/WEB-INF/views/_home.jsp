<%@ page pageEncoding = "utf-8"%>
<script type="text/x-template" id="home-template">
	<div class="d-flex justify-start">
		<v-col cols="6">
			<v-card class="article mx-2" dark>
				<v-card-title class="headline font-weight-bold">Recent News</v-card-title>
				<v-card-subtitle>동기화 시간 : {{timeRecent}}</v-card-subtitle>
				<v-divider></v-divider>
				<div id="recent" class="overflow-y-auto" v-scroll:#recent="getRecent" style="max-height: 700px">
				<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofRecent">
					<v-list-item three-line>
					<v-img :src="thread.articleThumbnail" class="my-5 me-3" max-width="180" max-height="120"></v-img>
					<v-list-item-content>
						<v-list-item-title class="text-truncate title mb-1">{{thread.articleTitle}}</v-list-item-title>
						<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
					</v-list-item-content>
				</v-card>
				</div>
				<!--<infinite-loading @infinite="requestTread" distance="300"></infinite-loading>-->
			</v-card>
		</v-col>
		<v-col cols="6">
			<v-card class="article mx-2" style="background-color: #FFFFFF; color: black">
				<v-card-title class="headline font-weight-bold">Recommend for you</v-card-title>
				<v-card-subtitle style="color: black">동기화 시간 : {{timeRecommend}}</v-card-subtitle>
				<v-divider></v-divider>
				<div id="recommend" class="overflow-y-auto" v-scroll:#recommend="getRecommend" style="max-height: 700px">
				<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofRecommend">
					<v-list-item three-line>
					<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="180" max-height="100"></v-img>
					<v-list-item-content>
						<v-list-item-title class="title mb-1">{{thread.articleTitle}}</v-list-item-title>
						<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
					</v-list-item-content>
				</v-card>
				</div>
			</v-card>
		</v-col>
	</div>

</script>

<script>
var homeTemplate = Vue.component('homeTemplate' ,{
	template: '#home-template',
	data: function () {
		return {
			ListofRecent: null,
			ListofRecommend: null,
			timeRecent: new Date(),
			timeRecommend: '',
			recentOffset: 0,
			recommendOffset: 0
		}
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
	    getRecent : function(e) {
	    	if(e.target.scrollTop == e.target.scrollHeight - 700){
		    	axios.post('/api/thread/getRecent', {offset: this.recentOffset})
		    	.then((res) => {
	    			if(res.data != []){	    				
			    		this.ListofRecent = this.ListofRecent.concat(res.data)
			    		this.recentOffset++
	    			}
		    	})
	    	}
    		this.timeRecent = new Date()
	    },
	    getRecommend : function(e) {
	    	if(e.target.scrollTop == e.target.scrollHeight - 700){
				axios.post('/api/thread/getRecommend', {offset: this.recommendOffset})
		    	.then((res) => {
		    		if(res.data != []){	  
			    		this.ListofRecommend = this.ListofRecommend.concat(res.data)
			    		this.recommendOffset++
		    		}
		    	})	    		
	    	}
    		this.timeRecommend = new Date()
	    }
	},
	mounted() {
		axios.post('/api/thread/getRecent', {offset: this.recentOffset})
    	.then((res) => {
    		this.ListofRecent = res.data
    		this.recentOffset++
    	})
		axios.post('/api/thread/getRecommend', {offset: this.recommendOffset})
    	.then((res) => {
    		this.ListofRecommend = res.data
    		this.recommendOffset++
    	})
   		this.timeRecommend = new Date()
	}
})
</script>