import { shallowMount } from "@vue/test-utils";
import MyPages from 'components/users/MyPages';

describe('Users pages', () => {
    it('should render User mypages', () => {
        const wrapper = shallowMount(Index);
        expect(wrapper).not.toBeNull();
    });
});