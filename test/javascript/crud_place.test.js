import { shallowMount } from "@vue/test-utils";
import Index from 'conponents/place/Index';
import Show from 'conponents/place/Show';
import Create from 'conponents/place/Create';
import Edit from 'conponents/place/Edit';
import Form from 'components/place/Form';

describe('CRUD Place', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render Show', () => {

        const $route = {
            path: '/places/1'
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

    it('should create place', () => {
        const $route = {
            path: '/places/new'
        }

        const wrapper = shallowMount(Form, {
            mocks: {
              $route
            }
        });

        wrapper.find("input").setValue("test");
        wrapper.find("input").setValue("test");

        wrapper.find("button").trigger('click')

        expect(wrapper.find('.error').exists()).toBe(false);
    })

    it('should edit place', () => {
        const $route = {
            path: '/places/1/edit'
        }

        const wrapper = shallowMount(Form, {
            mocks: {
              $route
            }
        });

        wrapper.find("input").setValue("test");
        wrapper.find("input").setValue("test");

        wrapper.find("button").trigger('click')

        expect(wrapper.find('.error').exists()).toBe(false);
    })
});