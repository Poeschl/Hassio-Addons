#!/usr/bin/env python3
import json
import sys
import os
import yaml
from dotty_dict import dotty

def convert_file(file, path):
    yaml_file_name = os.path.splitext(file)[0] + ".yaml"
    #print (file + ' -> ' + yaml_file_name)
    with open(file, 'r') as infile:
        with open(yaml_file_name, 'w+') as outfile:
            if path is not None:
                data = dotty(json.load(infile)).get(path)
            else:
                data = json.load(infile)

            yaml.dump(data, outfile, default_flow_style=False)

input_file = sys.argv[1]
if len(sys.argv) > 2:
    path = sys.argv[2]
else:
    path = None

if os.path.isfile(input_file):
    convert_file(input_file, path)
else:
    #print ('Convert folder ' + input_file)
    for json_file in os.listdir(input_file):
        convert_file(os.path.dirname(input_file) + '/' + json_file, path)
