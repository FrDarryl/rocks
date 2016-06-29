Router.configure({
    layoutTemplate: 'layout',
    loadingTemplate: 'loading',
    notFoundTemplate: 'notFound'
});

Router.route('about', {
    path: '/about',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('agendaeMinutes', {
    path: '/resources/agendaeminutes',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('biddingPrayers', {
    path: '/resources/biddingprayers',
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

Router.route('home', {
    path: '/',
    yieldTemplates: {
        'header': {to: 'header'},
        'slideshow': {to: 'slideshow'},
        'footer': {to: 'footer'}
    }
});

Router.route('liturgies', {
    path: '/events/liturgies',
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

Router.route('meetings', {
    path: '/events/meetings',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('music', {
    path: '/resources/music',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

Router.route('newsletters', {
    path: '/resources/newsletters',
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

Router.route('rotas', {
    path: '/resources/rotas',
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

Router.route('socials', {
    path: '/events/socials',
    yieldTemplates: {
        'header': {to: 'header'},
        'footer': {to: 'footer'}
    }
});

UI.registerHelper('CurrentRouteName', function() {
    return Router.current()?Router.current().route.getName():'';
});
