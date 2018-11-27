import Vue from 'vue/dist/vue.esm';
import * as VueGoogleMaps from 'vue2-google-maps';
import SocialSharing from 'vue-social-sharing';
import Paginate from 'vuejs-paginate'
import Router from './router/router';
import Header from './components/layouts/Header.vue';

Vue.use(VueGoogleMaps, {
    load: {
      key: gon.GoogleMapKey,
    },
})

Vue.use(SocialSharing);
Vue.component('paginate', Paginate)

const app = new Vue({
    el: '#app',
    router: Router,
    components: {
        'nav-bar': Header
    },
})