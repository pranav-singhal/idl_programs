pro interpol
fname = 'correct_virgo.txt'
data_file = read_ascii(fname)
data_array = data_file.(0)
print, size(data_array)
correct_array = [0,0]
i=0;
while(i le 7322) do begin 
	correct_array = [[correct_array],[i,data_array[1,i]]]
	i = i+1
endwhile
print, size(correct_array)
correct_array = correct_array[*,1:*]
print,size(correct_array)
j=0
x0 =0
x1=0
y0=0
y1=1
while(j le 7322) do begin 
	if correct_array[1,j] eq -99 && correct_array[1,j-1] ne -99 then begin
		x0 = j-1
		y0 = correct_array[1,j-1]	
	endif	
	if correct_array[1,j] eq -99 && correct_array[1,j+1] ne -99 && j ne 7322 then begin
		x1 = j+1
		y1 = correct_array[1,j+1]
	endif
	for k=x0+1,x1-1 do begin
		correct_array[1,k] = (k-x0)*(y1-y0)/(x1-x0) + y0
	endfor
;	if correct_array[1,j] lt 1358 then begin
;		print, j
;	endif
	j = j+1
	
endwhile
;print, correct_array
;iplot, correct_array[0,*],correct_array[1,*]
plot, correct_array[0,*], correct_array[1,*], yrange= [min(correct_array[1,*]),max(correct_array[1,*])], title = 'daily tsi values'
k = 0
;fname = 'correct_data.txt'
;openw, 1, fname
;printf, 1 ,correct_array
;close,1
a = 0
b = 29
mean_and_std_dev = [0.0,0.0]
while b le 7322 do begin
 m = mean(correct_array[1,a:b])
 s =stddev(correct_array[1,a:b])
 mean_and_std_dev = [[mean_and_std_dev],[m,s]]
 a= b +1
 b = a + 29

endwhile
print, size(mean_and_std_dev)
window, 1
plot, findgen(245), mean_and_std_dev[0,1:*], yrange = [min(mean_and_std_dev[0,1:*]),max(mean_and_std_dev[0,1:*]) ], title = 'mean tsi values '
window, 2
plot, findgen(245), mean_and_std_dev[1,1:*], yrange = [min(mean_and_std_dev[1,1:*]),max(mean_and_std_dev[1,1:*]) ], title = 'standard deviation in tsi values '

end
