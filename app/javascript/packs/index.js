import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import * as VueGoogleMaps from 'vue2-google-maps';
import SocialSharing from 'vue-social-sharing';
import Paginate from 'vuejs-paginate'
import Router from './router/router';
import Store from './store/store';
import Header from './components/layouts/Header.vue';

Vue.use(Vuex);

Vue.use(VueGoogleMaps, {
    load: {
      key: gon.GoogleMapKey,
      libraries: 'places', 
    },
})

Vue.use(SocialSharing);

Vue.component('paginate', Paginate);

const app = new Vue({
    el: '#app',
    router: Router,
    store: Store,
    components: {
        'nav-bar': Header
    },
})