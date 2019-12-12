<%@ page pageEncoding = "utf-8"%>

<!-- <style type="text/css">
    @import url("/resources/style/chat.css");
</style>
<body> -->
<html style="overflow-y: auto">
<body>
 <div id="chat">
	<v-app>
		<!-- div id="chatBox" ref="chatBox">
		</div>
		<div id="inputBox">
			<form id=inputs>
				<input type="text" ref="message" id="message" autocomplete="off"/>
				<button id="send" @click.prevent="ChatProp">send</button>
			</form>
		</div-->
		 <v-card width="315px" height="500px" justify="center" align="center" dark tile>
          <v-overflow-btn
          	v-model="roomId"
            class="my-2"
            :items="dropdown_servers"
            label="Select Server.."
            @change="ChangeChannel"
            dense
          ></v-overflow-btn>

        <div  id="chatBox"style="height: 350px; padding: 15px; overflow-y: auto; text-align: left">
          
        </div>
        <div style="width: 300px">
          <v-text-field v-model="message" :append-icon="'mdi-send'" width="300" @click:append="ChatProp" @keyup.enter="ChatProp" autocomplete="off"></v-text-field>
        </div>
        </v-card>
	</v-app>
 </div>
<!-- </body> -->
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script src="/resources/scripts/chat.js"></script>
</html>