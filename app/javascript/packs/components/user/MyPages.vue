<template>
    <div class="container">
        <router-link to="/users/mypages/edit">Edit</router-link>
        <label> Name: {{$store.state.user.name}} </label>
        <label> Email: {{$store.state.user.email}} </label>
        <label> About: </label>
        <span v-html="$store.state.user.about"> </span>
    </div>
</template>