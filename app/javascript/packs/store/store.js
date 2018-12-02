import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import axios from 'axios';
import $ from 'jquery';

Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        user: {
            id: 0,
            name: "",
            email: "",
            about: "",
            session: false
        }
    },
    mutations: {
        getSession(state) {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.get('/api/users/sessions').then((response) => {
                if (response.data === null) {
                    state.user.session = false;
                } else {
                    state.user.id = response.data.id;
                    state.user.name = response.data.name;
                    state.user.email = response.data.email;
                    state.user.about = response.data.about;
                    state.user.session = true;
                }
            }, (error) => {
                console.log(error);
            })
        }
    },
    plugins: [ createPersistedState({
        key: 'loginSession',
        paths: ['session'],
        storage: window.sessionStorage,
    })]
});

export default store;