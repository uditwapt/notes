
http://docs.angularjs.org/tutorial

* client-side data binding
* dependency injection
* listeners to data without dom manipulation
* testing


Once finished

* create dynamic application
* diferences between Angular and common JS frameworks.
* data binding in AngularJS
* angular-seed to boot-strap projects
* create and run tests
* resources for learning about AngularJS

unit and end-to-end tests

Getting started document - shorter introduction

Requires git

Requires node.js 0.8 (latest 0.10)

karma - testing

git clone git://github.com/angular/angular-phonecat.git


Step 0 bootstrapping
====================

http://docs.angularjs.org/tutorial/step_00 #_

git checkout -f step-0

* ng-app directive

  <html ng-app>

  ng-app - as attribute
  ngApp - as directive name

  root element of application

* angularjs script tag

  <script src="lib/angular/angular.js">

  also registers callback
    angular looks for ngApp directive
      bootstrap app

* templating

  Nothing here {{'yet' + '!'}}

  not one time insert

  efficient continuous updates whenver expression changes

  angular expression
    executed in context of current model scope
    not evaluated in global context (window)

Bootstrapping AngularJS apps
----------------------------

Two ways to bootstrap app
  imperative
  manual

during app bootstrap
  injector is created
  injector creates root scope that is context for model
  compiles dom at ngApp root eleemnt
    processes directives and bindings along the way

after bootstrap
  wait for events
  if event
    if model change
      update affected bindings

template          model
  html ng-app -->   root scope

implicit scope declaration

What are all these fiels in my working directory?
-------------------------------------------------

from angular-seed project, but
  removed example app
  added phone images
  added phone data files
  added twitter bootstrap files

Static templates
=============================================

http://docs.angularjs.org/tutorial/step_01 __

git checkout -f step-1

Angular templates
=============================================

http://docs.angularjs.org/tutorial/step_01 __

Encourages MVC design pattern

View and template
-----------------

view is projection of model through template
  when model changes, angular refreshes binding points, updating view

ng-controller="PhoneListCtrl"
  ng-repeat="phone in phones"
    {{phone.name}
    {{phone.snippet}}

Controller instead of Ctrl?

Angular repeater

ng-app has root scope

ng-controller has phone list ctrl scope

ng-repeat has repeater scope


Model and controller
--------------------

    function PhoneListController($scope){
      $scope.phones = [
        {name: 'Nexus', snippet: ''}
      ]
    }

controler is not yet doing very much controlling

provides context for data model???

is establishing data-binding between model and view

* phone list controller - matches ngController

* phone data is attached to scope injected into controller function
  - controller scope is prototypical descendant of root scope
    - available to all bindings in ng-controller tag

  - scopes are crucial!

  - scopes are... injected?

Tests
-----

CHROME_BIN=/usr/bin/chromium-browser ./scripts/test.sh __


Filtering repeaters
===================

http://docs.angularjs.org/tutorial/step_03 __

ng-repeat="phone in phones | filter:query"

$filter function

* data binding - angular binds the name of the input box to a variable of the
  same name in the data model.

what's getting filtered? The phone name?

* filter function creates new array

Tests
-----

end to end test

browser().navigateTo()

repeater(selector)


CHROME_BIN=/usr/bin/chromium-browser ./scripts/e2e-test.sh





