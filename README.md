# README

## Trading App

This Readme explains how to run the app and check the APIs 

#### Steps to run the app: 

- Clone the project
- Run `rails db:create db:migrate db:seed`
- Run `rails s`

In order to list all the trades head to the browser and type `http://localhost:300/trades?date='10-01-2023`

In order to get the maximum gain of a trade for a given date type `http://localhost:3000/trades/generate_gain?date='10-01-2023`
note that the date is a given input and can change and if there is no date we're gonna have the trades for the current day

In order to run the specs run `rspec`
