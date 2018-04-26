# Elegant CMS Client Example
The headless content management system for people who like elegance in everything they do.

### Overview ###
*Purpose*
This application hopes to give a general starting point for how to connect, authorize, load and parse contents from your API endpoint on Elegant CMS.
For a quick reference you can find the meat of this example in the [HomeController](./app/controllers/home_controller.rb)
*Demo*
You can find our own live demo running at [http://elegant-cms-consumer.herokuapp.com]

### Setup ###
*ENV Vars*
- ELEGANT_CMS_URL=http://api.elegantcms.io/api/v1/contents
- ELEGANT_CMS_TOKEN=<Some JWT token unique to your api key> You can find this in your elegant desktop under the _Settings_ tab in the left (App) menu.

### Usage ###
*Localhost*
This should run out of the box on Localhost provided you give it valid ENV configuraion vars from an Elegant CMS account.
*Heroku*
You can make a new Hobby sized project and point at this repo. Deploy master and add the Elegant CMS addon. Provisioning the addon will automatically assign your ENV Vars so there is nothing more to do!

