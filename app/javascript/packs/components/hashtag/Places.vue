<template>
    <div>
        <div class="container">
            <h1>Places</h1>
            <p v-for="(place, key, index) in places" :key=index>
                <router-link :to="{name: 'places_show', params: {id: place.id}}">{{place.name}}</router-link>
                <router-link :to="{name: 'places_edits', params: {id: place.id}}" >Edit</router-link>
            </p>
        </div>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            places: [],
            tag: String(this.$route.path).replace(/\/hashtags\//, '')
        }
    },
    mounted: function() {
        this.getPlaces();
    },
    methods: {
        getPlaces: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.places.length = 0;

            axios.post('/api/places/search/hashtags', {tag: this.tag}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.places.push(response.data[i]);
                }
            }, (error) => {
                console.log(error);
            })
        },
    }

}
</script>