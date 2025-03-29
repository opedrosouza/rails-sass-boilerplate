# Rails 7 Saas Boilerplate
Create a sass app using rails 7 really faster than normal.

## The motivation
Every time I had to start a new project I always had to install almost the same gems and have it configured. So the idea of this project is to have a starting point to build anything I need focusing only on the business rules and actual code instead of doing repetitive boring tasks.

## Implemented Features
- Authentication using `devise`.
- Authorization using `pundit`.
- Usage of Vite to handle assets/js/css files on the `frontend` folder.
- Usage of Flowbite/Tailwind to facilitate the implementation of beautiful components.
- Specs ready to go with `rspec`, `factory_bot`, `shoulda_matcher` and `capybara`.
- CI using github actions.

## The Big difference
This project has a few differences from a regular new Rails project the main ones are:

1. Usage of the `vite_rails` gem to handle css/js/images assets instead of the `sprockets`
   1. All js/css/images/etc files should be created inside the `app/frontend` folder. This way vite will process it accordingly.
   2. Vite also provides helpers to facilitate the usage of our assets on the app
2. It came with pre configured authentication and authorization for users and admins, which is being handled by devise/pundit.
3. It has specs configured and executed by rspec/factory_bot/capybara.

## Project Structure
The structure is pretty much the same as regular Rails MVC, the big difference is that we should store all our js/css/assets files inside `app/frontend` folder instead of the `app/assets` folder.
