new Vue({
	el: '#chat',
	data: {
		messages: null,
		sock: null,
		text: ""
	},
	mounted: function() {
		sock = new SockJS("/echo")
		messages = new Array()
		
		sock.onmessage = function(e){

			$("#chatBox").append('<p>'+e.data+"</p>")
			messages.push(e.data)
			$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
		}
		sock.onclose = function(){
			$("#chatBox").append("Disconnected")
		}
	},
	methods: {
		ChatProp() {
			if($("#message").val() != ''){
				sock.send($("#message").val())
				$("#message").val('').focus()					
			}
			else {
				alert("메시지를 입력해주세요.")
			}
		}
	}
})
