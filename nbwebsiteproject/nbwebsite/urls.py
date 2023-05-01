from django.urls import path

from . import views

urlpatterns = [
    path('about/', views.About, name='about'),
    path('services/', views.Services, name='services'),
    path('team/', views.Team, name='team'),
    path('testimonials/', views.Testimonials, name='testimonials'),
    path('pricing/', views.Pricing, name='pricing'),
    path('portfolio/', views.Portfolio, name='portfolio'),
    path('contact/', views.Contact, name='contact'),
    path('blog/', views.Blog, name='blog'),
    path('blog-single/', views.Blog_Single, name='blog-single'),
    path('portfolio/portfolio-details/', views.Portfolio_Details, name='portfolio-details'),
    path('nbmenuform/', views.menuform, name='nbmenuform'),
    path('nbsubmenu/', views.nbsmenuform, name='nbsubmenu'),
    path('', views.Index, name='index'),
]