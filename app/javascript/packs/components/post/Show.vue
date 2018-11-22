<template>
    <div class="container">
        <p><h1>Title: {{title}} </h1></p>

        <p><h2>Content</h2></p>
        <p>{{content}}</p>
    </div>
</template>

<script>

import axios from 'axios';

export default {
    data: function() {
        return {
            title: "",
            content: ""
        }
    },
    mounted: function() {
        this.getPost();
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
        }
    }
}
</script>