<%@ page pageEncoding = "utf-8"%>
<template type="text/x-template" id="search-view">
	<v-container id="contents">
		<v-card class="article" flat>
			<v-card-title class="headline font-weight-bold py-0">"{{query}}" 검색결과</v-card-title>
			<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofArticle">
				<v-list-item three-line>
				<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
				<v-list-item-content>
					<v-list-item-title class="text-truncate title mb-1">{{thread.articleTitle}}</v-list-item-title>
					<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
					<v-list-item-subtitle>{{new Date(thread.articleRegisted)}}</v-list-item-subtitle>
				</v-list-item-content>
			</v-card>
		</v-card>
	</v-container>
</template>

<script>
var search = Vue.component('search-view', {
	template: '#search-view',
	data () {
		return {
			ListofArticle: null,
			query: "검색어"			
		}
	},
	mounted: function() {
		this.$emit('true')
		var url = decodeURIComponent(location.href)
		var param = url.substring( url.indexOf('?')+1, url.length)
		this.query = param.split("=")[1]
		
		axios.post('/api/thread/search', {query: this.query})
		.then((res) => {
			this.ListofArticle = res.data
			console.log(this.ListofArticle)
		})
	}
})
</script>


