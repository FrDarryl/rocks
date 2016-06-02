Router.configure({
    layoutTemplate: 'layout'
});

Router.route('/', {
    name: 'home',
    template: 'home'
});

Router.route('/blog', {
    name: 'blog',
//    template: 'blog'
});

Router.route('/login');

Router.route('/register');
