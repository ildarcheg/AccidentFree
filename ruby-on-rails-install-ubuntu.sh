# Install Ruby on Rails Ubuntu (RBENV)

# Additional information https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04
# we will mix into the instructions.

# Set up an evvironment

# update installed packages before adding new ones
cd
sudo apt-get update -y

# install tree just convenient tool
sudo apt-get install tree

# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 sudo apt-get update
sudo apt-get install sublime-text-installer

# install Git required to clone source repositories and work with ourselves
sudo apt-get install -y git gitk git-gui

# set up git config 
# git config --global user.name "Your Name"
# git config --global user.email "youremail@domain.com"

# install C-compiler and libraries required by rbenv to build ruby binaries for your platform
sudo apt-get install -y gcc build-essential libpq-dev libssl-dev libreadline-dev libsqlite3-dev zlib1g-dev

# Set up RBENV

# Now follow the rbenv instructtions on the Github site
# https://github.com/rbenv/rbenv
# clone the rbenv git repo into ~/.rbenv
cd
git clone git://github.com/rbenv/rbenv.git .rbenv

# add ~/.rbenv to your $PATH for access to rbenv command-line utility
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
tail ~/.bashrc

# add "rbenv init" to your shell to enable shims and autocompletion
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
tail ~/.bashrc

# add the contents of the modified .bashrc to your current shell
source ~/.bashrc
which rbenv
rbenv -v
rbenv help

# add the install command to rbenv
git clone git://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
tail ~/.bashrc

# source the new path location into the current shell and verify we now have an "install" command
source ~/.bashrc
rbenv help | grep install

# Set up Ruby and Rails
# we can not mesh in the instructions from
# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04

# install a Ruby version (could be others)
rbenv install -v 2.2.3
# set the global version of Ruby to use
rbenv global 2.2.3
ruby -v

#set the default to not have gems generate local documentation (and eat space and time)
echo "gem: --no-document" > ~/.gemrc
gem install bundler

#this step will take a ~5min to complete (as it warns)
gem install rails -v 4.2.3
rails -v

# install shims for newly installed Ruby gems that provide commands
rbenv rehash

# Install additional components

# install Node.js -- we have to jump over to some github instructions
sudo apt-get install -y software-properties-common python-software-properties
sudo apt-get install -y nodejs
sudo apt-get install -y libfontconfig1-dev

# install phantomJS
sudo apt-get install -y bzip2
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
cd /tmp
curl -L https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 | tar xvjf -
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
phantomjs --version

# inspect installation
tree ~/ -L 1
tree ~/.rbenv -L 1

# Create and run new Rails app
cd /tmp
rails new test_install
cd test_install
rails server
