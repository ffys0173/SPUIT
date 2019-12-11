new Vue({
	el: '#chat',
	vuetify: new Vuetify(),
	data: function() {
		return {
			sock: null,
			stompClient: null,
			roomId: null,
			message: null,
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
			
			roomId = "메인"
			
			sock = new SockJS('/stomp-chat')
			stompClient = Stomp.over(sock)
			stompClient.connect({}, this.subscribe)
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
