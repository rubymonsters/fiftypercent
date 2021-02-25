# 💬 [50 Percent](https://50prozent.speakerinnen.org)

__[50 Percent](https://50prozent.speakerinnen.org) wants to document how much women* are misrepresented as speakers at conferences, on panels, in talkshows and many other public events. At each event we count male and female speakers and publish the percentage of each - with your help!__

It is a Rails application maintained by the rubymonstas.

See also: [Speakerinnen](https://speakerinnen.org) and the [blog](https://blog.speakerinnen.org)

[![Build Status](https://travis-ci.com/rubymonsters/fiftypercent.svg?branch=master)](https://travis-ci.com/rubymonsters/fiftypercent)


## Development setup

Time to open your Terminal! 👩‍💻

1. Clone the project `git clone git@github.com:rubymonsters/fiftypercent.git`
2. Switch to the project folder `cd fiftypercent`
3. Create your own database file `cp config/database_example.yml config/database.yml`
4. Install Postgres for the database following [their guide for your operating system](https://www.postgresql.org/download/)
    - If necessary, set up a new user [as described in this guide](https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps--2):
    ```
    sudo su - postgres # log in with the postgres user
    psql # enter the Postgres database
    CREATE ROLE yourusername; # create a new user
    ALTER ROLE yourusername WITH LOGIN CREATEDB; # give necessary rights to database user
    ```
5. Make sure you have the correct Ruby version installed. We recommend [Ruby Version Manager (RVM)](https://rvm.io/) (you can also use [rbenv](https://github.com/rbenv/rbenv), but setup is more difficult). Also best uninstall any Ruby installation from your operating system as it might conflict. Run these commands to install RVM and switch to Ruby 2.4.2 which we use:
    ```
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -sSL https://get.rvm.io | bash -s stable
    rvm install "ruby-2.4.2"
    ```
6. Install bundler `gem install bundler`
7. Install dependencies using `bundle install`
8. Create the database
    ```
    rake db:create
    rake db:migrate
    ```
9. Start the server with `rails s`
10. Open your browser and go to http://0.0.0.0:3000

**🎉 Now you are set up to contribute code! :)**

- Once you made changes, you can run the tests with `rake test`.
- The code can be deployed to production using `cap production deploy`. If you want to deploy a specific branch, use `cap production deploy BRANCH=branchname`
