# Workshops application

Sem:
Fixes of the requested issues:
Deployed and lunched application locally
Fixing user registration and authentication

Project hosting: https://workshops-sem.herokuapp.com

### Issues to solve:

1. There are a few missing fields on the `User` model. Make sure `spec/models/user_spec.rb passes.`

2. Make sure settings for [devise](https://github.com/plataformatec/devise) are
   configured properly.  If they aren’t, most of the controller specs will fail: 
  * Most of the configuration changes require the server to be restarted.
  * At some point **you'll have to overwrite the default devise views** - you can find all the required info in the gem readme.
  
3. Check `spec/controllers/categories_controller_spec.rb` - there should be a
   couple errors on actions checking admin presence.

4. Next up: `Product` model and `spec/models/product_spec.rb`. Play with validations a bit, calculate average rating and you'll be good to go.

5. Fix specs for `Category` model.

6. Fix specs for `Review` model.

7. You'll have to deal with `ProductsController`. Again, you'll have to check for permissions. Only a product owner should be able to make changes. Make sure to give the user a proper message when they try to perform forbidden actions.

8. Make sure `ReviewDecorator` is used properly, There's one action which needs to be declared there. See `spec/decorators/review_decorator_spec.rb` for details.

9. Check if each review is assigned to user who wrote it.

10. If some actions (like links to edit a page, create a new one) are not allowed for a particular user then please hide them in a template (for example with `if`).

11. In navigation bar insert links for guest users to login / signup and for users that are already logged in - to logout.

12. Don't forget to check if application works in the browser :).

13. Unleash your design skills. Add some CSS to the application to make it prettier (we won't say it's ugly, but you know, it's not a beauty [YET!]). Please use [Bootstrap 3](http://getbootstrap.com/css/) for styling, which is already added to application. Psss! Don't forget about styling `devise` views :).

14. Create user profile page (using Boostrap 3). Use your imagination about what should go there. You can start with name, email, etc.

15. On user profile list 5 last user's reviews with formated date (dd-mm-yy).

16. Fill `seeds.rb` with 5 accounts for user and one admin account to login and example category with products and reviews.

17. Make sure your project is available on Heroku with **seeds data**. - test deploying to Heroku