from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^register$', 'maiku.users.views.register', name='register'),
    url(r'^login$', 'maiku.users.views.login', name='login'),
    url(r'feed$', 'maiku.views.feed', name='feed'),

    # Examples:
    # url(r'^$', 'maiku.views.home', name='home'),
    # url(r'^maiku/', include('maiku.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
