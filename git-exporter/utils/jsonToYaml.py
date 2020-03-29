#!/usr/bin/env python3
import json
import sys
import os
import yaml


def convert_file(file):
    if os.path.splitext(file)[1] == '.json':
        yaml_file_name = os.path.splitext(file)[0] + ".yaml"
        with open(file, 'r') as infile:
            with open(yaml_file_name, 'w+') as outfile:
                print (file + ' -> ' + yaml_file_name)
                yaml.dump(json.load(infile), outfile, default_flow_style=False)
    else:
        print('Skip ' + file)

input_file = sys.argv[1]

if input_file is None:
    raise AttributeError("Folder parameter is missing")

if os.path.isfile(input_file):
    convert_file(input_file)
else:
    for json_file in os.listdir(input_file):
        convert_file(os.path.dirname(input_file) + '/' + json_file)
