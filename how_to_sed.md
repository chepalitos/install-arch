# How to sed

Assign the filename
```
filename="Sales.txt"
```
Take the search string
```
read -p "Enter the search string: " search
```
Take the replace string
```
read -p "Enter the replace string: " replace
```
Run script
```
if [[ $search != "" && $replace != "" ]]; then sed -i "s/$search/$replace/" $filename fi
```
