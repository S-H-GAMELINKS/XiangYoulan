<template>
    <div class="container">

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

            axios.get('/api/users/feed').then((response) => {
                console.log(response);
            }, (error) => {
                console.log(error);
            })
        }
    }

}
</script>

<style>

</style>
