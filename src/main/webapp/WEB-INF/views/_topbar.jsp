<%@ page pageEncoding = "utf-8"%>
 
<head>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
</head>
<div id="topbar" ref="window">

	<v-toolbar dense :dark="true">
      		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Project SPUIT</a></v-toolbar-title>
      		 <v-spacer></v-spacer>
	        <v-btn icon @click.stop="dialog = true">
	          <v-icon>mdi-magnify</v-icon>
	        </v-btn>
	        <template v-if="login">
	        ${sessionInfo.name}님 반갑습니다.
	        	<v-btn class="ma-2" outlined color="white" href="/user/auth/myPage">My Page</v-btn>
				<v-btn class="ma-2" outlined color="white" @click="requestLogout">Log-out</v-btn>
	        </template>
	        <template v-else>
				<v-btn class="ma-2" outlined color="white" @click="loginDialogOn">Log-in</v-btn>
		        <v-btn class="ma-2" outlined color="white" href="/user/regist">sign-up</v-btn>
			</template>
	</v-toolbar>
	
	<!-- 키워드 검색창   -->
	<v-dialog v-model="dialog" max-width="400px">
		<v-card style="padding: 20px;">
			<v-card-title>Enter Search Keyword : </v-card-title>
			<v-text-field v-model="query" label="Search word">...Keyword</v-text-field>
			<v-btn color="primary" @click="requestSearch">Search</v-btn>
		</v-card>
	</v-dialog>
	
	<v-dialog v-model="loginDialog" max-width="500">
		<v-card width="500" height="300" style="padding: 15px">
			<v-card-title>Sign in</v-card-title>
			<v-card-subtitle>welcome back to SPUIT</v-card-subtitle>
			<v-form>
				<v-text-field v-model="id" label="id" :type="text" required></v-text-field>
				<v-text-field v-model="pw" label="password" required :type="'Password'"
							  hint="At least 8 characters" v-on:keyup.enter="requestLogin" style="margin-bottom: 20px"></v-text-field>
				<v-spacer></v-spacer>
				<v-btn v-on:click="requestLogin">Done</v-btn>
			</v-form>
		</v-card>
	</v-dialog>
		
</div>