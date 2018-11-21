import Vue from 'vue';
import Header from 'components/layouts/Header';

describe('Header', () => {
    it('should render correct contents for .navbar-brand', () => {
      const Constructor = Vue.extend(Header);
      const vm = new Constructor().$mount();
      expect(vm.$el.querySelector('.navbar-brand').textContent)
      .toEqual('XaingYoulan');
    });
});