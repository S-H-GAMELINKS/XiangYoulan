<template>
    <div>
        <div class="container">
            <p v-for="(post, key, index) in posts" :key=index>
                <router-link :to="{name: 'posts', params: {id: post.id}}">{{post.title}}</router-link>
                <router-link :to="{name: 'edits', params: {id: post.id}}" >Edit</router-link>
            </p>
            <router-link to="/posts/new" >New</router-link>
        </div>
    </div>
</template>

<script>

import axios from 'axios';

export default {
    data: function() {
        return {
            posts: []
        }
    },
    mounted: function() {
        this.getPosts()
    },
    methods: {
        getPosts: function() {
            axios.get('/api/posts').then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.posts.push(response.data[i]);
                }
            }, (error) => {
                console.log(error);
            })
        },
    }

}
</script>