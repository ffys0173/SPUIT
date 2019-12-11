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
			<v-container class="d-flex justify-center">
				<v-card width="600" dark>
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
					   <v-card-context>설정하신 관심사는 기사를 분류하는 기준이 됩니다.</v-card-context>
					   <v-card-action>
					   	<v-btn @click="requestFavorite" color="primary" outlined>Confirm</v-btn>
					   </v-card-action>
				</v-card>
			</v-container>
		</v-app>
	</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">

new Vue({
    el: '#app',
    vuetify: new Vuetify({
    	theme: { dark: true }
    }),
    data: {
  	  id: "",
  	  pw: "",
  	  name: "",
  	  email: "",
  	  chips: []
    },
    methods: {
  	  requestFavorite: function() {
  		  
  		axios.post('/api/user/auth/setFavorites', this.chips)
  		.then (((res) => {
  			 if(res.data == 1) alert("관심사 설정 성공")
  			 else alert("관심사 설정 실패")
  		}))
  	  },
  	  
  	  remove (item) {
  	      this.chips.splice(this.chips.indexOf(item), 1)
  	      this.chips = [...this.chips]
  	  },
    },
    computed: {
  	  
    }
  }) 
  
</script>

</html>