#!/usr/bin/env python2

from bottle import route, run, template

@route('/')
def index():
    return template('<b>I hate people</b>!', name=name)

run(host='0.0.0.0', port=8000)
