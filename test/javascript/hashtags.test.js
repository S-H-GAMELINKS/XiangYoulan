import { shallowMount } from "@vue/test-utils";
import Hashtag from 'components/hashtag/Hashtags';
import Place from 'components/hashtag/Place';
import Post from 'components/hashtag/Post';

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

    it('should render Post', () => {

        const $route = {
            path: '/hashtags/test'
        }

        const wrapper = shallowMount(Post, {
            mocks: {
              $route
            }
        });

        expect(wrapper).not.toBeNull();
    });
});