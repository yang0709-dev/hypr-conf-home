ULTIMATE_EXTRACTOR_3000

Getting Started:
1. Clone this repo
2. Make an alias in your shell of choice. EX: alias ext='/path/to/the/script' 
3. Reload shell config

Update Script:
1. git pull

SYNOPSIS
  ext [OPTION] ... [FILE(s)]

DESCRIPTION
  Extract all your extractable stuff, including everything in a directory, currently supports:
  .tar.gz
  .tar.xz
  .zip
  .7z

OPTIONS
  -d
    Deletes the original file.

EXAMPLE
  
  ext is the alias
  
  ext f1.tar.gz fil2.tar.xz fakjl.zip
  ext ./dir1 pgjdfsi.zip
  ext vmklm.7z
  ext a.zip -d b.7z c.tar.xz ==> deletes b.7z and c.tar.xz after extraction
