# Tea & Me

![languages](https://img.shields.io/github/languages/top/andilovetto/tea_and_me?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## Background and Description

*Tea & Me* is an API only application that provides tea lovers with a unique opportunity for exploring different types of tea and finding their new favorite! Subscribe for your next tea delivery with ease by providing your name, email and mailing address; cancel your subscription anytime. Customize your monthly deliveries to your liking -- your deliveries can come as often as every week and as little as once per month. We'll keep up with your tea subscription history, so your newest and oldest favorites are always a sweet click away! 


## Schema 
<img width="542" alt="Screenshot 2023-11-02 at 5 10 15 PM" src="https://github.com/andilovetto/tea_and_me/assets/128431917/d5c69731-b9e2-4735-be88-558520211469">


## Learning Goals

- Demonstrate a strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- Test Driven Development
- Clear documentation 



## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 3.2.2
- Rails Version 7.0.8

### Gems Utilized
- RSpec 
- Pry
- SimpleCov
- Shoulda-Matchers 
- Factory_Bot_Rails
- Faker
- Jsonapi-Serializer


## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:andilovetto/tea_and_me.git
```

- using https <br>
```shell
$ git clone https://github.com/andilovetto/tea_and_me
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory:<br>
In terminal, use `$cd` to navigate to the backend Application project directory.

```shell
$ cd tea_and_me
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).

```shell
$ bundle install
Using rake 13.0.6
Using concurrent-ruby 1.1.9
Using i18n 1.9.1
Using minitest 5.15.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using activesupport 5.2.6
Using builder 3.2.4
Using erubi 1.10.0
Using mini_portile2 2.7.1
Using racc 1.6.0
Using nokogiri 1.13.1
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.13.0
Using rails-html-sanitizer 1.4.2
Using actionview 5.2.6
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 5.2.6
Using nio4r 2.5.8
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.5
Using actioncable 5.2.6
Using globalid 1.0.0
Using activejob 5.2.6
Using mini_mime 1.1.2
Using mail 2.7.1
Using actionmailer 5.2.6
Using activemodel 5.2.6
Using arel 9.0.0
Using activerecord 5.2.6
Using marcel 1.0.2
Using activestorage 5.2.6
Using msgpack 1.4.4
Using bootsnap 1.10.3
Using bundler 2.1.4
Using byebug 11.1.3
Using coderay 1.1.3
Using diff-lcs 1.5.0
Using docile 1.4.0
Using factory_bot 6.2.0
Using method_source 1.0.0
Using thor 1.2.1
Using railties 5.2.6
Using factory_bot_rails 6.2.0
Using faker 2.19.0
Using ffi 1.15.5
Using jsonapi-serializer 2.2.0
Using rb-fsevent 0.11.1
Using rb-inotify 0.10.1
Using ruby_dep 1.5.0
Using listen 3.1.5
Using pg 1.3.1
Using pry 0.14.1
Using puma 3.12.6
Using sprockets 4.0.2
Using sprockets-rails 3.4.2
Using rails 5.2.6
Using rspec-support 3.10.3
Using rspec-core 3.10.2
Using rspec-expectations 3.10.2
Using rspec-mocks 3.10.3
Using rspec-rails 5.1.0
Using shoulda-matchers 5.1.0
Using simplecov-html 0.12.3
Using simplecov_json_formatter 0.1.3
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
```

If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

4. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db: {:drop,:create,:migrate,:seed}
```


5. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser. 
- Start server
```shell
$ rails s
```

NOTE: add route to navigate to once api is built
    
At this point you should be taken to a page with an example JSON response for a user

## Endpoints provided 
```
POST /api/v0/customers
POST /api/v0/subscriptions
PATCH /api/v0/subscriptions/:id
GET /api/vo/subscriptions
```
### Routes
<img width="473" alt="Screenshot 2023-11-02 at 5 13 59 PM" src="https://github.com/andilovetto/tea_and_me/assets/128431917/1572984d-432e-4f09-813d-88dba530fb57">

## Happy and Sad Request and Response Examples from Postman

### 😄 Create Subscriber Request: (POST /api/v0/customers)
![Screenshot 2023-11-02 at 5 16 40 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/78b3274e-6ecf-44a2-9bb7-4eea6edc3916)

### 😄 Create Subscriber Response:
![Screenshot 2023-11-02 at 5 17 44 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/8952bdc7-ecac-4b10-977c-6f6858d71ef5)

### 😢 Request for Email Already in Use: (POST /api/v0/customers)
![Screenshot 2023-11-02 at 5 20 56 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/1138bbbd-f11b-42b0-a4f6-f3105b112475)

### 😢 Response for Email Already in Use:
![Screenshot 2023-11-02 at 5 21 09 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/9483f158-3084-4b2a-b761-066c59b28407)

### 😄 Create Subscription Request: (POST /api/v0/subscriptions)
![Screenshot 2023-11-02 at 5 22 12 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/2009272f-d2f5-4a40-8b47-dfaf0097469d)

### 😄 Create Subscription Response:
![Screenshot 2023-11-02 at 5 22 48 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/741f9787-8a09-4d5b-9cf5-328958e5b9bd)

### 😢 Request for required frequency field left blank: (POST /api/v0/subscriptions)
![Screenshot 2023-11-02 at 5 24 01 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/77ea4165-35bf-47bc-b668-af1d1c2aab53)

### 😢 Response for required frequency field left blank:
![Screenshot 2023-11-02 at 5 24 42 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/aa6059fc-5d09-4ac0-8404-85fc33529a78)

### 😢 Response for required price field left blank:
![Screenshot 2023-11-02 at 5 25 36 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/fea29f8b-a0d0-4b03-b4bc-48b1ed1cc524)

### 😢 Request for invalid customer id: (POST /api/v0/subscriptions) (POST /api/v0/subscriptions)
![Screenshot 2023-11-02 at 5 26 35 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/22c251d6-7096-4805-b338-468a22086840)

### 😢 Response for invalid customer id:
![Screenshot 2023-11-02 at 5 27 29 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/3d19ec0e-351c-4186-b22c-53204b9931fc)

### 😢 Request for invalid tea id: (POST /api/v0/subscriptions)
![Screenshot 2023-11-02 at 5 27 51 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/aa74db78-99d7-4cb5-908a-114b2cd2d0b2)

### 😢 Response for invalid tea id:
![Screenshot 2023-11-02 at 5 28 19 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/02f35807-be35-4d10-bda4-12e10e271f62)

### 😄 Request for Deactivating Subscriptions: (PATCH /api/v0/subscriptions/:id)
![Screenshot 2023-11-02 at 5 34 36 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/6659659e-dddf-4495-823f-61803377b77d)

### 😄 Response for Deactivating Subscriptions:
![Screenshot 2023-11-02 at 5 35 04 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/6f42f5a4-af77-45c6-991f-33bfea9dd15f)

### 😄 Request for Reactivating Subscriptions: (PATCH /api/v0/subscriptions/:id)
![Screenshot 2023-11-02 at 5 38 23 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/dc86741b-46a8-4fea-9d7c-c93514642788)

### 😄 Response for Reactivating Subscriptions:
![Screenshot 2023-11-02 at 5 38 36 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/d461c726-38a9-4028-8603-f4062a9aa640)

### 😢 Request for invalid customer id: (PATCH /api/v0/subscriptions/:id)
![Screenshot 2023-11-02 at 5 36 26 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/096d3112-d61b-47af-8e9f-171727c00531)

### 😢 Request for invalid tea id: (PATCH /api/v0/subscriptions/:id)
![Screenshot 2023-11-02 at 5 36 44 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/5c64c1ea-2c5d-4488-a6cf-d15267d86ea4)

### 😢 Response for invalid customer and tea id:
![Screenshot 2023-11-02 at 5 37 20 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/4bcc5d93-2a0f-4137-b37f-43f661e5f7b1)

### 😄 Request for Viewing Subscription History: (GET /api/v0/subscriptions)
![Screenshot 2023-11-02 at 5 45 44 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/ddbaa01c-b07f-4410-82e7-6eb4711b689f)

### 😄 Response for Viewing Subscription History:
![Screenshot 2023-11-02 at 5 46 33 PM](https://github.com/andilovetto/tea_and_me/assets/128431917/4c83d3d6-fc90-4e0c-9aa3-5c0fe4092203)















## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/andilovetto"><img src="https://avatars.githubusercontent.com/u/128431917?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Andi(she/her)</b></sub></a><br /><a href="https://github.com/Daniel-Gallagher92/label_lens_be/commits?author=andilovetto" title="Code">💻</a> <a href="https://github.com/Daniel-Gallagher92/label_lens_be/pulls?q=is%3Apr+author%3Aandilovetto" title="Reviewed Pull Requests">👀</a>
     </td>
     </td>
    </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
