<template>
    <div class="container">
        <p><h1>Name: {{name}} </h1></p>
        <social-share></social-share>
        <p><h2>Content</h2></p>
        <p v-html="content"></p>
    </div>
</template>

<script>

import axios from 'axios';
import SocialShare from '../layouts/SocialShare.vue';

export default {
    data: function() {
        return {
            name: "",
            content: ""
        }
    },
    components: {
        SocialShare
    },
    mounted: function() {
        this.getPlace();
    },
    methods: {
        getPlace: function() {
            const id = String(this.$route.path).replace(/\/places\//, '');
            axios.get('/api/places/' + id).then((response) => {
                this.title = response.data.name;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>