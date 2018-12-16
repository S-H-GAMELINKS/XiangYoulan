<template>
    <div class="container">
        <button class="btn btn-primary" v-on:click="getNowPlaces">Get Now Places</button>

        <div class="container">
            <p v-for="(place, key, index) in places" :key=index>
                <router-link :to="{name: 'places_show', params: {id: place.id}}">{{place.name}}</router-link>
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
            location: {
                lat: 0.0,
                lng: 0.0
            }
        }
    },
    mounted: function() {
        this.canGetLocation()
        this.getLocation()
    },
    methods: {
        canGetLocation: function() {
            if (navigator.geolocation) {
                alert("この端末では位置情報が取得できます");
            } else {
                alert("この端末では位置情報が取得できません");
            }
        },
        getLocation: function() {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    this.location.lat = round(position.coords.latitude, 8);
                    this.location.lng = round(position.coords.longitude, 8);
                    console.log(this.location);
                },
                (error) => {
                    switch(error.code) {
                        case 1: //PERMISSION_DENIED
                            alert("位置情報の利用が許可されていません");
                            break;
                        case 2: //POSITION_UNAVAILABLE
                            alert("現在位置が取得できませんでした");
                            break;
                        case 3: //TIMEOUT
                            alert("タイムアウトになりました");
                            break;
                        default:
                            alert("その他のエラー(エラーコード:"+error.code+")");
                        break;
                    }
                }
            );
        },
        getNowPlaces: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            this.places.length = 0;

            axios.post('/api/places/now', {lat: this.location.lat, lng: this.location.lng}).then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.places.push(response.data[i]);
                }

                this.$forceUpdate();
            }, (error) => {
                console.log(error);
            })
        }
    }

}
</script>

<style>

</style>
