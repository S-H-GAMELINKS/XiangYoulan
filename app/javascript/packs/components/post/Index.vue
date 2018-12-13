<template>
    <div>
        <div class="container">
            <p v-for="(post, key, index) in posts" :key=index>
                <router-link :to="{name: 'posts_show', params: {post_id: post.id}}">{{post.title}}</router-link>
                <router-link :to="{name: 'posts_edits', params: {post_id: post.id}}" >Edit</router-link>
            </p>
            <router-link class="btn btn-primary" :to="{name: 'posts_new'}" >New Post</router-link>
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
            pagePer: 20
        }
    },
    mounted: function() {
        this.getPageCounts();
        this.getPosts();
    },
    methods: {
        getPageCounts: function() {
            axios.get('/api/posts').then((response) => {

                let counter = 0;

                for(var i = 0; i < response.data.length; i++) {
                    counter++;
                }

                this.pageCount = Math.ceil(counter / this.pagePer);
            }, (error) => {
                console.log(error);
            })
        },
        getPosts: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.posts.length = 0;

            axios.post('/api/posts/pagenation', {page: this.pages}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.posts.push(response.data[i]);
                }

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        },
    }

}
</script>