## PDF to jpg
```
mogrify -density 144 -format jpg *pdf
```
This works much better than `convert` with regards to the quality.

## Compress PDF
From [here](https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file)
```
convert -density 200x200 -quality 60 -compress jpeg input.pdf output.pdf
```
