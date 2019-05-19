# Stationeers XSLT Filters

## Installation

Requirements:

* Java
* Saxon

CentOS

```
yum install -y java-1.8.0-openjdk
cd /opt
wget https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-3J.zip
unzip SaxonHE9-9-1-3J.zip -d /opt/saxon
rm -f SaxonHE9-9-1-3J.zip
git clone https://github.com/dtandersen/stationeers-xslt-filter.git
```

Windows

Download Saxon-HE from https://www.saxonica.com/download/dotnet.xml

## Run

Run server-clean2.xslt on world.xml:

Linux

```
java -cp /opt/saxon/saxon9he.jar net.sf.saxon.Transform \
  -s:world.xml \
  -xsl:/opt/stationeers-xslt-filter/server-clean2.xslt \
  -o:clean-world.xml
mv world.xml world.xml.bak
mv clean-world.xml world.xml
```

Windows

```
"c:\Program Files\Saxonica\SaxonHE9.9N\bin\Transform.exe" \
   -s:world.xml \
  -xsl:C:\path\to\stationeers-xslt-filter\server-clean2.xslt \
  -o:clean-world.xml
```

## Filters

### server-clean2.xslt

* Removes starter items laying on the ground
* Removes ore >= 25 away from (0, 0, 0)
* Removes items >= 250 away from (0, 0, 0)
