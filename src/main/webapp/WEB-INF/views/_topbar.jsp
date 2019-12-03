<%@ page pageEncoding = "utf-8"%>
<html>
<head>
 
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<div id="topbar" ref="window">
		<v-app>
			<div>
				<v-toolbar dense :dark="true">
		       		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Project SPUIT</a></v-toolbar-title>
		       		 <v-spacer></v-spacer>
				        <v-btn icon @click.stop="dialog = true">
				          <v-icon>mdi-magnify</v-icon>
				        </v-btn>
				        <template v-if="login">
				        ${sessionInfo.name}님 반갑습니다.
				        	<v-btn class="ma-2" outlined color="white" href="/user/mypage">My Page</v-btn>
							<v-btn class="ma-2" outlined color="white" @click="requestLogout">Log-out</v-btn>
				        </template>
				        <template v-else>
							<v-btn class="ma-2" outlined color="white" href="/user/login">Log-in</v-btn>
					        <v-btn class="ma-2" outlined color="white" href="/user/regist">sign-up</v-btn>
						</template>
				</v-toolbar>
			</div>
			
			<!-- 키워드 검색창   -->
			<v-dialog v-model="dialog" max-width="400px">
				<v-card style="padding: 20px;">
					<v-card-title>Enter Search Keyword : </v-card-title>
					<v-text-field label="Search word">...Keyword</v-text-field>
					<v-btn color="primary" @click="dialog = true">Search</v-btn>
				</v-card>
			</v-dialog>
		</v-app>
	</div>
</body>
<script>
new Vue ({
	el: '#topbar',
	vuetify: new Vuetify(),
	data: {
		login: ${login},
		dialog: true
	}
})
</script>