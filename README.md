# Rush Hour (Project)


## Objectives

In this project, our object is to use Ruby, Sinatra, and ActiveRecord to build a web traffic tracking and analysis tool.

It will be an application that aggregates and analyzes visitor data from another website. A RushHour customer/client will embed JavaScript in their website that will gather and send their visitor data to our site. It is important to note that we will not be creating this JavaScript. Instead we will simulate the process of gathering and receiving data, which we will call a payload. Our job is to build an application that can accept the submission of these payloads, analyze the data submitted, and display it through a HTML interface.

We will use pre built payloads to simulate the gathered data from a customer/client's website. They will look like this:

```
payload = '{
  "url":"http://jumpstartlab.com/blog",
  "requestedAt":"2013-02-16 21:38:28 -0700",
  "respondedIn":37,
  "referredBy":"http://jumpstartlab.com",
  "requestType":"GET",
  "userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
  "resolutionWidth":"1920",
  "resolutionHeight":"1280",
  "ip":"63.29.38.211"
}'
```

The payloads are in a hash-like format called JSON [here](http://www.ruby-doc.org/stdlib-2.0/libdoc/json/rdoc/JSON.html).

RushHour will simulate sending these requests using a cURL command. This is a command we can run in our terminal that sends an HTTP request. You can checkout the details of the cURL command by running `curl --manual` in your terminal.

## Our Learning Goals during this project:

* Understand how web traffic works
* Dig into HTTP concepts including headers, referrers, and payload
* Design a normalized SQL-based relational database structure
* Use ActiveRecord to interface with the database from Ruby
* Practice fundamental database storage and retrieval
* Understand and practice HTTP verbs including GET, PUT, and POST
* Practice using fundamental HTML and CSS to create a usable web interface

## Project Members:

  * Brendan Dillon
  * Dan Broadbent
  * Raphael Barbo
