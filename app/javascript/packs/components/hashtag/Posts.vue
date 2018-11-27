<template>
    <div>
        <div class="container">
            <h1>Posts</h1>
            <p v-for="(post, key, index) in posts" :key=index>
                <router-link :to="{name: 'posts_show', params: {id: post.id}}">{{post.title}}</router-link>
                <router-link :to="{name: 'posts_edits', params: {id: post.id}}" >Edit</router-link>
            </p>
        </div>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            posts: [],
            tag: String(this.$route.path).replace(/\/hashtags\//, '')
        }
    },
    mounted: function() {
        this.getPosts();
    },
    methods: {
        getPosts: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.posts.length = 0;

            axios.post('/api/posts/search/hashtags', {tag: this.tag}).then((response) => {
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