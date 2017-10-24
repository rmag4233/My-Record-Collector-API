[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# About The App

It's a simple yet well known problem for music enthusiasts, especially record collectors - what is the best way for me to keep track of my collection? My Record Collector seeks to resolve that issue and provide the user with the opportunity to represent their record collection in a digital space. Whether the format is tape, vinyl, or CD, My Record Collector allows a user to document the records in their collection, and the ability to edit, delete or add new records to it. The catalog number field is especially useful for users who may look to trade or sell online or just evaluate the worth of certain pieces of their collection. When adding and editing a record, the Artist Name, Album Name, Year Released and Format fields are required. The catalog number is optional. The app is also responsive, meaning you can sign in from the record store and update your collection as soon as you've completed a transaction. So sign up, sign in and start collecting! This is the repo for the back end of the My Record Collector app.


## Technologies Used

1. Ruby on Rails
2. Heroku

## Planning Phase

The planning phase for this app started almost instantly after the assignment of the project. When I learned that the content/objective of the application was on the developer to come up with, I immediately began asking myself "what app would I want to use after building?" The answer was quite obvious - I wanted to create an application that would allow me to keep track of my record collection in a digital format. Why? Because I am someone who enjoys to collect records and I want to be able to keep track of it so I know whether or not I have misplaced a record (perhaps in a move) and so I only have to refer once to the catalog number on the record and from there can reference sites to get a sense for how much my record collection is worth. Simply put - I wanted to create a product that I had knowledge of, an interest in building and a use for after building.

My approach for this project, from a development perspective, was to begin by building out a clean UI using Bootstrap. To ensure I stayed on track with this approach, I started by drawing some descriptive wireframes (linked below) and really developing a sense in my head for how I wanted the user to traverse through the application. I wanted to make use of modal windows and handlebars, so I paid particular attention to how those attributes would work within the context of the application.

Once I had a working shell of the front end, I began to develop the user authentication functionality. I knew I wanted to have a user sign up and sign in before having access to view, add, edit or delete any albums as well as be able to make other user actions such as change password and sign out. Methodically, I added each piece of user functionality and tested that the user messaging and actions that were available for the user to perform (through the buttons on the page) made sense with where the user was in the application.

Next I added my album resource to my API, using curl scripts to ensure that as I built out the resource, I was able to perform the expected actions on it. After confirming ability to add, edit, delete and show the album resource through curl scripts. I connected the resource to my front end and using handlebars and modal windows methodically built out the functionality I tested in my curl scripts to my UI.

Once I tested through this functionality, it was time for me to the connect the user to the album. I knew that the relationship the resources would have would be one user has many albums and so I modified my albums resource to reflect that. In addition, I knew that the albums table was only going to show the albums that the logged in user had in their collection. This meant that a user needed to be logged in to view their albums, so I made the album controller inherit from the ProtectedController class and made it so that actions such as index, show, update and destory were based on the current users list of albums.

I am most proud of the UI of my application as I feel as though it is very neat and aesthetically pleasing to look at. It is also responsive and therefore meets my 18th user story below which allows me to update my collection in real time.

## How the Front End and Back End interact

The API has two end points - a user and an album resource. The API is built in the Ruby on Rails framework. The users resource takes two pieces of credentials information on sign up (an email address and a password). On sign up, the user must pass a password confirmation as well. The user resource requires authentication before performing delete (sign out) and patch (change password) actions. Authentication is secured when a registered user signs in, which is handled by a post request that generates a session token. The authentication sets a current user, which is terminated, along with the session token, upon the user signing out by using the 'Sign Out' button.

The album resource was built using the bin/rails generate scaffold action which creates a controller for the resource, a model, a serializer, a migration file and adds the resource to the routes.rb file. After reviewing the content of these files for accuracy and making modifications where necessary, I ran the bin/rails db:migrate command to formally add the resource. A user is able to CRUD on the album resource by being able to view their albums (index/get), add albums (create/post), edit existing albums (update/patch), and delete albums (destroy/delete).

A user can trigger these actions on the front end by the 'View My Albums' button (index/get), the 'Add Album' button (create/post) and the 'Edit' (update/patch) and 'Delete' (destroy/delete) buttons that display next to each album in a users album list after they select 'View My Albums' or trigger an action such as 'Add Album' or 'Edit' which produces the user's album list.

The user has a one to many relationship with the albums resource, meaning that one user can have many albums. Once I was able to confirm ability to CRUD on the album resource, I created the relationship between the resources by generating a migration file, using the command: bin/rails generate migration AddUserToAlbums user:references. This in essence generated a foreign key for user_id on the albums table thus creating the one to many relationship. After this was completed and I ran the command to migrate the file that was generated from the last command, I updated the User model and Album model to indicate that a user has_many albums and an album belongs_to a user. I also added the user_id to the Album serializer to test that this one to many relationship did indeed exist.

The albums table has the following columns, all of which accept string values - Artist Name, Album Title, Year Released, Format, and Catalog Number. All of these fields are required on the front end validated for presence is true on the back end, except for Catalog Number. There is also an album id as well as a foreign key for user id on the Albums table.

The last piece I added to the backend was some stipulations on the albums controller to ensure that it both required authentication before being accessible and that actions only updated the currently signed in users information. To do this, I set the albums controller to inherit from the ProtectedController class, which requires authentication before actions can take place. I also updated the index and create methods that were created upon the bin/rails generate scaffold command as well as the set_album method, which is called before the show, update, and destroy methods, method chaining current_user before setting the album and albums instance variables. This ensures that all CRUD actions on the albums resource will be associated to the currently signed in user.

## User Actions

| Verb   | URI Pattern                   | Controller#Action    |
|--------|-------------------------------|----------------------|
| POST   | `/sign-up`                    |    `users#signup`    |
| POST   | `/sign-in `                   |    `users#signIn`    |
| PATCH  | `/change-password/:id `       |  `users#changepw`    |
| DELETE | `/sign-out/:id `              |   `users#signout`    |

## Album Actions

| Verb   | URI Pattern                   | Controller#Action    |
|--------|-------------------------------|----------------------|
| GET    | `/albums`                     |    `albums#index`    |
| GET    | `/albums/:id `                |    `albums#show`     |
| PATCH  | `/albums/:id `                |  `albums#update`     |
| DELETE | `/albums/:id `                |   `albums#destroy`   |
| POST   | `/albums `                    |   `albums#create`    |

## ERD

ERD -
https://imgur.com/AL6fyWg


## Future Iterations

In future iterations of this project, I would like to build out functionality that allows multiple users to view other people's lists/search the entire database for all albums that people have in their collection so that users could try to make trades/buy records from one another. There are also additional APIs I would like to research connecting to - perhaps a Spotify API or to a site that provides the user with the value of a piece of their collection based on information like the catalog number and the condition of the record. I will be looking to add this functionality in future releases. Additionally, late in the sprint I added a search functionality that allows a user to their albums by a specific artist. Unfortunately since this is an array that is a subset of the object sent back from the API, I was unable to add functionality to allow the user to 'Edit' or 'Delete' from that list. There is still a use case for the search functionality that I added as if a user has several albums in their collection and they want to confirm if they have a record by a certain artist they can make the search easier just by limiting to the artist they're concerned about.

## Links to Deployed Sites

Front End -
https://rmag4233.github.io/My-Record-Collector/

Back End -
https://my-record-collector.herokuapp.com/

## Repo for Front End
https://github.com/rmag4233/My-Record-Collector
