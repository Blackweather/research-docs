# Nginx Web Server Deep Dive - Linux Academy

### Use cases
- web server
- reverse proxy
- load balancer

### HTTP
- Application layer protocol built upon TCP/IP
- Defines the format for sending information between web clients and web servers

### HTTPS
- encrypted communication between web clients and servers using TLS/SSL

### Nginx vs Apache
<table>
    <tr>
        <th>Nginx</th>
        <th>Apache</th>
    </tr>
    <tr>
        <td>NGINX configuration language - directive based</td>
        <td>Apache configuration language - directive based</td>
    </tr>
    <tr>
        <td>One processing method</td>
        <td>Multiple processing methods</td>
    </tr>
    <tr>
        <td>Supports dynamic, third-party modules</td>
        <td>Supports dynamic, third-party modules</td>
    </tr>
    <tr>
        <td>Similar performance for dynamic content</td>
        <td>Similar performance for dynamic content</td>
    </tr>
    <tr>
        <td>Faster for serving static files</td>
        <td>Slower for serving static files</td>
    </tr>
    <tr>
        <td>No concept equivalent to .htaccess files</td>
        <td>Concept of .htaccess files for directory localized configuration</td>
    </tr>
</table>

### Proxy vs Reverse Proxy
<table>
    <tr>
        <th>Proxy</th>
        <th>Reverse Proxy</th>
    </tr>
    <tr>
        <td>Sits between our clients and the internet</td>
        <td>Sits between internet traffic and our servers</td>
    </tr>
    <tr>
        <td>Intermediate layer often used within organizations to monitor web traffic</td>
        <td>Intermediate layer often used to load balance traffic & serve content from a cache</td>
    </tr>
</table>