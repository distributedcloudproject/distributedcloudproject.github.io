echo "CHECKING DEPENDENCIES"
ruby -v
gem -v
gcc -v
g++ -v
make -v

echo "INSTALLING JEKYLL"
sudo apt-get install ruby-dev
sudo gem install jekyll
sudo gem install bundler
sudo gem install rails # not sure if needed
