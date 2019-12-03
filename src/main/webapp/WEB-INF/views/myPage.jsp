<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>MyPage</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<!-- ��ܹ� -->
	<div id="app">
		<v-app>
		<v-container class="d-flex justify-center align-center">
			<v-sheet>
				<v-card>
					<v-card-title>ȸ�� ���� ����</v-card-title>
					<v-card-subtitle>ȸ���� �⺻ ������ �����մϴ�.</v-card-subtitle>
					<v-text-field v-model="newName" label="�̸� ����" hint="���� �� 3���� �� �� ���� ����"></v-text-field>
					<v-text-field v-model="newEmail" label="�̸��� ����"></v-text-field>
				</v-card>
				
				<v-card>
					<v-card-title>Password Change</v-card-title>
					<v-card-subtitle>�ֱ� ��й�ȣ ����  : </v-card-subtitle>
					<v-text-field v-model="oldPw" label="���� �н�����"></v-text-field>
					<v-text-field v-model="newPw" label="�ű� �н�����"></v-text-field>
					<v-btn outlined @click="pwChange">��й�ȣ ����</v-btn>
				</v-card>
				
				<v-card>
					<v-card-title>���ɻ� ����</v-card-title>
					<v-card-subtitle>�������� ��翡 ����Ǵ� ���ɻ縦 �� �����մϴ�.</v-card-subtitle>
					<a href="/auth/setFavorites">���ɻ� ���� �Ϸ� ����</a>
				</v-card>
			</v-sheet>
			</v-container>
		</v-app>
	</div>
	<!-- bottom navig��tion -->
</body>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	new Vue({
		el: '#app',
		vuetify: new Vuetify(),
		data: {
			newName: '',
			newEmail: '',
			pastPw: '',
			newPw: ''
		},
		methods: {
			pwChange : function () {
				//axios
			}
		}
	})
</script>
</html>