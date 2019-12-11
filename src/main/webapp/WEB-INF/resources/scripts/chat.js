new Vue({
	el: '#chat',
	data: function() {
		return {
			sock: null,
			stompClient: null,
			roomId: null,
			message: null,
			member: null,
			sub: null
		}
	},
	mounted: function() {
		
		axios.post('/api/user/getName')
		.then((res) => {
			member = res.data
			
			roomId = "메인"
			
			sock = new SockJS('/stomp-chat')
			stompClient = Stomp.over(sock)
			stompClient.connect({}, this.subscribe)
		})
	},
	methods: {
		ChatProp() {

			if($("#message").val() != ''){
				stompClient.send('/publish/chat/message', {}, JSON.stringify({chatRoomId: roomId, message: $("#message").val(), writer: member}))
				$("#message").val('').focus()	
			}
			else {
				alert("메시지를 입력해주세요.")
			}
		},
		
		subscribe() {
			
			sub = stompClient.subscribe('/subscribe/chat/room/' + roomId, function(data) {
				
				var content = JSON.parse(data.body)
				if (content.writer === member) {						
					$("#chatBox").append('<p style="color:white;"><strong>' + content.writer + " : " + content.message + "</strong></p>")
				}
				else {
					$("#chatBox").append('<p>' + content.writer + " : " + content.message + "</p>")
				}
				$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight)
			})
		},
		
		ChangeChannel() {
			sub.unsubscribe()

			roomId = $("#select").val()
			this.subscribe()
		}
	}
})
