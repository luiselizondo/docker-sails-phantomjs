Sails.js running on Docker with Phantom.js installed

# Build

	docker build -t yourname/sails-phantomjs .

# Or Pull:

	docker pull luis/sails-phantomjs

# Run
First create a new project:

	docker run -it --rm -p 1337:1337 -v /path_to_project_on_host:/var/www -v /var/log/sails:/var/log/supervisor luis/sails-phantomjs sails new

Then install dependencies:

	docker run -it --rm -p 1337:1337 -v /path_to_project_on_host:/var/www -v /var/log/sails:/var/logs/supervisor luis/sails-phantomjs npm install

Note: If you get an error, remove the node_modules directory on the host and try again the last command, aparently there's a bug with the latest version of NPM

Run the server:

	docker run -d -p 1337:1337 -v /path_to_project_on_host:/var/www -v /var/log/sails:/var/log/supervisor luis/sails-phantomjs

If you need to run any sails command, just do:

	docker run --it --rm -v /path_to_project_on_host:/var/www luis/sails-phantomjs sails command

### Includes
The following node.js modules have been installed globally

- sails
- mocha 
- sinon
- should
- assert
- grunt
- bower
- phantomjs
- wkhtmltopdf 
