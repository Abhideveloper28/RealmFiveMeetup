# README

* Ruby version : '2.5.3'

* Rails version : '5.2.3'

* Database : Postgres

App Details :

This app stores Users and the Groups they attend. Users have first names and last names.
Groups have a name. Users can attend multiple groups and have roles in each group. The roles
are: Organizer, Presenter, Participant.

The app take a CSV file upload in a web UI to create a Group and add User in that.

To run the app on local here are the steps :

1. Clone the app.
2. Set your database.yml
3. Run bundle install.
4. rake db:create
5. rake db:migrate
6. rake db:seed *optional (If you want to create some dummy data.)
7. Start rails server (rails s)


Heroku URL : https://peaceful-stream-42157.herokuapp.com/
