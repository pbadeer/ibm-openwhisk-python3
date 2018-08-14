ACTION=exampleaction
ORG=preston
WORKSPACE=dev
URL=https://openwhisk.ng.bluemix.net/api/v1/web/$(ORG)_$(WORKSPACE)/default/$(ACTION)

all: build

setup:
	virtualenv --python=python3.6 virtualenv
	. virtualenv/bin/activate; pip install -r requirements.txt
	. virtualenv/bin/activate; pip install .

clean:
	rm -rf virtualenv web.zip

build:
	zip -r web.zip virtualenv/lib/python3.6/site-packages/ virtualenv/bin/activate_this.py template.mako __main__.py -x virtualenv/lib/python3.6/site-packages/pip/

create:
	ibmcloud wsk action create $(ACTION) --kind python-jessie:3 web.zip --web true

update:
	ibmcloud wsk action update $(ACTION) --kind python-jessie:3 web.zip --web true

delete:
	ibmcloud wsk action delete $(ACTION)

test:
	curl $(URL).json

open:
	open $(URL)
