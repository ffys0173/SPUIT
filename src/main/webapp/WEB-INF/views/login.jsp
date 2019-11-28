<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login page</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<div id="app">
		<v-app>
			<div>
			<v-toolbar dense :dark="true">
	       		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Project SPUIT</a></v-toolbar-title>
	       		 <v-spacer></v-spacer>
			        <v-btn icon @click.stop="dialog = true"> <!-- 스크립트파일에서 변수 적븐이 문제인듯합니다. -->
			          <v-icon>mdi-magnify</v-icon>
			        </v-btn>
			        <v-btn class="ma-2" outlined color="white" href="/user/login">Sign-in</v-btn> 
					<v-btn class="ma-2" outlined color="white" href="/user/regist">Sign-up</v-btn>
			</v-toolbar>
			</div>
			
			<v-container bg fill-height grid-list-md text-xs-center>
			<v-layout align-center>
			<v-card width="500" height="400" style="margin-left: 90px; padding: 10px;">
				<!-- form action="/user/login" method="POST">
					<input name="id" type="text"/><br>
					<input name="pw" type="password"/><br>
					<input type="submit"/>
				</form-->
				<v-card-title>Sign in</v-card-title>
				<v-card-subtitle>welcome back to SPUIT</v-card-subtitle>
				
				<v-form>
					<v-text-field v-model="id" label="id" :type="text" required></v-text-field>
					
					<v-text-field v-model="pw" label="password" required :type="'Password'"
								  hint="At least 8 characters" ></v-text-field>

					<v-btn v-on:click="requestLogin">Done</v-btn>
				</v-form>
			</v-card>
			<div style="margin-left: 500px; width: 600px; border: 5px dotted gray; padding: 10px;">
				<v-card-title>What is 'SPUIT'?</v-card-title>
				<v-card-content>PLorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac.

Senectus et netus et malesuada. Nunc pulvinar sapien et ligula ullamcorper malesuada proin. Neque convallis a cras semper auctor. Libero id faucibus nisl tincidunt eget. Leo a diam sollicitudin tempor id. A lacus vestibulum sed arcu non odio euismod lacinia. In tellus integer feugiat scelerisque. Feugiat in fermentum posuere urna nec tincidunt praesent. Porttitor rhoncus dolor purus non enim praesent elementum facilisis. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Et malesuada fames ac turpis egestas sed. Sit amet nisl suscipit adipiscing bibendum est ultricies. Arcu ac tortor dignissim convallis aenean et tortor at. Pretium viverra suspendisse potenti nullam ac tortor vitae purus. Eros donec ac odio tempor orci dapibus ultrices. Elementum nibh tellus molestie nunc. Et magnis dis parturient montes nascetur. Est placerat in egestas erat imperdiet. Consequat interdum varius sit amet mattis vulputate enim.
				</v-card-content>
			</div>

			</v-layout>
			</v-container>
			
			<v-dialog v-model="dialog" max-width="400px">
			<v-card style="padding: 20px;">
				<v-card-title>Enter Search Keyword : </v-card-title>
				<v-text-field label="Search word">...Keyword</v-text-field>
				<v-btn color="primary" @click="dialog = true">Search</v-btn>
			</v-card>
			</v-dialog>	
			
			<v-bottom-navigation absolute="true" :dark="true" fixed="true">
		      <v-btn value="news">
		        <span>Load new</span>
		        <v-icon>mdi-clock-fast</v-icon>
		      </v-btn>
		  
		      <v-btn value="favorites">
		        <span>Favorites</span>
		        <v-icon>mdi-heart</v-icon>
		      </v-btn>
		  
		      <v-btn value="settings">
		        <span>Settings</span>
		        <v-icon>mdi-settings</v-icon>
		      </v-btn>
		    </v-bottom-navigation>
		</v-app>
	</div>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/resources/scripts/login.js"></script>
</body>


</html>