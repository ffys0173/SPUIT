	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div id="chat">
		<div id="chatBox" ref="chatBox">
		
		</div>
		<div id="inputBox">
			<form id=inputs>
				<input type="text" ref="message" id="message" autocomplete="off"/>
				<button id="send" @click.prevent="ChatProp">send</button>
			</form>
		</div>
	</div>
<script>

	new Vue({
		el: '#chat',
		data: {
			messages: null,
			text: "",
			sock: null
		},
		mounted: function() {
			sock = new SockJS("/echo")
			messages = new Array()
			var tempId = ''
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
				sock.send($("#message").val())
				$("#message").val('').focus()
			}
		}
	})

</script>

<style>
 #chat { background: gray; width: 315px; height: 500px; margin: 0;}
 #chatBox {padding-left: 5px; width: 315x; height: 500px; margin: 0; overflow-y: auto;}
 #send {
 background-color: #81BEF7; /* Green */
  border: none;
  color: white;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  }
 #message {width: 220px;}
 
 .other {color: white}
</style>
