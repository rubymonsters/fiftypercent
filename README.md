[![Build Status](https://travis-ci.com/rubymonsters/fiftypercent.svg?branch=master)](https://travis-ci.com/rubymonsters/fiftypercent)

# Welcome to fiftypercent \o/

*It is a rails application. Maintained by the rubymonstas.*

Blog:
https://blog.speakerinnen.org

Fiftypercent:
https://50prozent.speakerinnen.org/



**How to set it up:**

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:seed`


**to run the tests:**

`rake test`

**deploy:**

`cap production deploy`

**deploy branch:**

`cap production deploy BRANCH=anja-remove-inuit`

**to see the page locally:**

`rails s`

**to see the 50percent page:**

http://localhost:3000

**to see the blog**

find your hosts file
_on a linux:_
`sudo vim /etc/hosts`

_on a mac:_
`sudo vim /private/etc/hosts`

here you add:
`127.0.0.1       blog.local.test`

http://blog.local.test:3000/

