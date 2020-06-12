d=$(date +%F-%H:%M:%S)
# echo "$d"

cd bak
docker build -t bak .

echo "Generating SQL..."
sql_bak=$d-grtnr.de.sql
docker run bak > $sql_bak
echo "Generating SQL - Done [$sql_bak]"

echo "Zipping content..."
zip_bak=$d-grtnr.de.zip
mkdir ../bak-data
zip -r ../bak-data/$zip_bak $sql_bak ../grtnr.de/ghost_content
echo "Zipping content - Done"

echo "Cleaning up..."
rm $sql_bak
cd ..
echo "Cleaning up - Done"


