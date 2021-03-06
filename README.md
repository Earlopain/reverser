# Reverser

A content aggregator for a variety of sites to make uploading to e6 easier. Created because Saucenao doesn't support all the sites I want it to.

You provide links where the artist is uploading their content to. The content will then be scraped of those sites and put into iqdb (a reverse image search software). It also checks e6' version of iqdb to provide you information on if submissions are already uploaded, or if the current upload has a better version available elsewere.

![Larger image search for kenket](screenshots/1.png)

Image dimensions and filesize are displayed, links to the original submission, the direct link of the downloaded file, and a link to start reverse image search for similar already scraped files.

![Larger submission example](screenshots/2.png)

The current upload on e6 is only 0.3x of the dimensions from the twitter post. It's also 1.83MB larger, a prime example for replacement. Please check manually if the file is actually superior, just because the filessize is greater doesn't mean that the visual quality is too. 

![Non-uploaded submissions from kenket](screenshots/3.png)

You can also search for non-uploaded submission for artists. How well this works depends on the artist and page. Some artists don't seperate their personal and art accounts and post irrelevant content which would also appear in this list.

## Limitations

E6 is limiting iqdb to one call per two seconds, which means that you will need to potentially wait for hours just to process a single artist. Until this is fixed actual usage for more than one user isn't really feasable. See [zwagoth/e621ng#368](https://github.com/zwagoth/e621ng/pull/368) for a first step to solve this problem.

## Currently supported sites
* Artstation
* Deviantart
* Furaffinity
* FurryNetwork
* Inkbunny
* Newgrounds
* Piczel
* Pixiv
* Reddit
* Sofurry
* Tumblr (kind of)
* Twitter
* Weasyl

### Tumblr

Tumblr doesn't expose the full resolution image through normal means. Getting full resolution on tumblr is a bit more compicated. Here's what you need to do, and what is done for you. Manual steps are marked with (*)
1. Reblog every post of the blog
1. (*) Download an archive of your blog
1. (*) Upload the archive through the tumblr uploader
1. (*) Remove drafts from your blog with the [Mega-Editor](https://www.tumblr.com/mega-editor/draft/)
1. Import full resolution files from the uploaded archive

The first step starts when you add a tumblr url to an artist. Instead of downloading the image like all other scrapers, it reblogs them.

## Configuration

A few scraper require credentials to work, this is how you can configure them. Higher entries in this list overwrite the lower ones.
1. Environment variables prefixed with `REVERSER_`. Values are loaded with `Psych.safe_load`, which means you are able to provide complex types like arrays and hashes. If a config ends with `?`, omit it from the environment variable name.
1. Entries in the file at `REVERSER_CUSTOM_CONFIG_PATH`, or `config/reverser_custom_config.yml` if the environment variable is not set.
1. Entries in the file at `config/reverser.yml`. Look here to see what you can/need to configure for more scraper to work. There are also a few other settings you can tweak, like disabling individual scrapers.

## Development Setup
The following software is required to get started:
 * Latest version of Docker ([download](https://docs.docker.com/get-docker))
 * Latest version of Docker Compose ([download](https://docs.docker.com/compose/install))
 * Git ([download](https://git-scm.com/downloads))

1. Clone the repo with `git clone https://github.com/earlopain/reverser.git`.
1. `cd` into the repo.
1. Run `docker-compose up`. The container is now available at `http://localhost:9000`.
1. Get inside the container with `docker-compose run reverser sh`.
1. Run `bin/rails assets:generate_spritemap` to stich the favicons in one image.
1. Run `RAILS_ENV=test bin/rails db:prepare` to setup the test database for later use.

### Tests/Linters

The compose file contains services to easily run some developments tools:
* `docker-compose run --rm rspec`
* `docker-compose run --rm rubocop`

You can pass addition parameters like individual test files for rspec or `-a` for rubocop simply by appending it to the command. I suggest you make an alias for these. You may also run these commands locally, since docker does add a fair bit of startup overhead.
