<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label>Name</label>
                <input class="form-control" v-model="name" placeholder="Input your name ......">
            </div>
            <div class="form-group">
                <label>E-Mail</label>
                <input class="form-control" v-model="email" placeholder="Input your email ......">
            </div>
            <div class="form-group">
                <label>About</label>
                <vue-editor class="form-control" v-model="about" :editorOptions="editorSettings"></vue-editor>
            </div>
        </form>
        <p>
            <button type="button" class="btn btn-primary" v-on:click="userSignIn">Sign In</button>
        </p>
    </div>
</template>

<script>

import axios from 'axios';
import $ from 'jquery';
import { VueEditor, Quill } from 'vue2-editor';
import { ImageDrop } from "quill-image-drop-module";
import { ImageResize } from "quill-image-resize-module";

Quill.register("modules/imageDrop", ImageDrop);
Quill.register("modules/imageResize", ImageResize);

export default {
    data: function() {
        return {
            name: "",
            email: "",
            about: ""
        }
    },
    components: {
        VueEditor
    },
    methods: {
        userInfoUpdate: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/users', {user: { name: this.name, email: this.email, about: this.about }}).then((response) => {
                console.log(response);
                this.$router.push({path: '/'});
            }, (error) => {
                console.log(error);
            })
        }
    }
}
</script>