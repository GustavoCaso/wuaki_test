# Wauki Test

I have created the solution for the problem Miquel sent me.

##Endpoints

`GET /api/v1/movies` => Will return the movies ordered by creation

`GET /api/v1/seasons` => Will return the season and the episodes ordered by the number of the episode ordered by creation

`GET /api/v1/content` => Will return all the content from the database ordered by creation

`POST /api/v1/movies` => Will add the new movie to the user library is necessary to pass `user_id` and `movie_id` params in other to create the resource

`POST /api/v1/seasons` => Will add the new movie to the user library is necessary to pass `user_id` and `movie_id` params in other to create the resource

`GET /api/v1/library` => Will return the library containing an array of `movies` ordered by the the time left to watch the content and an arry of `seasons`

##Cache

I have use cache for different query, to improve the performance, which will reflect in a better user experience.

##Seeds

I have create a simple seeds so you can bootstrap the project by downloading it and typing `rake db:setup`
