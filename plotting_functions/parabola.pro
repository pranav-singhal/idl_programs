pro parabola
a= 1
x = findgen(51)*0.1
y= (4*a*x)^0.5
iplot, x,y
iplot, x,-y,/overplot
end
