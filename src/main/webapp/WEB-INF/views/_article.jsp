<%@ page pageEncoding="UTF-8"%>
<script type="text/x-template" id="article">
	<v-container class="d-flex justfy-center>
	  <v-col cols="9">
		<v-card style="padding: 15px">
			<v-card-title>{{articleTitle}}</v-card-title>
			<v-chip-group multiple column>
          		<v-chip v-for="tag in articleTags" :key="tag" :to="tag.tagLink">
            		{{ tag.tagName }}
          		</v-chip>
        </v-chip-group>
		<v-col>
			<v-row>
			<div style="width: 485px; height: 300px">
			  <v-img src="https://picsum.photos/id/11/500/300">asdf</v-img>
			</div>  
			  <v-card flat style="margin-left: 20px">
			    <v-card-subtitle>기사 시간 : {{articleTime}}</v-card-subtitle>
			    <v-card-subtitle>기사 시간 : {{articleWriter}}</v-card-subtitle>
			    <v-card-subtitle>기사 시간 : {{articleProvider}}</v-card-subtitle>
			  </v-card>
			</v-row>
		</v-col>
			<v-card outlined>
			<v-card-title>기사 전문</v-card-title>
			<v-card-text>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec eros sed arcu vulputate dictum. Morbi vel sapien augue. Sed at metus sapien. Fusce id lobortis ante. Nam sagittis fermentum cursus. In hac habitasse platea dictumst. Donec lobortis odio eu tellus imperdiet, vel fringilla felis aliquet. Integer ultricies, quam vitae faucibus mattis, lorem risus rhoncus justo, id varius erat urna ut mi. Morbi lacinia dictum est, eu viverra massa cursus a. Quisque pellentesque, ante a condimentum vehicula, ante sapien vehicula felis, quis tempor dui ex sit amet felis.
Nulla congue enim at metus volutpat, eu convallis ante efficitur. Cras consequat, mi quis molestie varius, nulla nibh molestie eros, semper efficitur velit mi non augue. Phasellus vitae arcu nec nisi interdum sodales a ac tellus. Proin dictum velit eros, sollicitudin bibendum tortor varius a. Nullam commodo, lacus eget faucibus placerat, nibh ante consectetur metus, eget vestibulum turpis quam ac diam. Sed lobortis luctus placerat. Morbi pretium lorem varius, ultricies quam ac, convallis lorem. Nulla elementum sapien non est elementum rhoncus. In malesuada sollicitudin eros eu sagittis. Sed ullamcorper enim nisl, non malesuada tortor commodo vel. Nullam convallis eros non risus vestibulum pellentesque nec at est. Sed at massa feugiat, dignissim orci sit amet, imperdiet neque. Quisque eros nunc, cursus in maximus in, facilisis eget arcu.
Sed hendrerit iaculis erat, in molestie metus dapibus in. Aenean pulvinar vulputate nulla, in vehicula elit feugiat vel. Cras mollis mauris erat, et ultrices tellus pharetra et. Duis pellentesque, ligula et volutpat imperdiet, enim purus luctus sapien, vitae bibendum lorem nunc porttitor libero. Praesent maximus blandit nisi sit amet facilisis. Nunc sollicitudin massa quis magna ultricies, at ullamcorper urna ullamcorper. Ut ac scelerisque urna. Praesent justo nulla, facilisis ut ligula sit amet, vulputate tempus nisl. Sed sed eros mi. Suspendisse interdum purus vitae vestibulum tincidunt.
Sed id placerat mi, sit amet porta orci. Vivamus et urna mollis, auctor odio id, facilisis metus. Quisque et dui pretium, dictum turpis quis, laoreet ex. Integer vitae malesuada ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis, lorem in porttitor ullamcorper, ex ante sollicitudin enim, ut viverra nibh diam ultricies lectus. Nam pellentesque neque id nisl fermentum dignissim. Ut pellentesque, magna ac sollicitudin tempus, leo turpis vestibulum justo, quis venenatis nunc sapien sed nisi. Quisque sollicitudin in sem sit amet gravida. Mauris commodo lacinia cursus. Sed eu erat massa. Donec nisl enim, eleifend nec varius sed, faucibus vitae sapien. Phasellus vel consequat metus.
			</v-card-text>
			</v-card>
			<br>
			<v-btn @click="addFavoriteNews">
				<v-icon>mdi-plus</v-icon>
			</v-btn>
		</v-card>
	  </v-col>
	</v-container>
</script>

<script>
var article = Vue.component('article', {
	template: '#article',
	data: function () {
		return {
			articleTitle: 'title', //기사 제목
			articleTime: new Date(), //기사 시간
			articleWriter: 'spuit', //글쓴이
			articleProvider: 'MBC News', //기사 긁어온 곳
			articleContent: '기사전문', //내용
			articleTags: [
				{tagName: 'picture', tagLink: 'search?query=picture'}
				//태그 이름 , 태그 클릭 시 태그 검색하게 함. 
			]
		}
	},
	methods: {
		makeTag : function (name) {
			//var tName = tag;
			//var tLink = 'search?query=asdf'+name
		//this.articleTags.push({tagName: tName, tagLink: tLink})
		},
		addFavoriteNews : function() {
			alert("관심있는 뉴스에 추가 하시겠습니까?")
			//ajax
		}
	}
})
</script>