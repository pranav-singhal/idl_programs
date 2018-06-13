pro tsi_data
file = dialog_pickfile(filter ='VIRGO_TSI_daily.txt')
openr, lun, file, /get_lun
array = ''
line = ''
while not eof(lun) do begin 
readf, lun, line
array = [array,line]
endwhile
free_lun, lun
array= array[38:*]
row = strsplit(array[0],' ',/extract)
row = double(row)
data_array = [row]
print,'size of data_array columb' ,size(data_array[1:*])
for i=1,7322 do begin
row = double(strsplit(array[i],/extract))
data_array = [[data_array],[row]]
endfor
monthly_arr = [0,0,0,0,0]
monthly_std_dev_arr = [0,0,0,0,0]
monthly_flag = 0
while(monthly_flag le 7322/30) do begin
	sum1 =0
	sum2 =0
	sum3 =0
	sum4 =0
	std_temp_arr1 = [0]
	std_temp_arr2 = [0]
	std_temp_arr3 = [0]
	std_temp_arr4 = [0]
	divisor =0
	for j=monthly_flag*30, (monthly_flag +1)*30 do begin
		if(j lt size(data_array[1,*],/n_elements)) then begin
			sum1 = sum1 + data_array[1,j]
			sum2 = sum2 + data_array[2,j]
			sum3 = sum3 + data_array[3,j]
			sum4 = sum4 + data_array[4,j]
			divisor = divisor +1
			std_temp_arr1 = [std_temp_arr1, data_array[1,j]]
			std_temp_arr2 = [std_temp_arr2, data_array[2,j]]
			std_temp_arr3 = [std_temp_arr3, data_array[3,j]]
			std_temp_arr4 = [std_temp_arr4, data_array[4,j]]
		endif
	endfor
	mean1 = sum1/divisor
	mean2 = sum2/divisor
	mean3 = sum3/divisor
	mean4 = sum4/divisor
	std_dev1 = stddev(std_temp_arr1)
	std_dev2 = stddev(std_temp_arr2)
	std_dev3 = stddev(std_temp_arr3)
	std_dev4 = stddev(std_temp_arr4)
	monthly_arr=[[monthly_arr],[monthly_flag,mean1,mean2,mean3,mean4]]
	monthly_std_dev_arr = [[monthly_std_dev_arr],[monthly_flag, std_dev1,std_dev2,std_dev3,std_dev4]]
	monthly_flag = monthly_flag + 1
	print, std_temp_arr1
endwhile
;uncomment code below to write the avg monthly data to a file
;fname = 'monthly_avg_tsi.txt'
;openw, 1, fname
;printf, 1, monthly_arr
;close,1
;uncomment code below to write std devs monthly data to a file
;fname = 'monthly_std_dev_tsi.txt'
;openw, 1, fname
;printf, 1, monthly_std_dev_arr
;close,1
;plot, monthly_arr[0,*],monthly_arr[1,*],min_value = -99
;print, monthly_std_dev_arr
end
