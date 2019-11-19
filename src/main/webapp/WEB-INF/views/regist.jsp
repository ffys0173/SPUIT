<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registration</title>
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
				 <v-app-bar-nav-icon></v-app-bar-nav-icon>
	       		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Spuit</a></v-toolbar-title>
	       		 <v-spacer></v-spacer>
			        <v-btn icon>
			          <v-icon>mdi-magnify</v-icon>
			        </v-btn>
			        <v-btn class="ma-2" outlined color="white" href="/user/login">Sign-in</v-btn> 
					<v-btn class="ma-2" outlined color="white" href="/user/regist">Sign-up</v-btn>
			</v-toolbar>
			</div>
			
			<!--입력 폼-->
			<v-card width="500" height="410" style="margin-bottom: 40px;">
				<!-- form action="/user/login" method="POST">
					<input name="id" type="text"/><br>
					<input name="pw" type="password"/><br>
					<input type="submit"/>
				</form-->
				<v-card-title>Sign Up</v-card-title>
				<v-card-subtitle>welcome to SPUIT</v-card-subtitle>
				
				<v-form method="POST" action="/user/regist">
					<v-text-field v-model="id" label="id" :type="text" required></v-text-field>
					
					<v-text-field v-model="pw" label="password" required :type="'Password'"
								  hint="At least 8 characters" ></v-text-field>
								  
					<v-text-field v-model="name" label="name" required :type="text"
								  hint="At least 1 characters" ></v-text-field>
								  
					<v-text-field v-model="email" label="E-mail" required :type="'email'"
								  hint="input your email" ></v-text-field>

					<v-btn  outlined color="primary" v-on:click="requestRegist">Done</v-btn>
				</v-form>	
			</v-card>
			
			<v-card width="600">
				<v-card-title>Select Favorite</v-card-title>
				<v-card-subtitle>관십사 입력 후 엔터키 입력, 여러 개 설정 가능</v-card-subtitle>
					<v-combobox
				      v-model="chips"
				      chips
				      clearable
				      label="Your favorite hobbies"
				      multiple
				      solo
				    >
				    <template v-slot:selection="{ attrs, item, select, selected }">
				        <v-chip
				          v-bind="attrs"
				          :input-value="selected"
				          close
				          @click="select"
				          @click:close="remove(item)"
				        >
				       <strong>{{ item }}</strong>&nbsp;
				       </v-chip>
				    </template>
				   </v-combobox>
				   <!-- v-card-context> 설정하신 관심사는 기사를 분류하는 기준이 됩니다.</v-card-context -->
				   <v-card-action>
				   	<v-btn @click="requestFavorite" color="primary" outlined>Confirm</v-btn>
				   </v-card-action>
			</v-card>
			
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
<!-- form name="insert">
<input id="id" name="id" type="text"/><br>
<input id="pw" name="pw" type="password"/><br>
<input id="name" name="name" type="text"/><br>
<input id="email" name="email" type="email"/><br>
</form>

<button onclick=insert_action()>submit</button-->

</body>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">

new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    data: {
  	  id: "",
  	  pw: "",
  	  name: "",
  	  email: "",
  	  chips: []
    },
    methods: {
  	  requestRegist: function() {
  		  axios.post('/api/regist', {id: this.id, pw: this.pw, name: this.name, email: this.email})
  		  .then (((res) => {
  			  if(res.data === 1) alert("성공")
  			  else alert("실패")
  		}))
  	  },
  	  
  	  requestFavorite: function() {
  		axios.post('/api/setFavorite', {favorite: this.chips})
  		.then (((res) => {
  			 if(res.data === 1) alert("관심사 설정 성공")
  			 else alert("관심사 설정 실패")
  		}))
  	  },
  	  
  	  remove (item) {
  	      this.chips.splice(this.chips.indexOf(item), 1)
  	      this.chips = [...this.chips]
  	  },
    },
    computed: {
  	  
    },
  }) 

  /*function insert_action(){
	var mForm = document.insert;
   var obj = new Object();
   obj.id = mForm.id.value;
   obj.pw = mForm.pw.value;
   obj.name = mForm.name.value;
   obj.email = mForm.email.value;
    
   var json_data = JSON.stringify(obj);
    
   $.ajax({
    url:"/api/regist",
    type:"POST",
    data:json_data,
    contentType:"application/json",
    success: function(data) {

    	if(data == "0"){
    		alert("실패");
    	}
    	else if(data == "1"){
    		alert("성공")
    	}
    }
  	})
  }*/
  
  
</script>

</html>