# Rails 7 Saas Boilerplate
Create a sass app using rails 7 really faster than normal.

## The motivation
Every time I had to start a new project I always had to install almost the same gems and have it configured. So the idea of this project is to have a starting point to build anything I need focusing only on the business rules and actual code instead of doing repetitive boring tasks.

## Implemented Features
- Regular authentication using `devise`.
- API authentication using `devise/doorkeeper`.
- Authorization using `pundit`.
- Usage of Vite to handle assets/js/css files on the `frontend` folder.
- Usage of Flowbite/Tailwind to facilitate the implementation of beautiful components.
- Usage of `view_component` to create components with `stimulus/hotwire` to feel like a react project.
- Specs ready to go with `rspec`, `factory_bot`, `shoulda_matcher` and `capybara`.
- A set of base components to just use on the project frontend instead of have to write a lot of the same code always. (You can check the components visiting the `/lookbook` route after setup the project on your local environment).
- CI using github actions.

## The Big difference
This project has a few differences from a regular new Rails project the main ones are:

1. Usage of the `vite_rails` gem to handle css/js/assets instead of the `sprockets`
   1. All js/css/images/etc files should be created inside the `app/frontend` folder. This way vite will process it accordingly.
   2. Vite also provides helpers to facilitate the usage of our assets on the app
2. Usage of `view_component` gem instead of using Rails partials.
   1. I love the way we can write logic inside `components` and getting it working with `stimulus/hotwire` is great and overrides the need for some js library like `react`
   2. In the `development` environment we have the `lookbook` to play with our `components` and check how they work.
   3. All `components` must be created inside the `app/views/components` folder.
   4. To create a new `component` you can just run: `rails g view_component name_of_component`
3. It already came with authentication and authorization, which is being handled by devise/doorkeeper/pundit.
4. It has specs being configured and executed by rspec/factory_bot/capybara.

## Project Structure
The structure is pretty much the same as regular Rails MVC, the big difference is that we should store all our js/css/assets files inside `app/frontend` folder instead of the `app/assets` folder.

- Controllers
  - I've created 3 folders on the controllers to better organize the code:
    - admin folder must contain all the controllers related to admin side of the project
    - app folder must contain all the controllers that our logged_in users will use (this will be the actual app)
    - storefront folder must contain all controllers that can contain public pages, like the home page, the contact page or something like that.
  - The idea is that we can organize our code in a way which just taking a look we can see which that controller is being used.
- Frontend
  - This is where all our assets will leave, basically almost all js/css/images/etc will leave inside this folder to processed by vite.
- Views/Components
  - All our `view_components` must be created inside the `app/views/components` folder this way vite can process all the js/css/assets files that may cohexist with the component itself. This way we can better organize our code.
  - Since `components` are code that relates to `views` I have followed the suggestion of the `view_component-contrib` to store the components inside the `views` folder.
  
The rest of the folders/structure is pretty much what the base rails gives to us.

