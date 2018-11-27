import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

import Index from '../components/web/Index.vue';
import About from '../components/web/About.vue';
import Contact from '../components/web/Contact.vue';

import PostsIndex from '../components/post/Index.vue';
import PostsCreate from '../components/post/Create.vue';
import PostsShow from '../components/post/Show.vue';
import PostsEdit from '../components/post/Edit.vue';
import PostsSearch from '../components/post/Search.vue';

import PlacesIndex from '../components/place/Index.vue';
import PlacesCreate from '../components/place/Create.vue';
import PlacesShow from '../components/place/Show.vue';
import PlacesEdit from '../components/place/Edit.vue';

import Hashtags from '../components/hashtag/Hashtags.vue';

Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Index },
        { path: '/about', component: About },
        { path: '/contact', component: Contact },
        { path: '/search/:id', component: PostsSearch, name: 'search'},
        { path: '/posts', component: PostsIndex },
        { path: '/posts/new', component: PostsCreate },
        { path: '/posts/:id', component: PostsShow, name: 'posts_show'},
        { path: '/posts/:id/edit', component: PostsEdit, name: 'posts_edits'},
        { path: '/places', component: PlacesIndex },
        { path: '/places/new', component: PlacesCreate },
        { path: '/places/:id', component: PlacesShow, name: 'places_show'},
        { path: '/places/:id/edit', component: PlacesEdit, name: 'places_edits'},
        { path: '/hashtags/:id', component: Hashtags, name: 'hashtags'},
    ]
})