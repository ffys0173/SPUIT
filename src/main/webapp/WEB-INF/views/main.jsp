<%@ page pageEncoding = "utf-8"%>

<html>
<body>
<div id = "app">
<main-template></main-template>
</div>
</body>
</html>

<script type="text/x-template" id="main-template">
<div>
<p>이게 되는거라고?</p>
<p>정말이냐</p>
</div>
</script>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>

<script>
Vue.component('main-template' ,{
	template: '#main-template'
})

var router = new VueRouter({
	
})

new Vue({
	el: '#app'
})
</script>