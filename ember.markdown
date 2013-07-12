Getting started

http://emberjs.com/guides/

starter kit


App = Ember.Application.create();

script type="text/x-handlebars"
  html inside

App.Router.map(function(){
  this.resource('about')
})

<script type="text/x-handlebars" id="about">
</script>

Outlet

{{outlet}}



{{#linkTo 'about'}}About{{/linkTo}}

url#/about
