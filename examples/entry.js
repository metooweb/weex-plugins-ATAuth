import Vue from 'vue';

import weex from 'weex-vue-render';

import ATAuth from '../src/index';

weex.init(Vue);

weex.install(ATAuth)

const App = require('./index.vue');
App.el = '#root';
new Vue(App);
