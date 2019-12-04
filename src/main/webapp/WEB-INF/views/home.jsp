<%@ page pageEncoding = "utf-8"%>
<html>
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<%@include file="_topbar.jsp" %>
	
	<div id="app" ref="window">
		<v-app>
		
			<v-container id="contents" class="mt-6">
				<v-row no-gutters>
					<v-col cols="5">
						<v-card class="article" flat>
							<v-card-title class="headline font-weight-bold py-0">Recent</v-card-title>
							<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofArticle">
								<v-list-item three-line>
								<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
								<v-list-item-content>
									<v-list-item-title class="text-truncate title mb-1">{{thread.articleTitle}}</v-list-item-title>
									<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
								</v-list-item-content>
							</v-card>
						</v-card>
					</v-col>
					<v-col cols="5">
						<v-card class="article" flat>
							<v-card-title class="headline font-weight-bold py-0">Recommend for you</v-card-title>
							<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofArticle">
								<v-list-item three-line>
								<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
								<v-list-item-content>
									<v-list-item-title class="title mb-1">{{thread.articleTitle}}</v-list-item-title>
									<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
								</v-list-item-content>
							</v-card>
						</v-card>
					</v-col>	
					<v-col cols="1">
						<iframe id="chatBox" src="/chat" frameborder="0" width="330" height="600" marginwidth="0" marginheight="0"></iframe>
					</v-col>
				</v-row>
			</v-container>		
		</v-app>
	</div>
</body>

<script src="/resources/scripts/home.js"></script>
<script src="/resources/scripts/topbar.js"></script>

</html>

