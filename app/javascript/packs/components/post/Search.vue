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
            axios.get('/api/posts/search', {content_cont: this.keyword}).then((response) => {
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