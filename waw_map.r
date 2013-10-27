require(grImport)
 
#vector file is: http://pl.wikipedia.org/wiki/Plik:Warszawa_podzial_administracyjny_2002.svg converted with Inkscape to PostScript. You should be able to make such convertion with pythonic pycairo
 
#UNIX USERS
download.file("http://www.users.pjwstk.edu.pl/~s8361/r/dane/geo/dzielnice.ps","dzielnice.ps")
PostScriptTrace("dzielnice.ps")
DZIELNICE_WAW <- readPicture("dzielnice.ps.xml")

#WINDOWS USERS
#DZIELNICE_WAW <- readPicture("http://www.users.pjwstk.edu.pl/~s8361/r/dane/geo/dzielnice.ps.xml") 
 
 
grid.picture(DZIELNICE_WAW)
Sys.sleep(4)
brokenDZIELNICE_WAW <- explodePaths(DZIELNICE_WAW)
picturePaths(brokenDZIELNICE_WAW, nr=3, nc=6,
label=FALSE, freeScales=TRUE)
 
 
DZIELNICE_WAWmanipulate <- function(foo) {
xscale <- DZIELNICE_WAW@summary@xscale
yscale <- DZIELNICE_WAW@summary@yscale
grid.picture(brokenDZIELNICE_WAW[foo],use.gc=FALSE, gp=gpar(fill=dane[dane$dzielnica==d[[foo]],]$color),
xscale=xscale, yscale=yscale)
}


