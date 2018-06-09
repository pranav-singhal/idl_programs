pro new 
theory=sin(2*findgen(200)*!pi/25)*exp(0.02*findgen(200))
iplot, theory
plot , theory
atheory = cos(2*findgen(200)*!pi/25)*exp(0.02*findgen(200))
oplot, atheory

end
