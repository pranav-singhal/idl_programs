pro ellipse
b = 3
a = 5
x = findgen(501)*0.01
y = b*(1-(x/a)^2)^0.5
iplot,x,y
iplot, x,-y,/overplot
iplot,-x,-y,/overplot
iplot,-x,y,/overplot

end
