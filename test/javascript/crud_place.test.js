import { shallowMount } from "@vue/test-utils";
import Index from 'components/place/Index';
import Show from 'components/place/Show';
import Create from 'components/place/Create';
import Edit from 'components/place/Edit';
import Form from 'components/place/Form';

describe('CRUD Place', () => {
    const $store = {
        state: {
            user: {
                id: 1
            }
        }
    }

    it('should render Index', () => {
        const wrapper = shallowMount(Index, {
            mocks: {
                $store
            }
        });
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