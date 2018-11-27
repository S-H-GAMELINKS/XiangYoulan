import { shallowMount } from "@vue/test-utils";
import Hashtag from 'components/hashtag/Hashtags';
import Place from 'components/hashtag/Place';

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

    it('should render Place', () => {

        const $route = {
            path: '/hashtags/test'
        }

        const wrapper = shallowMount(Place, {
            mocks: {
              $route
            }
        });

        expect(wrapper).not.toBeNull();
    });
});