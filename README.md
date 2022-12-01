## REST API - to create time based slots

It accepts start_time, end_time, and total_capacity parameters in payload and gives response of available slot and slot capacity.


* Ruby version - 3.0.0

* Rails version - 7.0.4

### System dependencies

Database - PostgreSQL

API platform for testing - Postman

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
    
### Screenshots of output
Success Response -

<img width="500" alt="Screenshot 2022-12-01 at 1 01 45 PM" src="https://user-images.githubusercontent.com/2619040/204992835-6d441bbd-a768-4799-961e-50f0422e209b.png">


Failure Response - 

<img width="500" alt="Screenshot 2022-12-01 at 12 46 33 PM" src="https://user-images.githubusercontent.com/2619040/204989938-2465e8fd-c2f7-47dc-93ec-33a113f7c05e.png">


### Thank you
Thank you for giving me the opportunity to work on this assignment!!
