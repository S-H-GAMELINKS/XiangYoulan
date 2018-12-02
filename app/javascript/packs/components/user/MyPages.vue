<template>
    <div class="container">
        <label> Name: {{$store.state.user.name}} </label>
        <label> Email: {{$store.state.user.email}} </label>
        <label> About: </label>
        <span v-html="$store.state.user.about"> </span>
    </div>
</template>