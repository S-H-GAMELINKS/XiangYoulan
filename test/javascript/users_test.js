import { shallowMount } from "@vue/test-utils";
import MyPages from 'components/user/MyPages';
import Edit from 'components/user/Edit';

describe('Users pages', () => {
    it('should render User mypages', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });

    it('should render User Edit', () => {
        const wrapper = shallowMount(Edit);
        expect(wrapper).not.toBeNull();
    });
});