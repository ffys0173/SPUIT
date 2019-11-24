Vue.component('top-bar', { 
    prop : ['login'],
    template: '<div>
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
			</div>'
})