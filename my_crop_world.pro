pro CropWorld
common block1, world
world = read_png(filepath('avhrr.png', subdir =['examples','data']), r, g, b)
device, decomposed = 0,retain = 2
tvlct, r,g,b
worldsize =size(world,/dimensions)
window, 0, xsize = worldsize[0], ysize = worldsize[1]
;tv, world
print, world
;window, 2, Xsize = (120-27+1), Ysize = (160-10+1)
;tv, africa
print, "hello world"
end 
