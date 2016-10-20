from flask import Flask
from flask import request
from yaml import load

app = Flask(__name__)

config_file_handle = open('config.yml', 'r')
config = load(config_file_handle)

log_path = 'log.txt'
if config.has_key('log_path'):
    log_path = config['log_path']

# FIXME: Doesn't close file automagically
outfile = open(log_path, 'w')

@app.route('/', methods=['POST'])
def logname():
    d = request.get_json()
    first = d['name']['first']
    last = d['name']['last']
    out_string = '%s,%s\n' % (first, last)
    outfile.write(out_string)
    outfile.flush()
    print out_string
    return "Yup!"

