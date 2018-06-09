pro geo
demfile = filepath('elevbin.dat',subdir=['examples','data'])
dem =read_binary(demfile,data_dims=[64,64])
dem = congrid(dem,128,128,/interp)
imagefile = filepath('elev_t.jpg',subdir=['examples','data'])
read_jpeg,imagefile,image
device, decomposed =0
window, 0, title ="elevation plot"
shade_surf,dem
owindow = obj_new('idlgrwindow',retain =2,color_model =0)
oview = obj_new('idlgrview')
omodel = obj_new('idlgrmodel')
osurface = obj_new('idlgrsurface',dem,style=2)
oimage =obj_new('idlgrimage',image,interleave =0,/interpolate)
end
