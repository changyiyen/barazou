# EMR-FHIRbase

## EMR-FHIRbase - an electronic medical records server based on [FHIRbase]
## (https://fhirbase.github.io) that tries to be [FHIR-compliant]
## (https://www.hl7.org/fhir/)

### Introduction

EMR-FHIRbase is an electronic medical records server that tries to adhere to the
FHIR standard, specifically the JSON part of the REST interface, as documented
[here] (https://www.hl7.org/fhir/http.html). It is based on [FHIRbase]
(https://fhirbase.github.io), a project aiming to provide a storage solution to
health IT systems. EMR-FHIRbase itself is a Django application, written in
Python 3, and uses Django REST Framework to provide the JSON interface.

## Dependencies

EMR-FHIRbase:
* Python 3
* Django 1.8.x
* Django REST Framework
* Psycopg2
* jsonschema

FHIRbase:
* PostgreSQL 9.4
* pgcrypto
* pg_trgm
* btree_gin
* btree_gist

