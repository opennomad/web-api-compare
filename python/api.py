#!/usr/bin/python

from datetime import datetime
from flask import Flask
from flask import request
from flask import json
from flask import Response
import logging

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!\n"

@app.route("/time")
def time():
    d = datetime.now()
    return d.isoformat('T') + "\n"

@app.route("/sort",methods=['POST'])
def sort():
    try:
        arr = json.loads(request.data)
        return Response(json.dumps(sorted(arr)), mimetype="application/json")
    except:
        return Response(response=None, status=400,mimetype="application/json")

if __name__ == "__main__":
    logging.basicConfig(level=logging.ERROR)
    app.run(host='0.0.0.0',port=8080)
