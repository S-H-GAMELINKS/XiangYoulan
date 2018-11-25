import { shallowMount } from "@vue/test-utils";
import Index from 'conponents/place/Index';
import Show from 'conponents/place/Show';
import Create from 'conponents/place/Create';

describe('CRUD Place', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render Show', () => {
        const wrapper = shallowMount(Show);
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
});