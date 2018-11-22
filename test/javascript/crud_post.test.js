import Index from 'components/post/Index';
import Show from 'components/post/Show';
import Create from 'components/post/Create';
import Edit from 'components/post/Edit';

describe('CRUD Post', () => {
    it('should render Index', () => {
        const wrapper = mount(Index);
        expect(wrapper.isVueInstance()).toBeTruthy()
    });
});