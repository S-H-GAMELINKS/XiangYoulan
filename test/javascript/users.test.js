import { shallowMount } from "@vue/test-utils";
import MyPages from 'components/user/MyPages';
import Edit from 'components/user/Edit';
import SignIn from 'components/user/SignIn';
import SignUp from 'components/user/SignUp';
import UsersShow from 'components/user/Show';

describe('Users pages', () => {
    it('should render User mypages', () => {
        const wrapper = shallowMount(MyPages);
        expect(wrapper).not.toBeNull();
    });

    it('should render User Edit', () => {
        const wrapper = shallowMount(Edit);
        expect(wrapper).not.toBeNull();
    });

    it('should render User SignIn', () => {
        const wrapper = shallowMount(SignIn);
        expect(wrapper).not.toBeNull();
    });

    it('should render User SignUp', () => {
        const wrapper = shallowMount(SignUp);
        expect(wrapper).not.toBeNull();
    });

    it('should render User Show page', () => {

        const $route = {
            path: '/users/1'
        }

        const wrapper = shallowMount(UsersShow, {
            mocks: {
              $route
            }
        });
        expect(wrapper).not.toBeNull();
    });
});