pro circle
x= 0.1*findgen(51)
y = sqrt(25-x^2)
iplot,x,y
iplot,x,-1*y,/overplot
iplot,-1*x,y,/overplot
iplot,-1*x,-1*y,/overplot
end
