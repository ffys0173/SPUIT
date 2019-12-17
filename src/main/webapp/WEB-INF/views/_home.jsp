<%@ page pageEncoding = "utf-8"%>
<template type="text/x-template" id="home-template">
	<div class="d-flex justify-start">
		<v-col cols="6">
			<v-card class="article mx-2" light>
				<v-card-title class="headline font-weight-bold white">Recommend for you</v-card-title>
				<v-card-subtitle>동기화 시간 : {{timeRecommend}}</v-card-subtitle>
				<v-divider></v-divider>
				<div id="recommend" class="overflow-y-auto" style="max-height: 700px">
					<v-card class="mx-auto" tile flat v-for="thread in ListofRecommend">
						<div @click="changeThread(thread.articleTag, thread.articleUrl)">
							<v-list-item three-line>
							<v-img :src="thread.articleThumbnail" class="my-5 me-3" max-width="180" max-height="120"></v-img>
							<v-list-item-content>
								<div class="overline">[{{thread.articleTag}}]</div>
								<v-list-item-title class="title">{{thread.articleTitle}}</v-list-item-title>
								<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
								<v-list-item-subtitle>{{new Date(thread.articleRegisted)}}</v-list-item-subtitle>
							</v-list-item-content>
						</div>
					</v-card>
					<infinite-loading @infinite="getRecommend" forceUseInfiniteWrapper="#recommend"></infinite-loading>
				</div>
			</v-card>
		</v-col>
		<v-col cols="6">
			<v-card class="article mx-2">
				<v-card-title class="headline font-weight-bold">Recent News</v-card-title>
				<v-card-subtitle>동기화 시간 : {{timeRecent}}</v-card-subtitle>
				<v-divider></v-divider>
				<div id="recent" class="overflow-y-auto" style="max-height: 700px">
					<v-card class="mx-auto" tile flat v-for="thread in ListofRecent">
						<div @click="changeThread(thread.articleTag, thread.articleUrl)">
							<v-list-item three-line>
							<v-img :src="thread.articleThumbnail" class="my-5 me-3" max-width="180" max-height="120"></v-img>
							<v-list-item-content>
								<div class="overline">[{{thread.articleTag}}]</div>
								<v-list-item-title class="title">{{thread.articleTitle}}</v-list-item-title>
								<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
								<v-list-item-subtitle>{{new Date(thread.articleRegisted)}}</v-list-item-subtitle>
							</v-list-item-content>
						</div>
					</v-card>
					<infinite-loading @infinite="getRecent" forceUseInfiniteWrapper="#recent"></infinite-loading>
				</div>
			</v-card>
		</v-col>
	</div>
</template>

<script>
var homeTemplate = Vue.component('homeTemplate' ,{
	template: '#home-template',
	data: function () {
		return {
			ListofRecent: null,
			ListofRecommend: null,
			timeRecent: null,
			timeRecommend: null,
			recentOffset: 0,
			recommendOffset: 0
		}
	},
	methods: {
		getRecent: function($state){
			axios.post('/api/thread/getRecent', {offset: this.recentOffset})
	    	.then((res) => {
    			if(res.data != []){
    				if(this.ListofRecent == null)
    					this.ListofRecent = res.data
    				else
		    			this.ListofRecent = this.ListofRecent.concat(res.data)
		    		this.recentOffset++
		    		$state.loaded()
    			}
    			else {
    				$state.complete()
    			}
	    	})
	    	this.timeRecent = new Date()
	   		
		},
	    getRecommend : function($state) {
	    	axios.post('/api/thread/getRecommend', {offset: this.recommendOffset})
	    	.then((res) => {
    			if(res.data != []){
    				if(this.ListofRecommend == null)
    					this.ListofRecommend = res.data
    				else
		    			this.ListofRecommend = this.ListofRecommend.concat(res.data)
		    		this.recommendOffset++
		    		$state.loaded()
    			}
    			else {
    				$state.complete()
    			}
	    	})
	    	this.timeRecommend = new Date()
	    },
	    changeThread(channel, url) {
	    	this.$emit('move-channel', channel)
	    	router.push({path:'/app/article?url=' + url})
	    }
	},
	mounted() {
		this.$emit('true')
		this.RecentOffset = 0
		this.RecommendOffset = 0
	}
})
</script>