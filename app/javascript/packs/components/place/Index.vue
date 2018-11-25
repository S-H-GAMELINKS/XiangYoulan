<template>
    <div>
        <div class="container">
            <p v-for="(place, key, index) in places" :key=index>
                <router-link :to="{name: 'posts', params: {id: place.id}}">{{place.title}}</router-link>
                <router-link :to="{name: 'edits', params: {id: place.id}}" >Edit</router-link>
            </p>
            <router-link to="/places/new" >New</router-link>
            <paginate
                v-model="pages"
                :page-count="pageCount"
                :click-handler="getPlaces"
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
            places: [],
            pages: 1,
            pageCount: 0,
            pagePer: 20
        }
    },
    mounted: function() {
        this.getPageCounts();
        this.getPlaces();
    },
    methods: {
        getPageCounts: function() {
            axios.get('/api/places').then((response) => {

                let counter = 0;

                for(var i = 0; i < response.data.length; i++) {
                    counter++;
                }

                this.pageCount = Math.ceil(counter / this.pagePer);
            }, (error) => {
                console.log(error);
            })
        },
        getPlaces: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.posts.length = 0;

            axios.post('/api/places/pagenation', {page: this.pages}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.places.push(response.data[i]);
                }

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        },
    }

}
</script>