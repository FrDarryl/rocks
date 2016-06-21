Router.configure({
    layoutTemplate: 'layout',
    loadingTemplate: 'loading',
    notFoundTemplate: 'notFound'
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

Router.route('home', {
    path: '/',
    yieldTemplates: {
        'header': {to: 'header'},
        'slideshow': {to: 'slideshow'},
        'footer': {to: 'footer'}
    }
});

Router.route('about', {
    path: '/about',
    yieldTemplates: {
        'header': {to: 'header'},
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

Router.route('contact', {
    path: '/contact',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('search', {
    path: '/search',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('liturgyEvents', {
    path: '/events/liturgies',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('meetingEvents', {
    path: '/events/meetings',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('socialEvents', {
    path: '/events/socials',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('meetingResources', {
    path: '/resources/meetings',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('musicResources', {
    path: '/resources/music',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('newsletterResources', {
    path: '/resources/newsletters',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('rotaResources', {
    path: '/resources/rotas',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

UI.registerHelper('CurrentRouteName', function() {
    return Router.current()?Router.current().route.getName():'';
});
