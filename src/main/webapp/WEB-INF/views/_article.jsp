<%@ page pageEncoding="UTF-8"%>

<template type="text/x-template" id="article">
	<v-container class="d-flex justfy-center">
		<v-col cols="12">
			<v-card style="padding: 15px">
				<v-card-title>{{articleTitle}}</v-card-title>
				<v-chip-group multiple column>
          			<v-chip v-for="tag in articleTags" :key="tag" :to="tag.tagLink">
						{{ tag.tagName }}
					</v-chip>
				</v-chip-group>
				<v-col>
					<v-row>
						<div style="width: 485px; height: 300px">
							<v-img :src="articleThumb">asdf</v-img>
						</div>  
						<v-card flat style="margin-left: 20px">
							<v-card-subtitle>기사 시간 : {{articleTime}}</v-card-subtitle>
							<v-card-subtitle>글쓴이 : {{articleWriter}}</v-card-subtitle>
							<v-card-subtitle>기사 제공 : {{articleProvider}}</v-card-subtitle>
						</v-card>
					</v-row>
				</v-col>
				<v-card outlined>
					<v-card-title>{{articleTitle}}</v-card-title>
					<v-card-text>{{articleContent}}</v-card-text>
				</v-card>
				<br>
				<v-btn @click="addFavoriteNews"><v-icon>mdi-plus</v-icon></v-btn>
			</v-card>
		</v-col>
	</v-container>
</template>

<script>
var article = Vue.component('article', {
	props: ['prop'],
	template: '#article',
	data: function () {
		return {
			articleTitle: '', //기사 제목
			articleTime: '', //기사 시간
			articleWriter: 'spuit', //글쓴이
			articleProvider: '', //기사 긁어온 곳
			articleThumb: 'https://picsum.photos/id/11/500/300', //기사 사진
			articleContent: '', //내용
			articleTags: [
				{tagName: 'picture', tagLink: 'search?query=picture'}
				//태그 이름 , 태그 클릭 시 태그 검색하게 함. 
			]
		}
	},
	methods: {
		makeTag : function (name) {
			//var tName = tag;
			//var tLink = 'search?query=asdf'+name
		//this.articleTags.push({tagName: tName, tagLink: tLink})
		},
		addFavoriteNews : function() {
			alert("관심있는 뉴스에 추가 하시겠습니까?")
			
		}
	},
	created () {
		//ajax /api/thread/getArticle에 post로 데이터 요청
		axios.post('/api/thread/getArticle',  {url: this.prop.params.url})
		.then((res) => {
			this.articleTitle = res.data.articleTitle;
			this.articleContent = res.data.articleContent;
			this.articleTime = res.data.articleRegisted;
			this.articleProvider = res.data.articleSource
			this.articleTags.push({tagName: res.data.articleTag, tagLink: 'search?query='+res.data.articleTag})
		})
		//console.log(this.prop.params.url) //이 경로를 파라미터로 보내면 된다 {url : this.prop.params.url}
	}
})
</script>