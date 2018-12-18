<template>
    <div>
        <div class="container">
            <p v-for="(post, key, index) in posts" :key=index>
                <router-link :to="{name: 'posts_show', params: {post_id: post.id}}">{{post.title}}</router-link>
                <router-link :to="{name: 'posts_edits', params: {post_id: post.id}}" v-if='user.id == post.user_id' >Edit</router-link>
                <router-link :to="{name: 'places_show'}" v-if='user.id == post.user_id' v-on:click.native="deletePost(post.id)" >Delete</router-link>
            </p>
            <router-link class="btn btn-primary" v-if='user.session' :to="{name: 'posts_new'}" >New Post</router-link>
            <paginate
                v-model="pages"
                :page-count="pageCount"
                :click-handler="getPosts"
                :prev-text="'Prev'"
                :next-text="'Next'"
                :container-class="'pagination'"
                :page-class="'page-item'">
            </paginate>
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
            pages: 1,
            pageCount: 0,
            pagePer: 20,
            user: this.$store.state.user
        }
    },
    mounted: function() {
        this.getPageCounts();
        this.getPosts();
    },
    methods: {
        getPageCounts: function() {
            const place_id = String(this.$route.path).replace(/\/places\//, '')

            axios.post('/api/posts/count', {place_id: place_id}).then((response) => {
                this.pageCount = Math.ceil(response.data / this.pagePer);
                console.log(this.pageCount)
            }, (error) => {
                console.log(error);
            })
        },
        getPosts: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.posts.length = 0;

            const place_id = String(this.$route.path).replace(/\/places\//, '')

            axios.post('/api/posts/pagenation', {page: this.pages, place_id: place_id}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.posts.push(response.data[i]);
                }

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        },
        deletePost: function(post_id) {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.delete('/api/posts/' + String(post_id)).then((response) => {
                this.getPageCounts();
                this.getPosts();

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        }
    }

}
</script>