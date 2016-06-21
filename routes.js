Router.configure({
    layoutTemplate: 'layout',
    loadingTemplate: 'loading',
    notFoundTemplate: 'notFound'
});

Router.route('home', {
    path: '/',
    yieldTemplates: {
        'header': {to: 'header'},
        'slideshow': {to: 'slideshow'},
        'footer': {to: 'footer'}
    }
});

Router.route('blog', {
    path: '/blog',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('downloads', {
    path: '/resources/downloads',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('events', {
    path: '/events',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('login', {
    path: '/login',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('register', {
    path: '/register',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

UI.registerHelper('CurrentRouteName', function() {
    return Router.current()?Router.current().route.getName():'';
});
