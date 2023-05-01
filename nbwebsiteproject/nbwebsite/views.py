
from django.shortcuts import render
from django.http import HttpResponseRedirect
from .forms import MenuleveoneForm, SmenuleveloneForm
from django.contrib import messages
# Create your views here.

def Index(request):
    return render(request, "index.html", {})

def About(request):
    return render(request, "about.html", {})

def Team(request):
    return render(request, "team.html", {})

def Services(request):
    return render(request, "services.html", {})

def Testimonials(request):
    return render(request, "testimonials.html", {})

def Pricing(request):
    return render(request, "pricing.html", {})

def Portfolio(request):
    return render(request, "portfolio.html", {})

def Contact(request):
    return render(request, "contact.html", {})

def Blog(request):
    return render(request, "blog.html", {})

def Blog_Single(request):
    return render(request, "blog-single.html", {})

def Portfolio_Details(request):
    return render(request, "portfolio-details.html", {})

#===================FORMS VIEW==============================
def menuform(request):
    if request.method == "POST":
        form = MenuleveoneForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Form sent successfully!")
            return HttpResponseRedirect('/')
        else:
            return render(request, "nbmenu.html", {"form": form})
    else:
        form = MenuleveoneForm()
        return render(request, "nbmenu.html", {'form': form})
    
def nbsmenuform(request):
    if request.method == "POST":
        form = SmenuleveloneForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Form is successfully saved!")
            return HttpResponseRedirect('/')
        else:
            return render(request, "nbsubmenu.html", {"form": form})
    else:
        form = SmenuleveloneForm()
        return render(request, "nbsubmenu.html", {"form": form})
