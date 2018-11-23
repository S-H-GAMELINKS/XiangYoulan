import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

import Index from '../components/web/Index.vue';
import About from '../components/web/About.vue';
import Contact from '../components/web/Contact.vue';
import Blogs from '../components/post/Index.vue';
import Create from '../components/post/Create.vue';
import Show from '../components/post/Show.vue';
import Edit from '../components/post/Edit.vue';
import Search from '../components/post/Search.vue';

Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Index },
        { path: '/about', component: About },
        { path: '/contact', component: Contact },
        { path: '/search/:id', component: Search, name: 'search'},
        { path: '/posts', component: Blogs },
        { path: '/posts/new', component: Create },
        { path: '/posts/:id', component: Show, name: 'posts'},
        { path: '/posts/:id/edit', component: Edit, name: 'edits'},
    ]
})