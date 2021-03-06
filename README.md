Node.js Echo Server
===================

This HTTP server echos the request and response details, and allows you to craft custom HTTP responses based on request parameters.

Getting Started
---------------

Requirements: Node http://nodejs.org (version 2.6 or greater)

To run the server:

  node echo-server.js

By default echo server runs on port 8124.  You can run on a different port with the --port options:

  node echo-server.js --port 12345

Usage
-----

Trigger an HTTP 200 response:
http://localhost:8124/200

Trigger an HTTP 404 response:
http://localhost:8124/404

Trigger an HTTP 404 response with a custom message:
http://localhost:8124/404?reasonPhrase=Oh%20No%21

Trigger an HTTP 200 response with a custom header:
http://localhost:8124/200?headers.CustomHeader=foo

There are a lot more options and things you can do, including sending parameters as a serialized JSON object, sending an array of responses, and using conditionals to choose the appropriate response.  I'll write up more soon, in the meantime, check the source.

Background
----------

Testing client/server communications can be a pain.  You either need to embed logging in your code, or fire up WireShark to view the requests/responses.  And if you are debugging a server, the start server -> make request -> check logs -> stop server -> edit code cycle can be a real pain.  This server helps with these situations by echoing your request/response headers, and also giving you fine-grained control over the response.

One example where this can be useful is testing a CORS preflight request (which is an HTTP OPTION request followed by another HTTP request).  Testing this on a regular server would be a pain, but echo-server's "json" parameter gives you fine-grain, almost script-like control over responses or a series of responses.
