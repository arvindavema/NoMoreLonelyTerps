# NoMoreLonelyTerps

## Setting this up on your computer: 
### Windows / Ubuntu 
Ensure you have windows set up with wsl and ubuntu all set up as well. For help please follow the instructions at https://docs.microsoft.com/en-us/windows/wsl/install-win10 . Ignore wsl2 installation steps and make sure you install Ubuntu20.04 LTS. Then run:    

    sudo apt update && sudo apt upgrade

#### Installing Prerequisites: 

##### Installing Ruby 2.7.1 using rvm
This app requires Ruby version 2.7.1. I coded this using ruby that I installed using the Ruby Version Manager(rvm). Follow the instructions in https://gorails.com/setup/ubuntu/20.04#ruby-rvm and install Ruby-2.7.1.


##### Install Nodejs    

    curl -sL https://deb.nodesource.com/setup_12.x |sudo -E bash -
    sudo apt-get install -y nodejs
    
##### Install Yarn    

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt install yarn
    yarn install --check-files
    
##### Install Postgresql (version 12):    

     sudo apt-get install postgresql libpq-dev
     sudo -u postgres createuser --interactive
      
    
Set op Postgresql with your own username and password. Remember yout credentials for later! 

##### Install rails and other gems:    

     gem install rails -v 6.0.3.4
     gem install bundler:2.1.4
     gem install pg
     

#### Finally:    
    
    git clone https://github.com/arvindavema/NoMoreLonelyTerps.git
    cd NoMoreLonelyTerps 
    bundle install    
    
    
##### Setup Postgresql Database: 
Find all the places in config/database.yml that says username: or password: and replace the fields with your postgresql user's username and password. Then run:    

    rake db:setup
    rake db:migrate
    
##### Start the server: 
run:    
     
    rails s
    
    
Then open http://localhost:3000/ in your prefered browser. 
    

## Overview
The social changes occurring as a result of COVID-19 have inspired me to try and develop a simple social network that Terps can use to find and interact with other terps!. Two major factors have pushed me to start this project.

### 1) Posts I constantly see on Reddit or Twitter
Every time I open r/UMD or twitter I always see multiple posts about loneliness, depression or requests to hangout or game together.

### 2) My Brother's Freshman Year vs My Freshman Year  
My Brother is currently a Freshman in College and he has been at Home for the entirety of the semester. He has not made any new friends and he has no one to hang out with besides other people from his high school that decided to stay at home. When I was a Freshman I was lucky enough to live in the Dorms at UMD and during that year, it is safe to say that I've established life long friendships and connections with people I have never met before. This blaring disparity between my experiences and my brother's is hard to just sit back and watch. I thought this was the time to try to do something about it and here we are.

# ToDo
## 1. Create Friends and friendships
I need to create a graph like structure where the nodes are Users and the edges are friendships

## 2. Friends posts
Add Users' Friends' posts to Users' feeds along with the Users' posts

## 3. Chat
I aim to add a direct messaging feature along with general chatrooms that a User can create or enter

# So Far:

## Initial page if user is not logged in:

![Image of HOME](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/HOME.PNG)

## Sign Up Page

![Image of SignUp](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/SignUp.PNG)

## Sign Up Validation at Work
Notice that the sign up email has to end with "terpmail.umd.edu". This is to make the site Terp exclusive.

![Image of SignUpFail](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/SignUpFailure.PNG)

## Home Page After Successful Sign Up:

![Image of HomeAfterSignIn](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/HomePageOnSignIn.PNG)


## On Click of Post! button, User is redirected to "New Post" page:
Currently, at most one image can be uploaded per post via the "Choose File" button. The goal is to have at most 4 images per post.

![Image of OnPostButtonClick](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/OnPostButtonClick.PNG)


## Post Page:  
When a post is successfully created, the user is redirected to the post's page.

### Post view:
The post is displayed at the top of the page with a comment section underneath it.

![Image of OnPostCreate](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/OnPostCreate.PNG)

### Comment Section:

Upon scrolling down, you will find a comment section. Comments are only visible on the post's page. They do not show on user feeds or home feeds.

![Image of Comments](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/PostComments.PNG)

# User Feed / Home tabs

The User's Home tab is identical to their Feed tab except the User's friends' posts are included under the user's "Feed" tab while only the User's own posts are shown under the Home tab. Posts are chronologically sorted with newest at the top of either pages.

![Image of HomePageWithMultPosts](https://github.com/arvindavema/NoMoreLonelyTerps/blob/master/screenshots/HomePageWithMultPosts.PNG)
