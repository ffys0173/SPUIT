<%@ page pageEncoding = "utf-8"%>
<html>
<head>
	<title>SPUIT - 당신이 찾던 모든 것</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="search">
	<%@include file="_topbar.jsp" %>
	<v-app>
		<v-container id="contents" class="mt-6">

			<v-card class="article" flat>
				<v-card-title class="headline font-weight-bold py-0">"{{query}}" 검색결과</v-card-title>
				<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofArticle">
					<v-list-item three-line>
					<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
					<v-list-item-content>
						<v-list-item-title class="text-truncate title mb-1">{{thread.articleTitle}}</v-list-item-title>
						<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
					</v-list-item-content>
				</v-card>
			</v-card>
		</v-container>		
	</v-app>
</div>
</body>

<script src="/resources/scripts/topbar.js"></script>
<script src="/resources/scripts/search.js"></script>
</html>