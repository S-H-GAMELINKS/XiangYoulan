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
});