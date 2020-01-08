# Practical vulnerability detection methods in web applications

### Penetration test
- controlled attack on IT system
- allows the practical rating of security state
- pentester takes the role of a potential hacker

### Audit
- checks compliance with the formal specification of the desired condition (norm, legal act)

## Local proxy tools
- proxy installed on PC
- browser connects to the proxy and then proxy connects to the requested web page
- allows capturing and modification of data send between the browser and web server

## Burp suite
- analysis and modification of requests and responses
- transfer of requests between different tools
- automatic scanner

## OWASP projects
- OWASP Top 10
- OWASP Testing Guide - tips for testing - a document containing information how to test each kind of vulnerability and what tools to use
- OWASP Cheat Sheet - tips for developers how to create secure applications
- OWASP Top Ten Proactive Controls - tips for developers
- OWASP ZAP
    - traffic capturing proxy
    - spider
    - scanning
    - addons
- OWASP Dependency Check
    - checks external libraries and other dependencies
    - outputs HTML report

## Web applications - concepts
### Client-server model
- client send a request to the server
- the request contains an URL
- server returns a resource
- HTTP is a stateless protocol
- states are emulated by the usage of sessions and cookies

### URL
- host - server address
- port
- resource path

### Request
- method
- resource path
- HTTP version
- data

### Response
- HTTP version
- response status code
- data

## Google Hacking
- searching for confidential information using special queries in Google search engine

## Ports
- numbers 0-65535
- States:
    - closed - not used
    - open - listening, receiving data and sending to the application
    - filtered - state can not be determined from the outside, host is not responding
- usually ports up to 1023 are used

## UDP
- connectionless

## XSS - Cross-site scripting
- injecting code into web page content - usually JavaScript

Kinds:

- Reflected XSS 
- Stored XSS / Persistent
- DOM based

## Browser exploitation framework - BEEF
- allows taking control of browser after finding a place for XSS
- web application control panel

## Defense against XSS
- encoding
- use HttpOnly parameter for session cookies

## Cross-site request forgery - CSRF
- we make an user do something without the person realizing it
- the link is recurrent
- changes in the system using HTTP GET

Testing:

- find a functionality realizing events changing some kind of data in the system
- check the recurrence of request/existence of tokens

## SQL Injection
- database queries can be modified using a special query