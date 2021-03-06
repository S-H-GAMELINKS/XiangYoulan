import { shallowMount } from "@vue/test-utils";
import Search from 'components/post/Search';

describe('Search Post', () => {
    it('should render Search', () => {

        const $route = {
            path: '/search/test'
        }

        const wrapper = shallowMount(Search, {
            mocks: {
              $route
            }
        });

        expect(wrapper).not.toBeNull();
    });
});