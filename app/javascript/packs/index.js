import Vue from 'vue/dist/vue.esm';
import SocialSharing from 'vue-social-sharing';
import Router from './router/router';
import Header from './components/layouts/Header.vue';

Vue.use(SocialSharing);

const app = new Vue({
    el: '#app',
    router: Router,
    components: {
        'nav-bar': Header
    },
})