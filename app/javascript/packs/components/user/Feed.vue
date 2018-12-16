<template>
    <div class="container">
        <span v-for="(feed, key, index) in feeds" :key=index>
            <span v-for="(place, key, index) in places" :key=index>
                <div v-if="place.id === feed.owner_id">
                    <div class="container">
                        <router-link :to="{name: 'places_show', params: {id: place.id}}">{{place.name}}</router-link>
                    </div>
                    <div class="container">
                        <router-link :to="{name: 'posts_show', params: {id: place.id, post_id: feed.trackable_id}}">フォローしている場所に新しい投稿がされました</router-link>
                    </div>
                    <br>
                </div>
            </span>
        </span>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            places: [],
            posts: [],
            feeds: []
        }
    },
    mounted: function() {
        this.getFeeds();
    },
    methods: {
        getAllPlaces: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.places.length = 0;

            axios.get('/api/places').then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.places.push(response.data[i]);
                }

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        },
        getFeeds: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.getAllPlaces();

            axios.get('/api/users/feed').then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.feeds.push(response.data[i]);
                }
            }, (error) => {
                console.log(error);
            })
        }
    }

}
</script>

<style>

</style>
