#!/bin/sh
UML=$(mktemp -d)'/model.uml'
TYPE='PNG'
MAINPATH='.'
DOCLETPATH=$MAINPATH/doclet
PUMLPATH=$MAINPATH/util


echo "Creating $UML..."

javadoc \
	-private \
	-quiet \
	-J-DdestinationFile=$UML \
	-J-DcreatePackages=false \
	-J-DshowPublicMethods=true \
	-J-DshowPublicConstructors=false \
	-J-DshowPublicFields=true \
	-doclet de.mallox.doclet.PlantUMLDoclet -docletpath util/plantUmlDoclet.jar \
	-sourcepath . src/main/java/*.java src/main/java/**/*.java


echo "Done creating plantUML model"

cat $UML

echo "Converting $UML to $TYPE..."
#java -jar $PUMLPATH/plantuml.jar \
java -jar util/plantuml-1.2021.14.jar \
  -config $PUMLPATH/config.cfg \
  -t $TYPE $UML
ret=$?
echo "Done generating PNG from model $ret"
