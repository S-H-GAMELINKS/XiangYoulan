<template>
    <div class="container">
        <p><h1>Name: {{name}} </h1></p>
        <social-share></social-share>
        <button class="btn btn-danger" type="submit" v-if="followable" v-on:click="unfollowPlace">Unfollow</button>
        <button class="btn btn-primary" type="submit" v-else v-on:click="followPlace">Follow</button>
        <p><h2>Content</h2></p>
        <p v-html="content"></p>
        <div v-for="(tag, key, index) in hashtags" :key=index>
            <router-link :to="{name: 'hashtags', params: {id: tag}}">{{tag}}</router-link>
        </div>
        <GmapMap
            :center="geocode"
            :zoom="15"
            map-type-id="terrain"
            style="width: 500px; height: 300px"
        >
            <GmapMarker
                :position="geocode"
                :clickable="true"
                :draggable="true"
                @click="center=geocode"
            />
        </GmapMap>
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
            hashtags: [],
            geocode: {
                lat: 0.0,
                lng: 0.0
            },
            followable: false
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
                this.geocode.lat = response.data.latitude
                this.geocode.lng = response.data.longitude
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
        },
        followPlace: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/places\//, '');

            axios.post('/api/places/follow', {id: id}).then((response) => {
                this.followable = response.data;
                this.$forceUpdate();
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>