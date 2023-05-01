from django import forms
from .models import Menulevelone
from .models import Smenulevelone


class MenuleveoneForm(forms.ModelForm):
    nbmenudesc = forms.CharField(label='Menu description', min_length=5, max_length=25,
                                 error_messages={'required': 'Menu description cannot be empty'},
                                 required=True
                                 )
    class Meta:
        model = Menulevelone
        fields = ('nbmenudesc',)

class SmenuleveloneForm(forms.ModelForm):
    nbsubmenuone = forms.CharField(label='Sub menu level', min_length=4, max_length=25,
                                   error_messages={'required': 'Sub menu description is required'},
                                   required=True
                                   )
    menulevelone = forms.IntegerField(label='Sub menu level',
                                   error_messages={'required': 'Sub menu description is required'},
                                   required=True
                                   )
    class Meta:
        model = Smenulevelone
        fields = ('nbsubmenuone', 'menulevelone')
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            if 'nbmenudesc' in self.data:
                nbmenudesc = int(self.data.get('nbmenudesc'))
                self.fields['nbsubmenuone'].queryset = Smenulevelone.objects.filter(nbmenudesc=nbmenudesc).order_by('name')
