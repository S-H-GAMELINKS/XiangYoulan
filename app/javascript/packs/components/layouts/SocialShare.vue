<template>
    <div>
        <social-sharing :url="url"
                      :title="title"
                      description="Sharing Xiang Youlan"
                      quote="Sharing Xiang Youlan"
                      inline-template>
            <div>
                <network network="facebook">
                    <button class="fa fa-facebook">Facebook</button> 
                </network>
                <network network="line">
                    <button class="fa fa-line">Line</button>
                </network>
                <network network="twitter">
                    <button class="fa fa-twitter">Twitter</button>
                </network>
            </div>
        </social-sharing>
    </div>
</template>

<script>

import axios from 'axios';

export default {
    data: function() {
        return {
            title: "",
            content: "",
            url: location.href,
            placable: false,
            postable: false
        }
    },
    mounted: function() {
        this.checkAddress();
        if (this.postable) {
            this.getPost();
        } else {
            this.getPlace();
        }
    },
    methods: {
        checkAddress: function() {
            const url = String(this.$route.path);
            if(url.match(/\/places\/\d\/posts/)) {
                this.postable = true;
            } else {
                this.placable = true;
            }
        },
        getPost: function() {
            const id = String(this.$route.path).replace(/\/places\/\d+\/posts\//, '');
            axios.get('/api/posts/' + id).then((response) => {
                this.title = response.data.title;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        },
        getPlace: function() {
            const id = String(this.$route.path).replace(/\/places\//, '');
            axios.get('/api/places/' + id).then((response) => {
                this.title = response.data.name;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>
