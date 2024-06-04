bundle exec jekyll clean
bundle exec jekyll build

scp -r _site/* apoliak@symbolics.cs.brynmawr.edu:/var/www/html/cs113/website
