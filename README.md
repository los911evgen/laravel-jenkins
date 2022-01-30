# Laravel 8 Simple CMS dockerized with Jenkins Pipeline
Взято из  https://github.com/ozdemirburak/laravel-8-simple-cms.git и доработано для организации процесса непрерывной интеграции и доставки средствами Docker и Jenkins

-----
## Оглавление

* [Возможности](#item1)
* [Развёртывание](#item2)
* [Использование](#item3)

-----
<a name="item1"></a>
## Возможности:
* Admin Panel
  * Custom template with Bulma
  * Google Analytics API integrated dashboard
  * Server side oriented datatables
  * Page, category, and article management
  * [Trumbowyg](https://alex-d.github.io/Trumbowyg/) as the WYSIWYG editor
  * [elFinder](https://studio-42.github.io/elFinder/) as the file manager
  * [Feather Icons](https://feathericons.com) as the icon package
* Front-end
  * Custom template with Bulma
  * View pages, articles and categories

-----
<a name="item2"></a>
## Quick Start:

Clone this repository and install the dependencies.

    $ git clone https://github.com/ozdemirburak/laravel-8-simple-cms.git && cd laravel-8-simple-cms
    $ composer install

Run the command below to initialize. Do not forget to configure your .env file. 

    $ php artisan cms:initialize --seed

Install node and npm following one of the techniques explained in 
this [link](https://gist.github.com/isaacs/579814) to create and compile the assets of the 
application.
    
    $ npm install
    $ npm run production

Finally, serve the application.

    $ php artisan serve

Open [http://localhost:8000](http://localhost:8000) from your browser. 
To access the admin panel, hit the link 
[http://localhost:8000/admin](http://localhost:8000/admin) from your browser.
The application comes with default user with email address `admin@admin.com` and `123456`.

-----
<a name="item3"></a>
## Installation Guide:

* [Step 1: Download the Repository](#step1)
* [Step 2: Initialize Application](#step2)
* [Step 3: Serve](#step3)
* [Step 4: Extras](#step4)

-----
<a name="step1"></a>
### Step 1: Download the Repository

Either Clone the repository using git clone: `git clone https://github.com/ozdemirburak/laravel-8-simple-cms.git` 
or install via <a target="_blank" href="https://github.com/ozdemirburak/laravel-8-simple-cms/archive/master.zip">zip</a> and extract 
to any of your folders you wish.

-----
<a name="step2"></a>
### Step 2: Initialize the Application

To install the composer dependencies you need to have composer installed, if you don't have composer installed, 
then [follow these instructions](https://getcomposer.org/download/). Finally run, `composer install` in the `laravel-8-simple-cms` directory.

Run `php artisan cms:initialize --seed` which will ask you to create a database to migrate and seed our boilerplate application 
with fake data. Do not forget that all variables with `DB_` prefixes in your `.env` file relates to your database configuration. 
After configuring your `.env` file, with the proper data, you need to create the assets.

If you do not have node and npm installed, follow one of the techniques explained in this [link](https://gist.github.com/isaacs/579814).
Then, to install our boilerplate project's asset dependencies, run `npm install`. Finally to combine the 
javascript and style files run `npm run production`.

-----
<a name="step3"></a>
### Step 3: Serve

To serve the application, you can use `php artisan serve`, then open [http://localhost:8000](http://localhost:8000) 
from your browser. To access the admin panel, hit the link [http://localhost:8000/admin](http://localhost:8000/admin) 
from your browser. The application comes with default user with email address `admin@admin.com` and `123456`.
