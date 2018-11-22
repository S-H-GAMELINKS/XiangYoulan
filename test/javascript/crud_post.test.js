import { shallowMount } from "@vue/test-utils"
import Index from 'components/post/Index';
import Show from 'components/post/Show';
import Create from 'components/post/Create';
import Edit from 'components/post/Edit';
import Form from 'components/post/Form';

describe('CRUD Post', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render Show', () => {

        const $route = {
            path: '/posts/1'
        }

        const wrapper = shallowMount(Show, {
            mocks: {
              $route
            }
        });
        expect(wrapper).not.toBeNull();
    });

    it('should render Create', () => {
        const wrapper = shallowMount(Create);
        expect(wrapper).not.toBeNull();
    });

    it('should render Edit', () => {
        const wrapper = shallowMount(Edit);
        expect(wrapper).not.toBeNull();
    });

    it('should create post', () => {
        const $route = {
            path: '/posts/new'
        }

        const wrapper = shallowMount(Form, {
            mocks: {
              $route
            }
        });

        wrapper.find("input").setValue("test");
        wrapper.find("textarea").setValue("test");

        wrapper.find("button").trigger('click')

        expect(wrapper.find('.error').exists()).toBe(false);
    })

    it('should edit post', () => {
        const $route = {
            path: '/posts/1/edit'
        }

        const wrapper = shallowMount(Form, {
            mocks: {
              $route
            }
        });

        wrapper.find("input").setValue("test");
        wrapper.find("textarea").setValue("test");

        wrapper.find("button").trigger('click')

        expect(wrapper.find('.error').exists()).toBe(false);
    })
});