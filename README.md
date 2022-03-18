# Frontend Mentor - Entertainment web app solution

This is a solution to the [Entertainment web app challenge on Frontend Mentor](https://www.frontendmentor.io/challenges/entertainment-web-app-J-UhgAW1X). Frontend Mentor challenges help you improve your coding skills by building realistic project.

## Table of contents

- [Overview](#overview)
  - [The challenge](#the-challenge)
  - [Screenshot](#screenshot)
  - [Links](#links)
- [My process](#my-process)
  - [Built with](#built-with)
  - [What I learned](#what-i-learned)
  - [Continued development](#continued-development)
  - [Useful resources](#useful-resources)
- [Author](#author)
- [Acknowledgments](#acknowledgments)

**Note: Delete this note and update the table of contents based on what sections you keep.**

## Overview

### The challenge

Users should be able to:

- View the optimal layout for the app depending on their device's screen size
- See hover states for all interactive elements on the page
- Navigate between Home, Movies, TV Series, and Bookmarked Shows pages
- Add/Remove bookmarks from all movies and TV series
- Search for relevant shows on all pages
- **Bonus**: Build this project as a full-stack application
- **Bonus**: If you're building a full-stack app, we provide authentication screen (sign-up/login) designs if you'd like to create an auth flow

### Screenshot

![](./screenshot.jpg)
[FireShot](https://getfireshot.com/) to take the screenshot. FireShot has a free option, so you don't need to purchase it. 

### Links

- Solution URL: [Add solution URL here](https://your-solution-url.com)
- Live Site URL: [Add live site URL here](https://your-live-site-url.com)

## My process

### Built with

- Semantic HTML5 markup
- CSS custom properties
- Flexbox
- CSS Grid
- Mobile-first workflow
- [Tailwindcss](https://tailwindcss.com/docs/installation) - For styles

## What I learned

### Running Rails with Foreman

[Found out how Rubymine can run with foreman. Blogged about it.](https://dev.to/notapatch/rubymine-running-rails-with-foreman-363a)

### Focus and Active States
- Focus state is where the keyboard input will go
- Active state is where the mouse input will go

1. By default active and focus are both off
2. When you tab to cycle through focusable elements they will enter :focus (without active)
3. When you click on a non-focusable element, it enters :active (without focus)
4. When you click on a focusable element it enters :active:focus (active and focus simultatneously)

[Stackoverflow](https://stackoverflow.com/a/33100369/1511504)

### CSS Naming variables by purpose

[Article about how they named their css variables](https://engineering.monday.com/how-we-stopped-using-color-names-and-move-to-purpose-naming/)
I wanted to get a "purpose" naming system to reduce the time to name things and avoiding redesigns during the application.
I can work through the Figma file and making sure I have a color variable for everything and see how it goes.

#### References
[Common css color variables properties theming](https://joshuatz.com/posts/2021/common-css-color-variables-properties-theming/)

### == Comparison_object alias: eql?

Returns true if comparison_object is the same exact object, or comparison_object is of the same type and self has an ID and it is equal to comparison_object.id.

Note that new records are different from any other record by definition, unless the other record is the receiver itself. Besides, if you fetch existing records with select and leave the ID out, you're on your own, this predicate will return false.

Note also that destroying a record preserves its ID in the model instance, so deleted models are still comparable.

See: [==(comparison_object)](https://api.rubyonrails.org/classes/ActiveRecord/Core.html#method-i-3D-3D)

### Roles

Introducing roles into the application there are two obvious options:
1. User class having an enum 

```ruby
# db/migration/..
class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 0 #The default role will be the one set at 0 in user.rb
  end
end

# app/models/user.rb
class User
  enum role: { customer: 0, admin: 1 }, suffix: true
end
```

2. [Rolify - allows you to add multiple roles to a user](https://github.com/RolifyCommunity/rolify)


### ActiveStorage variants use image_processing gem for variants

You can happily use ActiveStorage without knowing about the image_processing gem. However, as soon as you 
want to change an image in some manner, say size, then ActiveStorage expects the image_processing gem to 
be there and work. If it isn't it throws an exception.

Rails 6 used Mini Magick but Rails 7 prefers vips [because it's faster and requires less memory to run](https://discuss.rubyonrails.org/t/make-vips-the-recommended-default-variant-processor-for-active-storage/78368).
Installing vips is simple enough but it can take a while (on my Macbook pro 2014 there were a number of dependencies to install and it took several hours).

```bash
brew install vips
```

Until the vips installation is complete you can keep using the older default Mini Magick by adding in a configuration.

```ruby
# application.rb
config.active_storage.variant_processor = :mini_magick
```

Reference
[Rails ActiveStorage::Variant](https://edgeapi.rubyonrails.org/classes/ActiveStorage/Variant.html)


With that done you can set variants on your images. An example used in this project.

```ruby
class Show
  ...
  has_one_attached :regular_image do |attachable|
    attachable.variant :large, resize_to_limit: [560, 348]
    attachable.variant :medium, resize_to_limit: [440, 280]
    attachable.variant :small, resize_to_limit: [323, 220]
  end
end
```

Using the variant

```erbruby
  <%= image_tag @show.regular_image.variant(:medium) %>
```

### What I forgot?

 - Important things I forgot and had to look up

### Width vs Maxwidth

Width
  - Width on block element stops it stretching out to the parent width 
  - Problem is that when browser window smaller than set width as it causes the browser to add horizontal scroll bars 

Max-width
  - Width on the block adapts to the size of the browser window

How width and max-width relate
- if width > max-width use max-width
- if max-width > width use width

### Combine width and max-width

```css
.selector {
  width: 100%;
  max-width: 512px;
}
```
 - Width of 100% by default
 - If 100% width exceeds max-width the the width then the width is set to max-width

In the example we are width 100% until we reach 512px and we grow no more.

### CSS

 - max-height: 100% - the height is 100% of the containing box.

### Continued development

TODO

### Useful resources

- [Complete Guide To Managing User Permissions In Rails Apps](https://www.honeybadger.io/blog/complete-guide-to-managing-user-permissions-in-rails-apps/) - This helped me for XYZ reason. I really liked this pattern and will use it going forward.
  - Roll your own permissions system rather than picking `Pundit` off the shelf. I hope it will allow me to understand Pundit better and if it goes really well may be an option on a small project.

## Author

TODO
- Website - [Add your name here](https://www.your-site.com)
- Frontend Mentor - [@yourusername](https://www.frontendmentor.io/profile/yourusername)
- Twitter - [@yourusername](https://www.twitter.com/yourusername)

## Acknowledgments

TODO