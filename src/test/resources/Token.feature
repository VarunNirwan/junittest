
Feature: get token

 Scenario: fetch token
Given url 'https://jwtgeneratetoken.azurewebsites.net/api/GenerateToken/GetToken'
When method GET
Then status 200

And def token = response.toString()
And print token


