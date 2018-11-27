<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label>Name</label>
                <input class="form-control" v-model="name" placeholder="Input your place name ......">
            </div>
            <div class="form-group">
                <label>Content</label>
                <vue-editor v-model="content" :editorOptions="editorSettings">
                </vue-editor>
            </div>
            <div class="form-group">
                <label>Hashtag</label>
                <input v-model="hashtags">
            </div>
        </form>
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
                @drag="updateLocation"
            />
        </GmapMap>
        <p>
            <button type="button" class="btn btn-primary" v-if="creatable" v-on:click="createPlace">Create</button>
            <button type="button" class="btn btn-primary" v-if="editable" v-on:click="editPlace">Update</button>
        </p>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery'
import { VueEditor, Quill } from 'vue2-editor';
import { ImageDrop } from "quill-image-drop-module";
import { ImageResize } from "quill-image-resize-module";

Quill.register("modules/imageDrop", ImageDrop);
Quill.register("modules/imageResize", ImageResize);

export default {
    data: function() {
        return {
            name: "",
            content: "",
            hashtags: "",
            geocode: {
                lat: 0.0,
                lng: 0.0
            },
            editorSettings: {
                modules: {
                    imageDrop: true,
                    imageResize: {}
                }
            },
            creatable: false,
            editable: false
        }
    },
    components: {
        VueEditor
    },
    watch: {
        name: function() {
            this.getLocation();
            console.log(this.geocode);
        }
    },
    mounted: function() {
        this.checkAddress();
        if(this.editable) {
            this.getPlace();
            this.getHashTags();
        }
    },
    methods: {
        checkAddress: function() {
            const url = String(this.$route.path);
            if(url.match(/edit/)) {
                this.editable = true;
            } else {
                this.creatable = true;
            }
        },
        getPlace: function() {
            const id = String(this.$route.path).replace(/\/places\//, '').replace(/\/edit/, '');

            axios.get('/api/places/' + id).then((response) => {
                this.name = response.data.name;
                this.content = response.data.content;
                this.geocode.lat = response.data.latitude;
                this.geocode.lng = response.data.longitude
                console.log(response);
            }, (error) => {
                alert(error);
            })
        },
        createPlace: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/places', {place: {name: this.name, content: this.content, tags: this.hashtags, latitude: parseFloat(this.geocode.lat), longitude: parseFloat(this.geocode.lng)}}).then((response) => {

                if (this.name === "" || this.content === "") {
                    alert("Can't be black in Title or Content!!");
                } else {
                    alert("Success!");
                    this.$router.push({path: '/places'});
                }
            }, (error) => {
                alert(error);
            })
        },
        editPlace: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/places\//, '').replace(/\/edit/, '');

            axios.put('/api/places/' + id, {place: {name: this.name, content: this.content, tags: this.hashtags ,latitude: parseFloat(this.geocode.lat), longitude: parseFloat(this.geocode.lng)}}).then((response) => {

                if (this.name === "" || this.content === "") {
                    alert("Can't be black in Title or Content!!");
                } else {
                    alert("Success!");
                    this.$router.push({path: '/places'});
                }
            }, (error) => {
                alert(error);
            })
        },
        getHashTags: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/places\//, '').replace(/\/edit/, '');
            axios.post('/api/places/hashtags', {id: id}).then((response) => {
                this.hashtags = response.data.join(' ');
            }, (error) => {
                alert(error);
            })
        },
        getLocation: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/places/location', { name: this.name }).then((response) => {
                this.geocode.lat = response.data[0];
                this.geocode.lng = response.data[1];
            }, (error) => {
                console.log(error);
            })
        },
        updateLocation(location) {
            this.geocode = {
                lat: location.latLng.lat(),
                lng: location.latLng.lng(),
            };
        },
    }
}
</script>