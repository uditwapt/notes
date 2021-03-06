Understanding jQuery UI widgets: A tutorial
========================================================================

* http://bililite.com/blog/understanding-jquery-ui-widgets-a-tutorial/

Updated for jQuery 1.8
------------------------------------------------------------------------

* In jQueryUI, widget refers to a class associated with HTML elements.
* Not all jQueryUI plugins use $.widget.


Modifying Elements: Plugins
------------------------------------------------------------------------

* plugin syntax

        $.fn.green = function(){ return this.css(background: 'green') /* a jquery element */ } // define
        $('.target').green(); // invoke

* What's missing
  - No way to keep plugin associated with element, so we can do something
    with it later. Example: $('.target').off().

  - No way to associate state with element. Example: $('.target').darker()


Keeping state in plugins
------------------------------------------------------------------------

* Example:

        $.fn.green2 = function(){
          return this.each(function(){
            if (! this.green) this.green = new Green($(this));
            this.green.setLevel(15)
          });
        }
        
        $.fn.off = function(){ }...
        
        function Green(target){
          this.target = target;
        }

* Con: pollutes the $.fn namespace.

* Solution: add a string to specify the function to call

        $.fn.green2 = function(which){
          return this.each(function(){
            if (which === undefined){
              // initial call
            }
            else if (which == 'off'){
            }
            // ...
          }
        }

The problems with associating an object with a plugin
------------------------------------------------------------------------

* Problem 1: circular reference

        this.green = new Green($this) // links js object to dom element
        this.target = target // links dom element to js object

  - causes memory leaks in browsers because there are usually different
    garbage collectors for dom and js objects.

* Possible solution for circular reference. Use $.fn.data.
  - will store JS object in dom element.
  - Con: hides underlying program logic.
  - Constantly reimplementing a pattern reflects a weakness in JS.
    - need to abstract and automate it

Solving the problem: $.widget
------------------------------------------------------------------------

* $.widget
  - creates plugin
  - associates js class to plugin
  - ties instance of class to each element

* for constructor, you need prototype object with relevant methods
  - _create for construction
  - _init for construction and reinitializing
  - destroy for removal

  - $.widget predefines these as empty functions

  - element is the associated jQuery object

* _method is pseudo-private.

* Example:

        Green3 = {
          _init: function(){ this.setLevel(15) },
          getLevel: function{ },
          // ...
          
          off: function(){
            // ...
            this.destroy(); // uses the predefined function !!!
          }
        }
    
        $.widget(ui.green3, Green3);

  - no dom or memory-related bookkeeping.
  - name must have namespace "ns.green", but the namespace is fake.
  - The constructor function $.ns.green is never used.
  - You can use "ui" as namespace.

Manipulating widgets
------------------------------------------------------------------------

* functions that don't start with underscore are exposed automatically.

* setters
  - Automatically chainable.
  - no need to rerutn the jQuery object.

* getters
  - break the chain.
  - must return something.

* jquery determines if a function is a setter or getter depending on its return value.
* functions that return undefined are setters, everything else getters.

* passing arguments: $('.target').green3('setLevel', 5);

Data for each widget
------------------------------------------------------------------------

* Green3.level are used for every green3 object.

* Use this.options for per-widget data.

* Think of options as initial values. These are stored in widget's prototype.

        var Green4 = {
          setLevel: function(x){
            this.options.level = level;
          }
          
          // defaults
          options: {
            level: 15,
            greenlevels: []
          }
        }
        
        $('.target'),green4({level: 8})



Callbacks, or, keeping the lines of communications open
------------------------------------------------------------------------

* Tightly coupled solution:

          setLevel: function(x){
            var callback = this.options.change;
            if ($.isFunction(callback) callback(level))
          }

* Loosely coupled solution (Observer)

          setLevel: function(x){
            this.element.trigger('green5change', level);
          }
        
          $('.target').bind('green5change', function(){})

* $.widget allows both forms with the _trigger method.

          this._trigger(type, event, data)
        
          setLevel: function(x){
            this._trigger('change', 0, level);
          }

Involving the mouse
------------------------------------------------------------------------

* Example:

        $.widget('ui.green6', $.ui.mouse, Green6)

* Override mouse function (_mouseStart) to do something
* Call this._mouseInit in your this._init.
* Call this._mouseDestroy in your this.destroy
* Mouse defaults are automagically included.
