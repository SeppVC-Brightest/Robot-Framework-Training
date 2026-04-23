*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Cases ***
Post Example
	Create Session  APIUt  http://postcodes.io
	${request}=  Set Variable  {"postcodes" : ["OX49 5NU", "M32 0JG", "NE30 1DP"]}
	&{headers}=  Create Dictionary  Content-Type=application/JSON
	${response}=  POST On Session  APIUt  /postcodes  data=${request}  headers=${headers}
	Log  ${response.status_code} ${response.text}