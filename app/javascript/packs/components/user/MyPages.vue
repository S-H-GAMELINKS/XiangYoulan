<template>
    <div class="container">
        <label> Name: {{name}} </label>
        <label> Email: {{email}} </label>
        <label> About: </label>
        <span v-html="about"> </span>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            name: "",
            email: "",
            about: ""
        }
    }
}
</script>