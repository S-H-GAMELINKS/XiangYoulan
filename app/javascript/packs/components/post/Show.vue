<template>
    <div class="container">
        <p><h1>Title: {{title}} </h1></p>
        <social-share></social-share>
        <p><h2>Content</h2></p>
        <p v-html="content"></p>
        <div v-for="(tag, key, index) in hashtags" :key=index>
            <router-link :to="{name: 'hashtags', params: {id: tag}}">{{tag}}</router-link>
        </div>
    </div>
</template>

<script>

import axios from 'axios';
import SocialShare from '../layouts/SocialShare.vue';
import $ from 'jquery';

export default {
    data: function() {
        return {
            title: "",
            content: "",
            hashtags: []
        }
    },
    components: {
        SocialShare
    },
    mounted: function() {
        this.getPost();
        this.getHashTags();
    },
    methods: {
        getPost: function() {
            const id = String(this.$route.path).replace(/\/posts\//, '');
            axios.get('/api/posts/' + id).then((response) => {
                this.title = response.data.title;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        },
        getHashTags: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/posts\//, '');
            axios.post('/api/posts/hashtags', {id: id}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.hashtags.push(response.data[i]);
                }
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>