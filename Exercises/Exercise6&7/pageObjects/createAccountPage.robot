*** Settings ***
Resource  basePage.robot

*** Variables ***
${FIRSTNAMEINFOTXT}=       id:customer_firstname
${LASTNAMEINFOTXT}=        id:customer_lastname
${EMAILTXT}=               id:email
${PASSWORDTXT}=            id:passwd
${FIRSTNAMEADDRESSTXT}=    id:firstname
${LASTNAMEADDRESSTXT}=     id:lastname
${ADDRESSTXT}=             id:address1
${CITYTXT}=                id:city
${STATESEL}=               id:id_state
${ZIPTXT}=                 id:postcode
${COUNTRYSEL}=             id:id_country
${MOBILETXT}=              id:phone_mobile
${SUBMITBTN}=              id:submitAccount
${CREATEACCOUNTERROR}=     css:.alert.alert-danger

*** Keywords ***
Fill In Account Data
    [Arguments]  ${firstnameInfo}  ${lastnameInfo}  ${email}  ${password}  ${firstnameAddress}  ${lastnameAddress}  ${address}  ${city}  ${state}  ${zip}  ${country}  ${mobile}
    Wait Until Element Is Visible  ${FIRSTNAMEINFOTXT}
    Input Text  ${FIRSTNAMEINFOTXT}  ${firstnameInfo}
    Input Text  ${LASTNAMEINFOTXT}  ${lastnameInfo}
    Input Text  ${EMAILTXT}  ${email}
    Input Text  ${PASSWORDTXT}  ${password}
    Input Text  ${FIRSTNAMEADDRESSTXT}  ${firstnameAddress}
    Input Text  ${LASTNAMEADDRESSTXT}  ${lastnameAddress}
    Input Text  ${ADDRESSTXT}  ${address}
    Input Text  ${CITYTXT}  ${city}
    Select From List By Label  ${STATESEL}  ${state}
    Input Text  ${ZIPTXT}  ${zip}
    Select From List By Label  ${COUNTRYSEL}  ${country}
    Input Text  ${MOBILETXT}  ${mobile}
    Click Element  ${SUBMITBTN}

Get Create Account Error Message
    ${text}=  Get Text  ${CREATEACCOUNTERROR}
    [Return]  ${text}