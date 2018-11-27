import { shallowMount } from "@vue/test-utils";
import Hashtag from 'components/hashtag/Hashtags';

describe('Search Hashtags', () => {
    it('should render Hashtag', () => {

        const $route = {
            path: '/hashtags/test'
        }

        const wrapper = shallowMount(Hashtag, {
            mocks: {
              $route
            }
        });

        expect(wrapper).not.toBeNull();
    });
});