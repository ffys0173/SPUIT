<%@ page pageEncoding = "utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login page</title>
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
	
	<div id="login" ref="window">
		<v-app>
			<div>
			</div>
			<v-container class="d-flex justify-center mt-6">
				<v-card width="500" height="400">
					</form-->
					<v-card-title>Sign in</v-card-title>
					<v-card-subtitle>welcome back to SPUIT</v-card-subtitle>
					
					<v-form>
						<v-text-field v-model="id" label="id" :type="text" required></v-text-field>
						
						<v-text-field v-model="pw" label="password" required :type="'Password'"
									  hint="At least 8 characters" v-on:keyup.enter="requestLogin"></v-text-field>
	
						<v-btn v-on:click="requestLogin">Done</v-btn>
					</v-form>
				</v-card>
			</v-container>
		</v-app>
	</div>
</body>
<script src="/resources/scripts/login.js"></script>
<script src="/resources/scripts/topbar.js"></script>
</html>