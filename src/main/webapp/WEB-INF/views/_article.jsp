<%@ page pageEncoding="UTF-8"%>

<template type="text/x-template" id="article">
	<v-container class="d-flex justfy-center">
		<v-col cols="3">
		</v-col>
		<v-col cols="8">
			<v-card style="padding: 15px">
				<v-card-title class="title">{{articleTitle}}</v-card-title>
				<v-card-subtitle>
				기사 시간 : {{new Date(articleTime)}}<br>
				기사 제공 : {{articleProvider}}<a :href="query">(원문보기)</a><br>

				</v-card-subtitle>
				<v-chip-group multiple column>
          			<v-chip v-for="tag in articleTags" :key="tag" :to="tag.tagLink">
						{{ tag.tagName }}
					</v-chip>
				</v-chip-group>
				<v-card outlined>
					<v-card-text><p v-html="articleContent"></p></v-card-text>
				</v-card>
				<br>
				<!-- <v-btn @click="addFavoriteNews"><v-icon>mdi-plus</v-icon></v-btn> -->
			</v-card>
		</v-col>
	</v-container>
</template>

<script>
var article = Vue.component('article', {
	//props: ['prop'],
	template: '#article',
	data: function () {
		return {
			articleTitle: '', //기사 제목
			articleTime: '', //기사 시간
			articleProvider: '',
			articleThumb: '', //기사 사진
			articleContent: '', //내용
			articleTags: [],	//태그 이름 , 태그 클릭 시 태그 검색하게 함.
			query: ''
			
		}
	},
	methods: {
		makeTag : function (name) {
			//var tName = tag;
			//var tLink = 'search?query=asdf'+name
		//this.articleTags.push({tagName: tName, tagLink: tLink})
		}
	},
	created () {
		
		var url = decodeURIComponent(location.href)
		var param = url.substring( url.indexOf('?')+1, url.length)
		this.query = param.split("=")[1]
		
		axios.get('/api/thread/getArticle?url=' + this.query)
		.then((res) => {
			this.articleTitle = res.data.articleTitle;
			this.articleContent = res.data.articleContent;
			this.articleTime = res.data.articleRegisted;
			this.articleProvider = res.data.articleSource
			//this.articleTags.push({tagName: res.data.articleTag, tagLink: 'search?query='+res.data.articleTag})
			this.articleThumb = res.data.articleThumbnail
		})
	}
})
</script>