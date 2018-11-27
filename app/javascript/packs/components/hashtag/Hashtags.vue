<template>
    <div class="container">
        <div class="conatiner">
            <hashtag-place></hashtag-place>
        </div>
        <div class="container">
            <hashtag-post></hashtag-post>
        </div>
    </div>
</template>

<script>

import Places from './Places.vue';
import Posts from './Posts.vue';

export default {
    component: {
        'hashtag-place': Places,
        'hashtag-post': Posts
    }
}
</script>