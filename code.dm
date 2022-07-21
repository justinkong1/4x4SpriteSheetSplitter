mob/verb
    ConvertIcon()
        var/Z = input("Choose an Icon to convert") as icon|null
        if(Z)
            var/icon/Final  = new('BlankIcon.dmi')
            var/icon/I = new(Z)
            var/w = I.Width()/4
            var/h = I.Height()/4
            
            world << "\nICON: [Z] PROCCESS BEGIN:\n"
            
            for(var/i=h, i<=h*4, i+=h)
                var/icon/is = new('BlankIcon.dmi')
                var/f
                f = 0
                for(var/j=w, j<=w*4, j+=w)
                    f++
                    var/icon/C = new(I)
                    
                    var
                        x1 = (j+1)-w 
                        y1 = (i+1)-h
                        
                        x2 = j
                        y2 = i
                    
                    C.Crop(x1,y1,x2,y2)
                    world << "FRAME [j]: [x1],[y1] to [x2],[y2]"
                    
                    is.Insert(C,frame = f)
                
                
                if(i == h)
                    Final.Insert(is,dir=NORTH)
                if(i == h*2)
                    Final.Insert(is,dir=EAST)
                if(i == h*3)
                    Final.Insert(is,dir=WEST)
                if(i == h*4)
                    Final.Insert(is,dir=SOUTH)
            
            
            world << "\nICON: [Z] | PROCESS END.\n"

            fcopy(Final,"Converted/[Z]")
