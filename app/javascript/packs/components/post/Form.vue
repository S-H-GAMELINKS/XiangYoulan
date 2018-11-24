<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label>Tittle</label>
                <input class="form-control" v-model="title" placeholder="Input your post title ......">
            </div>
            <div class="form-group">
                <label>Content</label>
                <vue-editor v-model="content"
                            :customModules="customModulesForEditor"
                            :editorOptions="editorSettings">
                </vue-editor>
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
import { VueEditor } from 'vue2-editor';
import { ImageDrop } from 'quill-image-drop-module';

export default {
    data: function() {
        return {
            title: "",
            content: "",
            customModulesForEditor: [
                { alias: 'imageDrop', module: ImageDrop },
            ],
            editorSettings: {
                modules: {
                    imageDrop: true,
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

            axios.post('/api/posts', {post: {title: this.title, content: this.content}}).then((response) => {
                alert("Success!");
                this.$router.push({path: '/posts'});
            }, (error) => {
                alert(error);
            })
        },
        editPost: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/posts\//, '').replace(/\/edit/, '');

            axios.put('/api/posts/' + id, {post: {title: this.title, content: this.content}}).then((response) => {
                alert("Success!");
                this.$router.push({path: '/posts'});
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>