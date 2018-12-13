<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label>Tittle</label>
                <input class="form-control" v-model="title" placeholder="Input your post title ......">
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
        <p>
            <button type="button" class="btn btn-primary" v-if="creatable" v-on:click="createPost">Create</button>
            <button type="button" class="btn btn-primary" v-if="editable" v-on:click="editPost">Update</button>
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
            title: "",
            content: "",
            hashtags: "",
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
    mounted: function() {
        this.checkAddress();
        if(this.editable) {
            this.getPost();
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
        getPost: function() {
            const id = String(this.$route.path).replace(/\/posts\//, '').replace(/\/edit/, '');

            axios.get('/api/posts/' + id).then((response) => {
                this.title = response.data.title;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        },
        createPost: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/posts', {post: {title: this.title, content: this.content, tags: this.hashtags}}).then((response) => {

                if (this.title === "" || this.content === "") {
                    alert("Can't be black in Title or Content!!");
                } else {
                    alert("Success!");
                    this.$router.push({name: 'places_show'});
                }
            }, (error) => {
                alert(error);
            })
        },
        editPost: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/posts\//, '').replace(/\/edit/, '');

            axios.put('/api/posts/' + id, {post: {title: this.title, content: this.content, tags: this.hashtags}}).then((response) => {

                if (this.title === "" || this.content === "") {
                    alert("Can't be black in Title or Content!!");
                } else {
                    alert("Success!");
                    this.$router.push({name: 'places_show'});
                }
            }, (error) => {
                alert(error);
            })
        },
        getHashTags: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/posts\//, '').replace(/\/edit/, '');
            axios.post('/api/posts/hashtags', {id: id}).then((response) => {
                this.hashtags = response.data.join(' ');
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>