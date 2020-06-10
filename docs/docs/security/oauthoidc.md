# Web Security: OAuth and OpenID Connect - LinkedIn Learning

### OAuth 2.0 is a Framework
- leaves many things undefined

## OAuth extensions
- JWT (JSON Web Token)
    - not required, but common
    - encoded
    - shouldn't be used with sensitive information
    - includes fields like
        - iss (issuer)
        - iat (issued at)
        - sub (subject)
        - aud (audience)
        - exp (expiration)
- Token revocation
    - revokes (cancels) a token via API
    - in practice required
- Token introspection
    - examines a token to describe its contents
    - useful for opaque tokens
    - describes if token is active or not
    - mandatory if using token revocation
- Dynamic Client Registration
    - defines a constant API for creating OAuth clients
- Authorization server metadata discovery
    - also known as OAuth discovery document
    - allows to query authorization server to get back a response with its capabilities

## OpenID Connect (OIDC)
### Overview
- extension to OAuth
    - structured pattern on top of existing framework
- rigidly defined
- strictly structured JWTs (format and content)
- numerous extensions

### Features
- allows for Single Sign On
- adds ID Tokens
    - must be a JWT
    - naming and content requirements
    - most often user's profile information
- adds Userinfo endpoint
    - will generally retrieve info that was in ID Token itself
    - simplifies creating user account

### OAuth Concepts
- scopes - permissions that can be requested and granted or denied
- access token - represents your current authorization
- refresh token - represents your next authorization
- grant types/flows - define how you retrieve tokens
    - authorization code flow - back-end apps
    - implicit or authorization code with PKCE - mobile apps or SPAs, implicit is deprecated (hard to secure)
    - client credential - service accounts or microservices
    - resource owner password - for legacy apps, should be used as last resort, not a good choice

### OAuth Endpoints
- **/authorize**
    - used for anything user facing
    - gets the authorization grant and user content
- **/token**
    - used to retrieve the token
    - the only endpoint used in resource owner password or client credential
- other endpoints are extensions
    - **/introspect** - analyze and decode a token
    - **/revoke** - invalidate an access or refresh token
    - **/userinfo** - from OIDC specfication, publishes user profile data
    - endpoints other than /userinfo can be named however you want
    - **/.well-known/oauth-authorization-server** - oauth discovery document, fixed, lists URL patterns for all other endpoints

### OAuth Scopes
- naming is up to system architect, the only requirement is the type is string
- generally three patterns
    - simple strings (read, write, delete, admin) - fine for small scenarios which won't grow over time
    - java-style namespaces - company.resource.action
        - expressive
        - granular
        - predictable
        - incredibly long and complex to use
    - URL-style patterns - api.company.com/resource.action
        - expressive
        - granular
        - predictable
        - allow the API to be self documenting if we resolve the specified URLs
- the patterns should be consistent
- admin scopes are rare - vague and broad

### OAuth Tokens
- opaque tokens - obfuscated tokens - unique string that acts as a database key, only useful in the authorization server
- JWT - full of authorization and profile data
    - authorization/profile data is divided into parts called claims
    - the is no pattern to follow, it needs to be decided by the developer

#### Validating JWTs
- steps for validating the token are always the same, the underlying technologies used do not matter
- we're only validating access and ID tokens

1. Retrieve the keys document, which represent the public key the token was signed with
2. The token is separated to header, payload and signature
3. The header is decoded from base64
4. We grab the kid (key id) from header, which represents the key from document retrieved in step 1
4.1. if they don't match either the token is out of date or not for you and should be rejected
5. The referenced key is used to sign the payload and compare against the original signature
5.1. if they don't match. your token has been tampered with or is not for you and should be rejected
6. Decoded payload iss (issuer) should match the authorization server
6.1.  aud (audience) should match the value set in authorization server - who the token is destined for
6.2. cid (client id) should match the client id for our application - the one who originally requested the token
6.3. exp (expiration time) should be in the future

- token validation is all or nothing
- libraries handle this for you

#### ID Tokens
- comes from OIDC specification
- always a JWT token
- can be validated
- highly structured and defined
    - a list of claims generally used for creating a user account
    - additional email scope
    - additional address scope
    - additional phone scope
    - all the names of claims are defined by OIDC and cannot be changed
- easiest to parse

#### Handling Tokens
- ID Tokens should be only seen by the user and application
- Access Token - depends on the use case
    - if read only information to public information, long expiration is fine
    - if read access to sensitive data, it should have shorter expiration
    - if read write access to sensitive data, it should have very short expiration
- refresh token - most dangerous

### OAuth recommended practices
- always use SSL/TLS
- balance security and latency for your use case
- API Gateway is recommended
    - can add rate limiting, logging, and better management
    - can validate the token and drop unauthorized traffic
- choose the right grant type
- validate your tokens
- secure your tokens

## Role-based Access Control vs Attribute-based Access Control
<table>
    <tr>
        <th>Role-based Access Control (RBAC)</th>
        <th>Attribute-based Access Control (ABAC)</th>
    </tr>
    <tr>
        <td>Access rights granted through predefined roles</td>
        <td>Access rights granted through policies</td>
    </tr>
    <tr>
        <td>Each role carries a set of privileges</td>
        <td>A policy combines a set of attributes (claims) together</td>
    </tr>
    <tr>
        <td></td>
        <td>Allows much more complex rules than RBAC</td>
    </tr>
</table>