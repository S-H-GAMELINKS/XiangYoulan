import { shallowMount } from "@vue/test-utils"
import Index from 'components/post/Index';
import Show from 'components/post/Show';
import Create from 'components/post/Create';
import Edit from 'components/post/Edit';

describe('CRUD Post', () => {
    it('should render Index', () => {
        const wrapper = mount(Index);
        expect(wrapper.isVueInstance()).toBeTruthy()
    });

    it('should render Show', () => {
        const wrapper = mount(Show);
        expect(wrapper.isVueInstance()).toBeTruthy()
    });

    it('should render Create', () => {
        const wrapper = mount(Create);
        expect(wrapper.isVueInstance()).toBeTruthy()
    });

    it('should render Edit', () => {
        const wrapper = mount(Edit);
        expect(wrapper.isVueInstance()).toBeTruthy()
    });

    it('should create post', () => {
        const wrapper = shallowMount(Create);

        wrapper.find("[data-title]").setValue("test");
        wrapper.find("[data-content]").setValue("test");

        wrapper.find("button").trigger("submit")

        expect(wrapper.find('.error').exists()).toBe(false);
    })
});