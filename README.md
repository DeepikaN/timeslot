## REST API - to create time based slots

It accepts start_time, end_time, and total_capacity parameters in payload and give response of avaliable slot collection.


* Ruby version - 3.0.0

* Rails version - 7.0.4

### System dependencies

Database - PostgreSQL

API platform for tetsing - Postman

### Setup

1. Clone the repository 
2. bundle install
3. rake db:create
4. rake db:migrate
5. start rails server

### How to run the api
 Go to postman enter below details
 1. Request type - post
 2. url - http://localhost:3000/api/v1/available_slots
 3. start_time = 2022-12-02 11:00 
    end_time = 2022-12-02 12:00
    total_capacity = 7
    
    Sample Request - post(http://localhost:3000/api/v1/available_slots?start_time=2022-12-06 11:00&end_time=2022-12-06 12:00&total_capacity=6)   
   
### How to run tests

### Thank you
Thank you for giving me the opportunity to work on this assignment!!
