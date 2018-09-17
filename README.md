# Booking Calendar

## Todo

- Bug: nach Registrierung:

2018-09-17T08:22:48.406300+00:00 heroku[router]: at=info method=GET path= "/?locale=de" host=arloff.herokuapp.com request_id=b2b09400-a18b-4c41-89fa-88f83a4b9788 fwd="90.186.91.87" dyno=web.1 connect=0ms service=23ms status=500 bytes=1827 protocol=https
2018-09-17T08:22:48.385690+00:00 app[web.1]: I, [2018-09-17T08:22:48.385575 #4]  INFO -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788] Started GET "/?locale=de" for 90.186.91.87 at 2018-09-17 08:22:48 +0000
2018-09-17T08:22:48.386523+00:00 app[web.1]: I, [2018-09-17T08:22:48.386454 #4]  INFO -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788] Processing by BookingsController#index as HTML
2018-09-17T08:22:48.386641+00:00 app[web.1]: I, [2018-09-17T08:22:48.386562 #4]  INFO -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788]   Parameters: {"locale"=>"de"}
2018-09-17T08:22:48.396732+00:00 app[web.1]: D, [2018-09-17T08:22:48.396588 #4] DEBUG -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788]   User Load (4.6ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["id", 1], ["LIMIT", 1]]
2018-09-17T08:22:48.399955+00:00 app[web.1]: I, [2018-09-17T08:22:48.399864 #4]  INFO -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788] Completed 500 Internal Server Error in 13ms (ActiveRecord: 4.6ms)
2018-09-17T08:22:48.404077+00:00 app[web.1]: F, [2018-09-17T08:22:48.403954 #4] FATAL -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788]
2018-09-17T08:22:48.404171+00:00 app[web.1]: F, [2018-09-17T08:22:48.404083 #4] FATAL -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788] CanCan::AccessDenied (You are not authorized to access this page.):
2018-09-17T08:22:48.404274+00:00 app[web.1]: F, [2018-09-17T08:22:48.404168 #4] FATAL -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788]
2018-09-17T08:22:48.404490+00:00 app[web.1]: F, [2018-09-17T08:22:48.404359 #4] FATAL -- : [b2b09400-a18b-4c41-89fa-88f83a4b9788] vendor/bundle/ruby/2.5.0/gems/cancancan-2.2.0/lib/cancan/ability.rb:176:in `authorize!'

- default locale einsetzen de/bookings

- add Booking data to calendar overview
https://www.webascender.com/blog/rails-react-forms-validations-real-time-updates/
https://medium.com/quick-code/simple-rails-crud-app-with-react-frontend-using-react-rails-gem-b708b89a9419

### Deploying on heroku

### Check Heroku Warnings

remote: ###### WARNING:
remote:
remote:        Detecting rails configuration failed
remote:        set HEROKU_DEBUG_RAILS_RUNNER=1 to debug
remote:
remote: ###### WARNING:
remote:
remote:        We detected that some binary dependencies required to
remote:        use all the preview features of Active Storage are not
remote:        present on this system.
remote:
remote:        For more information please see:
remote:          https://devcenter.heroku.com/articles/active-storage-on-heroku
remote:

We recommend explicitly declaring how to boot your server process via a Procfile.
remote:        https://devcenter.heroku.com/articles/ruby-default-web-server




## Deploying on heroku

    heroku buildpacks:add 'https://github.com/heroku/heroku-buildpack-nodejs.git'
    heroku buildpacks:add 'https://github.com/heroku/heroku-buildpack-ruby.git'



### Database dumps

    https://devcenter.heroku.com/articles/heroku-postgres-import-export

    heroku pg:backups:capture
    heroku pg:backups:download

### Added BelkaLab Year Calendar
https://github.com/BelkaLab/react-yearly-calendar
http://code.belka.us/react-yearly-calendar/custom_classes/index.html

## Devise

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views


## React

added react with webpacker using this tutorial:

https://medium.com/react-on-rails/free-tutorial-how-to-use-react-with-webpacker-and-rails-5-1-92af8e8d9d63

<%= javascript_pack_tag 'hello_react' %> - heallo React works!
