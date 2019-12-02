new Vue({
	el: '#chat',
	data: {
		messages: null,
		sock: null,
		messages2: null,
		sock2: null,
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
		
		//
		sock2 = new SockJS("/echo/test")
		messages2 = new Array()
		sock2.onmessage = function(e){
			alert("hahaha")
			$("#chatBox2").append('<p>'+e.data+"</p>")
			messages2.push(e.data)
			$("#chatBox2").scrollTop($("#chatBox2")[0].scrollHeight);
		}
		sock.onclose = function(){
			$("#chatBox2").append("Disconnected")
		}
		//
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
		},
		ChatProp2() {
			if($("#message2").val() != ''){
				sock2.send($("#message2").val())
				$("#message2").val('').focus()					
			}
			else {
				alert("메시지를 입력해주세요.")
			}
		}
	}
})