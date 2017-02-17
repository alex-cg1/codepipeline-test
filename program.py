#!/usr/bin/env python2

from bottle import route, run, template

@route('/')
def index(name):
    return template('<b>I hate people</b>!', name=name)

run(host='localhost', port=8000)
