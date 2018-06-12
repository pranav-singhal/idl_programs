pro tsi_data
file = dialog_pickfile(filter ='*.txt')
openr, lun, file, /get_lun
array = ''
line = ''
while not eof(lun) do begin 
readf, lun, line
array = [array,line]
endwhile
free_lun, lun
array= array[38:*]
print, size(array)
row = strsplit(array[0],' ',/extract)
row = double(row)
data_array = [row]
print, data_array
print, size(data_array)
for i=1,7322 do begin
row = double(strsplit(array[i],/extract))
data_array = [[data_array],[row]]
endfor
print,'elemts in data_array columsn', size(data_array[1,*],/n_elements)
monthly_arr = [0,0,0,0,0]
monthly_flag = 0
while(monthly_flag le 7322/30) do begin
	;print, 'month flag', monthly_flag
	sum1 =0
	sum2 =0
	sum3 =0
	sum4 =0
	divisor =0
	for j=monthly_flag*30, (monthly_flag +1)*30 do begin
		if(j lt size(data_array[1,*],/n_elements)) then begin
			sum1 = sum1 + data_array[1,j]
			sum2 = sum2 + data_array[2,j]
			sum3 = sum3 + data_array[3,j]
			sum4 = sum4 + data_array[4,j]
			divisor = divisor +1
		endif
	endfor
	print, 'current month is ', monthly_flag
	print, 'current divisor is ', divisor
	mean1 = sum1/divisor
	mean2 = sum2/divisor
	mean3 = sum3/divisor
	mean4 = sum4/divisor
	monthly_arr=[[monthly_arr],[monthly_flag,mean1,mean2,mean3,mean4]]
	monthly_flag = monthly_flag + 1
endwhile
print, monthly_arr
end
