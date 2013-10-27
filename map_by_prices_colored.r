

#https://www.stat.auckland.ac.nz/~paul/R/grImport/import.pdf

#http://cran.r-project.org/web/packages/grImport/index.html

require(grImport)
 
#vector file is: http://pl.wikipedia.org/wiki/Plik:Warszawa_podzial_administracyjny_2002.svg converted with Inkscape to PostScript. You should be able to make such convertion with pythonic pycairo
 

download.file("http://www.users.pjwstk.edu.pl/~s8361/r/dane/geo/dzielnice.ps","dzielnice.ps")
PostScriptTrace("dzielnice.ps")
DZIELNICE_WAW <- readPicture("dzielnice.ps.xml")
 
 
 
grid.picture(DZIELNICE_WAW)
Sys.sleep(4)
brokenDZIELNICE_WAW <- explodePaths(DZIELNICE_WAW)
#picturePaths(brokenDZIELNICE_WAW, nr=3, nc=6,
#label=FALSE, freeScales=TRUE)
 
 
DZIELNICE_WAWmanipulate <- function(foo) {
xscale <- DZIELNICE_WAW@summary@xscale
yscale <- DZIELNICE_WAW@summary@yscale
grid.picture(brokenDZIELNICE_WAW[foo],use.gc=FALSE, gp=gpar(fill=dane[dane$dzielnica==d[[foo]],]$col),
xscale=xscale, yscale=yscale)
}

d<-c('Białołęka','Bielany','Bemowo','Ursus','Włochy','Praga Północ','Śródmieście','Targówek','Żoliborz','Wola','Ochota','Rembertów','Wesoła','Praga Południe','Wawer','Mokotów','Wilanów','Ursynów')

names(d)<-c(1:18)

dane<-read.csv("http://www.users.pjwstk.edu.pl/~s8361/r/dane/geo/dzielnice_stats.csv", fileEncoding="utf8")
#posortowanie po SREDNIA_CENA_M
dane<-dane[with(dane,order(dane$SREDNIA_CENA_M)),]
#paleta z ktorych stworzymy wektor kolorow od min, max
paletaKolorow<-colorRampPalette(c('green','red'))
dane$col <- paletaKolorow(18)[as.numeric(cut(dane$SREDNIA_CENA_M,breaks=18))]
#s<-barplot(dane$SREDNIA_CENA_M,col=dane$col,names=dane$dzielnica,las=2)




for (i in 1:18){
print(d[i])
DZIELNICE_WAWmanipulate(i)
Sys.sleep(0.5)
}

grid.picture(brokenDZIELNICE_WAW[19:58])