<template>
    <div class="container">
        <p><h1>Name: {{name}} </h1></p>
        <social-share></social-share>
        <p><h2>Content</h2></p>
        <p v-html="content"></p>
        <GmapMap
            :center="geocode"
            :zoom="7"
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

export default {
    data: function() {
        return {
            name: "",
            content: "",
            geocode: {
                lat: 0.0,
                lng: 0.0
            }
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
                this.name = response.data.name;
                this.content = response.data.content;
                this.geocode.lat = response.data.latitude
                this.geocode.lng = response.data.longitude
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>