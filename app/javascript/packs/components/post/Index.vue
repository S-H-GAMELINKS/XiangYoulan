<template>
    <div>
        <div class="container">
            <p v-for="(post, key, index) in posts" :key=index>
                {{post.title}}
            </p>
        </div>
    </div>
</template>

<script>

import axios from 'axios';
import func from './vue-temp/vue-editor-bridge';

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