#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import urllib.request

import jinja2
import jinja2.meta

# Get all template variables
env = jinja2.Environment()
#raw = open(FILEPATH).read()
#tmpl = jinja2.Template(raw)
#ast = env.parse(raw)
ast = env.parse(open("pediatrics/acute_gastroenteritis_template").read())
v = jinja2.meta.find_undeclared_variables(ast)
print(v)
# Parse variables
# Request data from database over JSON
# Fill in the blanks
#tmpl.render()
