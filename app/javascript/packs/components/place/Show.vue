<template>
    <div class="container">
        <p><h1>Name: {{name}} </h1></p>
        <social-share></social-share>
        <p><h2>Content</h2></p>
        <p v-html="content"></p>
        <div v-for="(tag, key, index) in hashtags" :key=index>
            {{tag}}
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
            name: "",
            content: "",
            hashtags: []
        }
    },
    components: {
        SocialShare
    },
    mounted: function() {
        this.getPlace();
        this.getHashTags();
    },
    methods: {
        getPlace: function() {
            const id = String(this.$route.path).replace(/\/places\//, '');
            axios.get('/api/places/' + id).then((response) => {
                this.name = response.data.name;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        },
        getHashTags: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/places\//, '');
            axios.post('/api/places/hashtags', {id: id}).then((response) => {
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