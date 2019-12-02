<%@ page pageEncoding = "utf-8"%>

<style type="text/css">
    @import url("/resources/style/chat.css");
</style>

<div id="chat">
	<div id="chatBox" ref="chatBox">
	
	</div>
	<div id="inputBox">
		<form id=inputs>
			<input type="text" ref="message" id="message" autocomplete="off"/>
			<button id="send" @click.prevent="ChatProp">send</button>
		</form>
	</div>
	
	<div id="chatBox2" ref="chatBox2">
	
	</div>
	<!-- <div id="inputBox2">
		<form id=inputs2>
			<input type="text" ref="message2" id="message2" autocomplete="off"/>
			<button id="send2" @click.prevent="ChatProp2">send</button>
		</form>
	</div> -->
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/scripts/chat.js"></script>
