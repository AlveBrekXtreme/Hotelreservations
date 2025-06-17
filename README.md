# Hotellbestillingssystem (Hotelreservations)

This is a web-application for reserving rooms at hotels. Users can search for hotels and choose from a selection of available hotels based on the search. 
There is also a page for managing hotels, where administrators can add, update and remove hotels. 

# Local setup

## Tool versions
`Ruby` -> `3.3.7` <br>
`Bundle` -> `3.3.7` <br>
`PostgreSQL` -> `7.0` 

## Install gems
```shell
bundle install
```

## Set up database
```shell
rails db:create
rails db:migrate
```

## Load test data
```shell
rails db:seed
```

## Run the project
```shell
bin/dev
```

