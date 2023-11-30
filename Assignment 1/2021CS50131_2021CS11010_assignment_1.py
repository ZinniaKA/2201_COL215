
def possible_bool_values(list): # O(n)
        """this function takes the possible_values as input and return the boolean values a,b,c and d takes """
        coords =[]  # initialisation
        if len(list) ==2:  # this means that both variables has some value eg,1) [[0,1],[1]] or  2) [[1],[0,1]] or 3)[[0,1],[1,1]]
                if len(list[0])> len(list[1]): # first variable was assigned none
                        for i in list[0]:
                            coords.append([i,list[1][0]])  # this will give combination of 2 variables
                            #for eg [[0,1],[1,1]]
                elif len(list[0])< len(list[1]): # second variable was assigned none
                        for i in list[1]:
                            coords.append([list[0][0], i])
                            # eg  [[1,0],[1,1]]
                else: # both the variables were assigned none in the term list

                        for i in list[0]:
                                for j in list[1]:
                                    coords.append([i,j])
                        # eg [[0,1],[0,1],[1,1],[1,1]]
        elif len(list)==1:  # this means the varible is ony one eg 1)[[1]] or [[0]]
                for i in list:
                        coords.append(i)
                        # possible value that variable can take is its own value only
                        # eg coords =[1] or [0]
        elif len(list)==0:  # list is empty , in case of 2x2 and 2x4 k-map value of (c and d) and (d) are not defined respectively
                pass  # pass i.e. coords =[]
        return coords

def change_to_coords(l):
    if len(l)==2 or len(l)==4: # i.e input has 2 terms or four terms 
        for i in range(0,len(l)): # Assigning the values inside l from its grey-code to the cartesian value 
            if l[i] ==[0,0]:
                    l[i] = 0
            elif l[i] == [0,1]:
                    l[i] = 1
            elif l[i] == [1,1]:
                    l[i] = 2
            elif l[i] ==[0]:
                l[i] = 0
            elif l[i] == [1]:
                l[i] = 1
            else:
                    l[i] = 3
    elif len(l)==1 and len(l[0])==1: # input of type[[1]] or [[0]]
        if l[0] ==[0]:
                l[0] = 0
        elif l[0] == [1]:
                l[0] = 1
    elif len(l) == 1 and len(l[0])==2: #inputof type [[1,0]] or [[1,1]]
        l.append(l[0][1])
        l[0] = l[0][0]
    else: # if empty list is given for example in case of 2x2 k-map value of c and d are just empty lists[]
        pass
    return l

