import Vue from 'vue/dist/vue.esm';
import Router from './router/router';
import Header from './components/layouts/Header.vue';

const app = new Vue({
    el: '#app',
    router: Router,
    components: {
        'nav-bar': Header
    },
    data: function () {
        return {
            mes: "Hello Ruby on Rails with Vue.js"
        }
    }
})