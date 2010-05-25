## Setup ##
To get this project up and running:

### Download the Project ###
If you have git installed, copy and paste the url given at the top of this page, into your command line It will look something like this "git@github.com:CSIX/CSIX.git".
This will add a folder to your current folder, call it "/CSIX/", and download the project into that folder.

Type "cd CSIX" to move into the folder just created.

If you don't have git installed, download the zip file and extract it.

### Install the Necessary Gems ###
Type "rake gems:install" to install the gems;
+ Authlogic
+ Declarative Authentication

#### NB: ####
There is a known error with authlogic 2.1.4 and rails 2.3.5. Please make sure you are running at least rails 2.3.8.

### Setup the database
Type "rake db:migrate" followed by "rake db:seed"
This creates a database, and seeds it with some sample information. The information that it inserts can be seen in the console.

### Run the Server ###
Then type "script/server" to get the server running.
You can see the site running at http://localhost:3000


Everything should work fine now.

### Development ###
If you want to develop the site and have your code committed to the final project, you will need to fork the code (at github.com), and follow the steps outline above. The only difference being the git url. It will be "git@github.com:*username*/CSIX.git", where *username* is your github username.

A full guide is available at http://csix.netsoc.com/wiki/index.php/Git_Instructions