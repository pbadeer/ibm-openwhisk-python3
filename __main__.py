# postgres connector?
from mako.template import Template

def main(args):
    t = Template(filename='./template.mako')
    # name = args.get("name", "stranger")
    return {"headers": {"Content-Type": "text/html"}, "statusCode": 200, "body": t.render()}
