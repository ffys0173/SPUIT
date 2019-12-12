<%@ page pageEncoding = "utf-8"%>

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
<!-- 키워드 검색창   -->
<v-dialog v-model="true" max-width="400px">
	<v-card style="padding: 20px;" dark>
		<v-card-title>Enter Search Keyword : </v-card-title>
		<v-text-field v-model="query" label="Search word">...Keyword</v-text-field>
		<v-btn color="primary" @click="requestSearch">Search</v-btn>
	</v-card>
</v-dialog>
</script>