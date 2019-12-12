<%@ page pageEncoding = "utf-8"%>

<script type='text/x-template' id="nav-template">
<div>
	<v-toolbar dense :dark="true">
      		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Project SPUIT</a></v-toolbar-title>
      		 <v-spacer></v-spacer>
	        <v-btn icon @click.stop="dialog = true">
	          <v-icon>mdi-magnify</v-icon>
	        </v-btn>
	        <template v-if="login">
	        ${sessionInfo.name}님 반갑습니다.
	        <div style="width: 10px"></div>
	        	<v-btn class="ma-2" outlined color="white" href="/user/auth/myPage">My Page</v-btn>
	        	<div style="width: 10px"></div>
				<v-btn class="ma-2" outlined color="white" @click="requestLogout">Log-out</v-btn>
	        </template>
	        <template v-else>
				<v-btn class="ma-2" outlined color="white" @click="loginDialogOn">Log-in</v-btn>
				<div style="width: 10px"></div>
		        <v-btn class="ma-2" outlined color="white" href="/user/regist">sign-up</v-btn>
			</template>
	</v-toolbar>
<v-dialog v-model="loginDialog" max-width="500">
	<v-card width="500" height="300" style="padding: 15px" dark>
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
<v-dialog v-model="true" max-width="400px">
	<v-card style="padding: 20px;" dark>
		<v-card-title>Enter Search Keyword : </v-card-title>
		<v-text-field v-model="query" label="Search word">...Keyword</v-text-field>
		<v-btn color="primary" @click="requestSearch">Search</v-btn>
	</v-card>
</v-dialog>
</div>

</script>

<script type='text/x-template' id="lmodal">
<v-dialog v-model="loginDialog" max-width="500">
	<v-card width="500" height="300" style="padding: 15px" dark>
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
</script>

<script type='text/x-template' id="smodal">
<v-dialog v-model="true" max-width="400px">
	<v-card style="padding: 20px;" dark>
		<v-card-title>Enter Search Keyword : </v-card-title>
		<v-text-field v-model="query" label="Search word">...Keyword</v-text-field>
		<v-btn color="primary" @click="requestSearch">Search</v-btn>
	</v-card>
</v-dialog>
</script>

<script>
var smodal = Vue.component('smodal' ,{
	template: '#smodal'
})

var navTemplate = Vue.component('navTemplate' ,{
	template: '#nav-template',
	components: {
		'smodal': smodal
	},
	data: function () {
		return {
			login: null,
			query: null,
			dialog: false,
			id: '',
			pw: '',
			loginDialog: false,			
		}
	},
	mounted: function() {
		axios.get('/api/user/isLogin')
		.then((res) => {
			this.login = res.data
		})
	},
	methods: {
		requestLogout : function() {
			axios.get('/api/user/logout')
	    	.then(((res) => {
	    		if(res.data === 1){
	    			window.location.href = '/'
	    		}
	    	}))
	    },
	    requestSearch : function() {
	    	window.location.href = '/search?query=' + this.query
	    },
	    requestLogin : function() {
    		axios.post('/api/user/login', {id: this.id, pw: this.pw})
    		.then(((res) => {
    			if(res.data === 1){
    				window.location.href = '/'
    			}
    			else{
    				alert('로그인에 실패했습니다.')	    				
    			}
    		}))
    		this.id = this.pw = ''
    	},
    	loginDialogOn: function() {
    		this.loginDialog = true
    	}
	}
})
</script>