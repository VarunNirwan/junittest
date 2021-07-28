Feature: Testcases
Background: 
* def tokenResponse = call read('classpath:src/test/resources/Token.feature')
* def token = tokenResponse.token

Scenario: Test cases_Add User
Given url 'https://azureeventhubsproducer.azurewebsites.net/api/user'
And header Authorization = "Bearer " + token
And request
"""
<User>
	<id>1</id>
		<name>Ram</name>
		<pwd>password</pwd>
</User>
"""
When method POST
Then status 200

Scenario: Test cases_Add Employee

Given url 'https://azureeventhubsproducer.azurewebsites.net/api/sender'
And header Authorization = "Bearer " + [token]
And request
"""
<?xml version="1.0" encoding="UTF-8"?>
                                 <Employees>
                                    <EmpDetails>
                                        <Address>Bangalore</Address>
                                        <Age>30</Age>
                                    </EmpDetails>
                                    <EmpName>
                                        <FirstName>Kumar Debasis</FirstName>
                                        <LastName>Barik</LastName>
                                    </EmpName>
                                 </Employees>

"""
When method POST
Then status 200

Scenario: Test cases_User_Negative Testcase_Unauthorization Error
Given url 'https://azureeventhubsproducer.azurewebsites.net/api/user'
And request
"""
<User>
	<id>1</id>
		<name>Ram</name>
		<pwd>password</pwd>
</User>
"""
When method POST
Then status 401


Scenario: Test cases_User_Negative test case_Request without body
Given url 'https://azureeventhubsproducer.azurewebsites.net/api/sender'
And header Authorization = "Bearer " + [token]
* request ''
When method POST
Then status 415

Scenario: Test cases_Employee_Negative test case_Request without body
Given url 'https://azureeventhubsproducer.azurewebsites.net/api/sender'
And header Authorization = "Bearer " + [token]
* request ''
When method POST
Then status 415




