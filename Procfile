puma: bin/rails server -p 9000 -b 0.0.0.0
js: sleep 9999999999 | yarn build --watch
css: yarn build:css --watch
scraping: bundle exec sidekiq -c 1 -q scraping
download: bundle exec sidekiq -c 5 -q submission_download
