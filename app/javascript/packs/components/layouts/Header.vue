<template>
<div>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <router-link to="/" class="navbar-brand">XaingYoulan</router-link>
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Menu
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <router-link to="/" class="dropdown-item">Top</router-link>
      <router-link to="/about" class="dropdown-item">About</router-link>
      <router-link to="/contact" class="dropdown-item">Contact</router-link>
      <router-link to="/posts" class="dropdown-item">Posts</router-link>
      <router-link to="/places" class="dropdown-item">Places</router-link>
      <router-link to="/sign_in" class="dropdown-item">SignIn</router-link>
      <router-link to="/sign_up" class="dropdown-item">SignUp</router-link>
      <span v-on:click="userSignOut" class="dropdown-item">SignOut</span>
    </div>
  </div>
  <form class="form-inline my-2 my-lg-0">
    <input class="form-control mr-sm-2" type="search" v-model="keyword" placeholder="Search" aria-label="Search">
    <router-link :to="{name: 'search', params: {id: keyword}}" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</router-link>
  </form>
</nav>
</div>    
</template>

<script>

import axios from 'axios';
import $ from 'jquery';
import { error } from 'util';

export default {
  data: function() {
    return {
      keyword: ""
    }
  },
  methods: {
    userSignOut: function() {
      axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
      axios.defaults.headers['content-type'] = 'application/json';

      axios.delete('/users/sign_out').then((response) => {
        console.log(response);
        alert('Sing Out!');
      }, (error) => {
        console.log(error);
        alert('Sing Out!');
      })
    }
  }
}
</script>
