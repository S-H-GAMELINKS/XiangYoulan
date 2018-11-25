import { shallowMount } from "@vue/test-utils";
import Index from 'conponents/place/Index';
import Show from 'conponents/place/Show';

describe('CRUD Post', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render Show', () => {
        const wrapper = shallowMount(Show);
        expect(wrapper).not.toBeNull();
    });
});