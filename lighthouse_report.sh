rm -r lighthouse || true
mkdir lighthouse
cat sitemap.txt | while read line
do 
  report="${line////-}"
  report="${report//./-}"
  report="${report:8:${#report}-3}"
  report="./lighthouse/${report}.html"
  echo $report
  lighthouse --chrome-flags="--headless" --output-path=$report $line
done
