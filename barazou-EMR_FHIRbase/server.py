#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Simple pure Python EMR server based on FHIRbase
# Nb. This piece of software is in pre-alpha status; only very little of
# the FHIR REST spec has been implemented, and the code can be very buggy.
# Do not, repeat do not use this code in production!

import http.server
import os
import re
import json

import psycopg2
import jsonschema

PORT = 8000

# Connect to PostgreSQL/FHIRbase server
db_conn = psycopg2.connect(dbname="fhirbase", user="user", password="password")
db_cur = db_conn.cursor()
db_cur.execute("SET plv8.start_proc = 'plv8_init';")

class RequestHandler(http.server.BaseHTTPRequestHandler):
    """HTTP request handler customized to work with FHIRbase"""
    def do_GET(self):
        # Read
        ## GET [base]/[type]/[id]{?_format=[mime-type]}
        ## GET [base]/[type]/[id]{?_summary=text}
        path_read = re.match('(?P<base>[^?/]+)/(?P<type>[^?/]+)/(?P<id>[^?/]+)((\?_format=(?P<mimetype>.+)|\?_(?P<summary>summary)=text))?$', self.path)
        if path_read:
            d = path_read.groupdict()
            s = tuple([json.dumps({"resourceType": d["type"], "id": d["id"]})])
            db_cur.execute('SELECT fhir_read_resource(%s)', s)
            result = db_cur.fetchall()
            self.send_response(400)
            self.send_header('Content-type', 'application/fhir+json')
            self.end_headers()
            self.wfile.write(bytes(json.dumps(result), 'utf-8'))
            return True
        # vRead
        ## GET [base]/[type]/[id]/_history/[vid]{?_format=[mime-type]}
        path_vread = re.match('(?P<base>[^?/]+)/(?P<type>[^?/]+)/(?P<id>[^?/]+)/_history/(?P<vid>[^?/]+)(\?_format=(?P<mimetype>.+))?$', self.path)
        if path_vread:
            d = path_vread.groupdict()
            s = tuple([json.dumps({"resourceType": d["type"], "id": d["id"], "versionId": d["vid"]})])
            db_cur.execute('SELECT fhir_vread_resource(%s)', s)
            result = db_cur.fetchall()
            self.send_response(400)
            self.send_header('Content-type', 'application/fhir+json')
            self.end_headers()
            self.wfile.write(bytes(json.dumps(result), 'utf-8'))
            return True
        # History
        # Search
        # Capabilities
        # ...

    def do_PUT(self):
        #Check input JSON against corresponding schema before insertion
        pass
    def do_DELETE(self):
        pass
    def do_POST(self):
        pass
    def do_PATCH(self):
        pass


server_addr = ('', PORT)
httpd = http.server.HTTPServer(server_addr, RequestHandler)
httpd.serve_forever()
