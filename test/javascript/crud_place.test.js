import { shallowMount } from "@vue/test-utils";
import Index from 'conponents/place/Index';

describe('CRUD Post', () => {
    it('should render Index', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });
});