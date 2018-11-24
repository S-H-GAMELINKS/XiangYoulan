<template>
    <div>
        <social-sharing url="https://vuejs.org/"
                      :title="title"
                      description="Sharing Xiang Youlan"
                      quote="Sharing Xiang Youlan"
                      inline-template>
            <div>
                <network network="facebook">
                    <i class="fa fa-facebook"></i> Facebook 
                </network>
                <network network="line">
                    <i class="fa fa-line"></i> Line
                </network>
                <network network="twitter">
                    <i class="fa fa-twitter"></i> Twitter
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
            content: ""
        }
    },
    mounted: function() {
        this.getPost();
    },
    methods: {
        getPost: function() {
            const id = String(this.$route.path).replace(/\/posts\//, '');
            axios.get('/api/posts/' + id).then((response) => {
                this.title = response.data.title;
                this.content = response.data.content;
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>
