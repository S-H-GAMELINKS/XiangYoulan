<template>
    <div>
        <div class="container">
            <p v-for="(post, key, index) in posts" :key=index>
                <router-link :to="{name: 'posts', params: {id: post.id}}">{{post.title}}</router-link>
            </p>
        </div>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery'

export default {
    data: function() {
        return {
            keyword: String(this.$route.path).replace(/\/search\//,''),
            posts: []
        }
    },
    mounted: function() {
        this.searchPosts()
    },
    methods: {
        searchPosts: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/posts/search', {q: {content_cont: this.keyword}}).then((response) => {
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