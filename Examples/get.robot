*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Test Cases ***
Get Example
	Create Session  APIUt  http://postcodes.io
	${response}=  Get Request  APIUt  /random/postcodes
	Log  ${response.status_code} ${response.text}
	${response}=  To Json  ${response.text}
	${result}=  Get Value From Json  ${response}  $.result.postcode
	Log  ${result}