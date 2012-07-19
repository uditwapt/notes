#-----------------------------------------------------------------------
# Ruby Library

styleguide = KSS::Parser.new(Rails.root.join('public/stylesheets'))

styleguide.section(id)
  .description
  .modifiers.first
    .name
    .class_name
    .description

#-----------------------------------------------------------------------
# kss/example/

# kss.js

=begin
    styleguide_block '1.1' do
      <button class="$modifier_class">Example Button</button>
    end
=end

def styleguide_block(section, &block)
  @section = @styleguide.section(section)
  @example_html = capture{ block.call }
  @_out_buf << erb(:_styleguide_block)
end

=begin
<div class="styleguide-example">

  <h3><%= @section.section %> <em><%= @section.filename %></em></h3>
  <div class="styleguide-description">
    <p><%= @section.description %></p>
    <% if @section.modifiers.any? %>
      <ul class="styleguide-modifier">
        <% @section.modifiers.each do |modifier| %>
          <li><strong><%= modifier.name %></strong> - <%= modifier.description %></li>
        <% end %>
      </ul>
    <% end %>
  </div>
  <div class="styleguide-element">
    <%= @example_html %>
  </div>
  <% @section.modifiers.each do |modifier| %>
    <div class="styleguide-element styleguide-modifier">
      <span class="styleguide-modifier-name"><%= modifier.name %></span>
      <%= @example_html.sub('$modifier_class', " #{modifier.class_name}") %>
    </div>
  <% end %>

</div>
=end

#-----------------------------------------------------------------------
# specs

# documentation for 2.1 applies to 2.1.3

# use // for scss?

# three parts
  # description
  # modifier classes and pseudo classes that modify the element
  # reference to element's position in styleguide

# description section
  # refer to css rules as <eleemnt#id.class:pseudo>

  # Experinmental
  # Deprecated

# styleguide section
  # can point to entire sections, a portion of a section, or a specific example

  # note example:
    # No styleguide reference.

# preprocessor helper document
  # description
  # parameters
  # compatibility
    # // Compatibility untested.

#-----------------------------------------------------------------------
# styleguide

# includes all the css, javascript and layout

# numbered sections

# generated templates reference styleguide section and example html
# modified states are generated automatically




