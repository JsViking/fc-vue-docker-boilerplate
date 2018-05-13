<template>
	<div id="app">
		<img class="logo" src="./assets/logo.svg">
		<router-view/>
	</div>
</template>

<script>
export default {
	name: 'app'
}
</script>

<style lang="less">
body {
	background: lightgrey;
}
#app {
	font-family: 'Avenir', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
	margin-top: 60px;
	.logo {
		width: 230px;
		height: 230px;
	}
}
</style>
