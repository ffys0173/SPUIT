<%@ page pageEncoding = "utf-8"%>
<script type="text/x-template" id="chat-view">
		 <v-card class="mx-2" width="315px" height="500px" dark tile>
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
        <div class="mx-2">
          <v-text-field v-model="message" :append-icon="'mdi-send'" width="300" @click:append="ChatProp" @keyup.enter="ChatProp" autocomplete="off"></v-text-field>
        </div>
        </v-card>
</script>

<script>
var chat = Vue.component('chat-view', {
	template: '#chat-view',
	data: function() {
		return {
			sock: null,
			stompClient: null,
			roomId: null,
			message: '',
			member: null,
			sub: null,
			mysession: null,
			dropdown_servers: [
				{text: '메인서버'},
				{text: '서버 1'}
			]
		}
	},
	mounted: function() {

		axios.post('/api/user/getName')
		.then((res) => {
			member = res.data.name
			mysession = res.data.session
			
			this.roomId = '메인서버'
			
			sock = new SockJS('/stomp-chat')
			stompClient = Stomp.over(sock)
			stompClient.connect({}, this.subscribe)
			
			$("#chatBox").append('<p style="color:white;">' + this.roomId + '에 입장하셨습니다.</p>')
		})
	},
	methods: {
		ChatProp() {
			if(this.message != ''){
				stompClient.send('/publish/chat/message', {}, JSON.stringify({session: mysession, chatRoomId: this.roomId, message: this.message, writer: member}))
				this.message = ''
				//$("#message").val('').focus()					
			}
			else {
				alert("메시지를 입력해주세요.")
			}
		},
		
		subscribe() {
			
			sub = stompClient.subscribe('/subscribe/chat/room/' + this.roomId, function(data) {
				
				var content = JSON.parse(data.body)
				if (content.writer === member) {
					if(content.session == true)
						$("#chatBox").append('<p style="color:orange;"><strong>' + content.writer + " : " + content.message + "</strong></p>")
					else
						$("#chatBox").append('<p style="color:orange;">' + content.writer + " : " + content.message + "</p>")
				}
				else {
					if(content.session == true)
						$("#chatBox").append('<p style="color:white;"><strong>' + content.writer + " : " + content.message + "</strong></p>")
					else
						$("#chatBox").append('<p style="color:white;">' + content.writer + " : " + content.message + "</p>")
				}
				$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight)
			})
		},
		
		ChangeChannel() {
			sub.unsubscribe()
			//roomId = $("#select").val()
			this.subscribe()
			console.log(this.roomId)
			$("#chatBox").empty()
			$("#chatBox").append('<p style="color:white;">' + this.roomId + '에 입장하셨습니다.</p>')
		}
	}
})
</script>