# Stationeers XSLT Filters

## Installation

CentOS

```
yum install -y java-1.8.0-openjdk
cd /opt
wget https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-3J.zip
unzip SaxonHE9-9-1-3J.zip -d /opt/saxon
rm -f SaxonHE9-9-1-3J.zip
git clone https://github.com/dtandersen/stationeers-xslt-filter.git
```

## Run

Run server-clean2.xslt on world.xml:

```
java -cp /opt/saxon/saxon9he.jar net.sf.saxon.Transform \
  -s:world.xml \
  -xsl:/opt/stationeers-xslt-filter/server-clean2.xslt \
  -o:world.new.xml
rm -f world.xml
mv world.new.xml world.xml
```

## Filters

### server-clean2.xslt

* Removes starter items laying on the ground
* Removes all ore > 25 away from (0, 0, 0)
* Removes all items > 250 away from (0, 0, 0)
