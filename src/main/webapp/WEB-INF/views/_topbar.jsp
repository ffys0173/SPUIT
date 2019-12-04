<%@ page pageEncoding = "utf-8"%>
 	
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
				<v-btn class="ma-2" outlined color="white" href="/user/login">Log-in</v-btn>
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
		
</div>