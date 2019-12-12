<%@ page pageEncoding="UTF-8"%>
<script type="text/x-template" id="setFavorites">
	<v-container class="d-flex justify-center">
		<v-card width="600">
			<v-card-title>Select Favorite</v-card-title>
			<v-card-subtitle>관십사 입력 후 엔터키 입력, 여러 개 설정 가능</v-card-subtitle>
				<v-combobox
			      v-model="chips"
			      chips
			      clearable
			      label="Your favorite hobbies"
			      multiple
			      solo
			    >
			    <template v-slot:selection="{ attrs, item, select, selected }">
			        <v-chip
			          v-bind="attrs"
			          :input-value="selected"
			          close
			          @click="select"
			          @click:close="remove(item)"
			        >
			       <strong>{{ item }}</strong>&nbsp;
			       </v-chip>
			    </template>
			   </v-combobox>
			   <v-card-context>설정하신 관심사는 기사를 분류하는 기준이 됩니다.</v-card-context>
			   <v-card-action>
			   	<v-btn @click="requestFavorite" color="primary" outlined>Confirm</v-btn>
			   </v-card-action>
		</v-card>
	</v-container>
</script>

<script>
var setFavorites = Vue.component('setFavorites', {
    template: '#setFavorites',
    data: function (){
		return {
			chips: []
		}
    },
    mounted: function () {
    	axios.post('/api/user/auth/getFavorites')
    	.then((res) => {
    		this.chips = res.data
    	})
    },
    methods: {
  	  requestFavorite: function() {
  		  
  		axios.post('/api/user/auth/setFavorites', this.chips)
  		.then (((res) => {
  			 if(res.data == 1) alert("관심사 설정 성공")
  			 else alert("관심사 설정 실패")
  		}))
  	  },
  	  
  	  remove (item) {
  	      this.chips.splice(this.chips.indexOf(item), 1)
  	      this.chips = [...this.chips]
  	  },
    },
    computed: {
  	  
    }
 })
</script>