def coordinates(term):  #O(n^2 + k.n)==>O(n^2)
        """this fucntion takes the term as the input and changes it to the possible coordinates in x-y axes."""
        n = len(term)
        possible_values =[]  # this stores the possible values of a and b

        for i in term : # O(n)
                if i == None:  # i.e. the variable can take both 0 and 1 in the k-map
                        possible_values.append([0,1]) # appends [0,1] in the possible_values
                else:
                        possible_values.append([i]) # otherwise it appends the value of variable mentioned in the term
        if n%2==0:  #if length of terms is even ==> it is either a 2x2 or 4x4 k-map. the first two values represent a and b and last two as c and d
                a_b_vals = possible_bool_values(possible_values[0:n//2])         #O(n)
                c_d_vals = possible_bool_values(possible_values[n//2:])          #O(n)
        else: # it is a 2x4 k-map so the first two values represent a and b and the last value represents c
                a_b_vals = possible_bool_values(possible_values[0:n//2+1])
                c_d_vals = possible_bool_values(possible_values[n//2+1:])
        
        x_coords = change_to_coords(a_b_vals)   #this fetches the x coordinates for the [a,b] values in the a_b_vals list
        y_coords = change_to_coords(c_d_vals)   #this fetches the y coordinates for the [c,d] values in the c_d_vals list
  
        
        """this sorting is necessary to avoid wrong return value in 'get_region' function """
        x_coords.sort() #O(nlogn)
        y_coords.sort()
        is_none = False
        for i in term:
                if i == None:
                        is_none =True
                        break
        if is_none: # if none term was present 
                all_coords=[]   # contains the pair for possible coordinates in the k-map for a gievn term
                for y in y_coords: #O(n^2)
                        for x in x_coords:
                                all_coords.append((y,x))
        else: # there was no term with none i.e the term refers to only one block in the k map
                # assign x from grey code to its coordinate value
                if x_coords== [0,0]:
                        x_coords[0] = 0
                        x_coords.pop(-1)
                elif x_coords== [0,1]:
                        x_coords[0] = 1
                        x_coords.pop(-1)
                elif x_coords == [1,1]:
                        x_coords[0] = 2
                        x_coords.pop(-1)
                elif x_coords == [1,0]:
                        x_coords[0] = 3
                        x_coords.pop(-1)
                #assigning y fron greycode to its cartesian value.
                if y_coords == [0,0]:
                        y_coords[0] = 0
                        y_coords.pop(-1)
                elif y_coords== [0,1]:
                        y_coords[0] = 1
                        y_coords.pop(-1)
                elif y_coords == [1,1]:
                        y_coords[0] = 2
                        y_coords.pop(-1)
                elif y_coords == [1,0]:
                        y_coords[0] = 3
                        y_coords.pop(-1)
                all_coords=[]   # contains the pair for possible coordinates in the k-map for a gievn term
                for y in y_coords: #O(n^2)
                        for x in x_coords:
                                all_coords.append((y,x))
        return all_coords


def get_region(coord):  #O(n^2 + k.n)==>O(n^2)
    """this function returns back the region,i.e. the top left and bottom right coordinates of the region"""
    # coord--list of coordinates of values in region
    #part 1--separate the x and y coordinates
    x_coord=[]   #set of x-coordinates
    for ele in coord:   #O(n)
        if ele[0] not in x_coord:     #appends the x-coordinate if not present in the list
            x_coord.append(ele[0])

    y_coord=[]   #set of y-coordinates
    for ele in coord:   #O(n)
        if ele[1] not in y_coord:           #appends the y-coordinate if not present in the list
            y_coord.append(ele[1])

    #part 2--get the top left and bottom right coordinates which represent the region
    X = len(x_coord)
    Y = len(y_coord)
    for i in range(X): # checks if region is continuous column-wise
        if x_coord[i]== (x_coord[0]+i):
           i +=1
        else:
            for i in range(Y):#O(n) # checks if region is continuous row-wise
                if y_coord[i]== (y_coord[0] + i):
                   i +=1
                else:
                    return [(x_coord[X-1],y_coord[Y-1]),(x_coord[0],y_coord[0])] #region is discontinuous both row-wise and column-wise

            return [(x_coord[X-1],y_coord[0]),(x_coord[0],y_coord[Y-1])]  #region is discontinuous column-wise only

    for i in range(Y):#O(n)  # checks if region is continuous row-wise when it's continuous column-wise
        if y_coord[i]== (y_coord[0] + i):
           i +=1
        else:
            return [(x_coord[0],y_coord[Y-1]),(x_coord[X-1],y_coord[0])] #region is discontinuous row-wise only

    return [(x_coord[0],y_coord[0]),(x_coord[X-1],y_coord[Y-1])]         #region is continuous


def is_legal_region(kmap_function, term): #O(2n^2 + 2k.n + n) ==> O(n^2)
    """this is the final function which returns whether the region is legal or not """
    coordinats = coordinates(term)     #O(n^2 + k.n)  # converts to the x-y coordinate system
    region = get_region(coordinats)     #O(n^2 + k.n)   # returns the top left and the bottom right coordinates of the region
    is_true = True   # assumes that the region is true
    for i in coordinats: #O(n)
        #the region is legal if it contains 1 or'x', if a 0 is found in the region then it's not legal.
            if kmap_function[i[0]][i[1]] == 1:
                continue
            elif kmap_function[i[0]][i[1]] == 'x':
                continue
            elif kmap_function[i[0]][i[1]] == 0:  # if the region conatins 0 then  value of is_true will be changed to False and the loop will break
                is_true = False
                break
    return [region[0],region[1],is_true]  # final return statement

#TIME COMPLEXITY ==> O(n^2)
