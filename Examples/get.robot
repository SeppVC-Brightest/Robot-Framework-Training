*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Cases ***
Get Example
	Create Session  APIUt  http://postcodes.io
	${response}=  GET On Session  APIUt  /random/postcodes
	Log  ${response.status_code} ${response.text}
	${response_json}=  Evaluate  json.loads('''${response.text}''')  json
	${result}=  Get From Dictionary  ${response_json}  result
	${postcode}=  Get From Dictionary  ${result}  postcode
	Log  ${postcode}