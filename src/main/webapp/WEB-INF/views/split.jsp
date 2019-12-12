<%@ page pageEncoding = "utf-8"%>
<script type="text/x-template" id="test">
<div>
<p>이게 되는거라고?</p>
<p>정말이냐</p>
</div>
</script>

<script>
var test = Vue.component('test' ,{
	template: '#test'
})
</script>