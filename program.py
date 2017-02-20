#!/usr/bin/env python2

from bottle import route, run, template

@route('/')
def index():
    return "<b>Hi there.</b>"

run(host='0.0.0.0', port=8000)
