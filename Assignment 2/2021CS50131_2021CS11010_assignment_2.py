"""COL 215 software assignment - 2 """
import string
alpha_helper_list = dict(enumerate(string.ascii_lowercase))  # this enumerates alphabets so that after the process, we can convert the output back to the 'word' form from its 'gray code' form.
def convert_to_alpha(st): 
    # this function converts a given gray code to the alphabetical form by utilising the position of all 1's,0's and *'s.
    #st:str--gray code representing a region eg. 11*00
    #returns-->
    #h3:str--alphabetical representation of the region eg. 11*00 to "abd'e'"
    n = len(st)
    final_ans=[]
    if st==('*'*n): # if the whole string consists of only '*' then None is returned as it corresponds to the entire region which is represented by 'None'.
        return None
    else:
        # check for all values and combine the correct alphabetical notation for the final_ans
        for i in range(0,n): # O(n)
            if st[i] =='*':
                pass
            elif st[i] =="1":
                h1= alpha_helper_list[i] # searching in alpha_helper_list to find which alphabet is being considered # O(1)
                final_ans.append(h1)
            elif st[i] =="0":
                h2= alpha_helper_list[i]
                h2+="'"
                final_ans.append(h2)
        h3 = "".join(final_ans) # joins to form a string 
        return h3  # h3 contains the final output
        # TIME COMPLEXITY : O(n)


def convert_to_gray(str):
    # this function converts the given input of string from aplhabetical form to its corresponding gray code output
    #str:str--alphabetical representation of the region eg. "a'b'cde"
    #returns-->
    #coor_list:int--gray code representation of the region eg. "a'b'cde" to 00111
    coor_list=[]
    for i in str: 
        # iterates through the whole string; it appends 1 in the coor_list for each element in str ,but if the next element encountered is ' then it replaces the last 1 with 0
        if i !="'":
            coor_list.append('1')
        else:
            coor_list.pop(-1)
            coor_list.append('0')
    return coor_list  # returns a list containing the gray code of the given input
    # TIME COMPLEXITY: O(n), where n is the length of string


def list_conv_int(list_str): 
    # converts the entire input of func_one or func_DC from its alphabetical form to its  gray code and using binary to decimal conversion on gray code to get the required decimal form
    #eg: input ["a'bc'd'e","ab'c'de"]                                                                    Alphabetical form
        #intermediate terms   k = ["01001","10011"]                                                      Gray code form
        # output : final_list = [9,19] elements in k are seen as binary and converted to decimal form  Decimal form
    #list_str: list of strings --- list of coordinates in aplhabetical form
    #returns-->
    #final_list:list of int--list of coordinates in decimal form(more specifically integers)
    final_list=[]
    for i in list_str:
        hp = convert_to_gray(i)
        k = "".join(hp)   #list of coordinates in gray code form
        final_list.append(int(k,base=2))  #conversion from binary to decimal on gray code
    return final_list

def compare(a,b): 
    # this function checks if 2 minterms differ only by 1 bit; no.of bits in a= no. of bits in b
    #a:int--first minterm
    #b:int--second minterm
    c = 0  # stores how many bits do the two inputs differ 
    for i in range(len(a)):
        if a[i] != b[i]:
            index_of_diff = i # stores the position where the difference happens
            c += 1
            if c>1: #the two inputs differ by more than one bit
                return (False,None) #returns False
    return (True,index_of_diff) #returns True and the index where the bit differs 
    #TIME COMPLEXITY: O(n), n is the no. of bits in a


def extender(x): 
    # extends a given list x
    f_items = []
    for i in x:
        f_items.extend(x[i])
    return f_items
    #TIME COMPLEXTIY:O(n), where n is the no.of elements in x

 

def splitter_base(k):  
    # this function takes the combined string (alphabetical form of gray code) and splits it into its correcponding parts
    # eg : input: "a'bc'd'e"
          # output : ["a'",'b',"c'","d'",'e']
    #k:str--alphabetical form of gray code
    # returns-->
    # split:list of str--list of elements constituting the string     
    n = len(k)
    i=0
    split=[]
    while i<n:
            if k[i]=="'":  # if encountered a prime then remove the last term and add a new term which includes the term popped + "'"
                split.pop()
                temp = k[i-1] + "'"
                split.append(temp)
            else:
                split.append(k[i])
            i+=1
    return split
    # TIME COMPLEXITY : O(n)


def is_inside(in1,in2): 
    # this function checks for overlapping regions
    # input :str-- in1 and in2 are two strings of different size 
    # output:str-- in2 if in1 is contained in in2
    #              in1 if in2 is contained in in1
    g1= splitter_base(in1)
    g2 = splitter_base(in2)  # splits the given input 
    if g1==g2: # if both are equal then can return any of them 
        return g1
    # check for common elements in the two sets if that is equal to smaller set then return the larger set
    elif len(g1)< len(g2):
        k = list((set(g1)&set(g2))) 
        k.sort()
        if k==g1:
            return in2 #in1 is contained in in2
    elif len(g1)>len(g2):
        k = list((set(g1)&set(g2))) # O(m), m is length of k 
        k.sort() # O(m.logm)
        if k==g2:
            return in1 #in2 is contained in in1
    # TIME COMPLEXITY: O(nmlogm)

def sorter(li): 
    # sorts a given list with (key = length) while ignoring the "*" while counting size of string
    # arranges the term representing regions from larger to smaller
    # eg: input : ["*00**","10**1","111**","*****"]
    #     output: ["*****","*00**","10**1","111**"]
    #li :list of str-- list of terms representing regions using 0,1 and *
    #returns:
    #new_list:list of str-- list of terms representing regions using 0,1 and * ; sorted in the required form
    helper_list = [] # stores a list containing size(without"*") of a string and the string 
    total_length = 0 # size of a string without "*"
    for i in li:
        for j in i:
            if j =="*":
                pass
            else:
                total_length +=1
        helper_list.append([total_length,i]) 
        total_length=0
    helper_list.sort() # sort with respect to first element of lists inside helper_list i.e. total_length
    new_lis =[]
    for t in helper_list:
        new_lis.append(t[1])
    return new_lis
    # TIME COMPLEXITY: O(n), n is the no. of elements in li


def comb_function_expansion(func_True,func_DC):
    """
        determines the maximum legal region for each term in the K-map function
        Arguments:
        3
        func_TRUE: list containing the terms for which the output is '1'
        func_DC: list containing the terms for which the output is 'x'
        Return:
        final_list: a list of terms-- expanded terms in form of boolean literals
    """
    all_ones = list_conv_int(func_True)  # converts terms for all ones to integer form
    all_dont_care= list_conv_int(func_DC) # convert terms for all don't cares to integer form
    all_ones.sort()        #time complexity : O(nlogn)
    minterms = all_ones+all_dont_care 
    minterms.sort()        #time complexity : O(nlogn)  
    # size = size of the K-map which kan be determined by length of binary form of the last term in minterms 
    if minterms ==[]: #all elements 0 or no elements
        return []
    elif len(bin(minterms[-1])) !=0:
        size = len(bin(minterms[-1]))-2  # -2 is done to compensate for 00 added to the front when term is converted from decimal to binary
    
    group={}  # making groups based on  the number of ones in the binary code
    mini_term =set()
    # grouping/expansion starts
    for minterm in minterms:  #we initiate by making groups based on the no. of 1s in the gray code
            # print(h[minterm])
            # print(size,minterm)
            try:
                group[bin(minterm).count('1')].append(bin(minterm)[2:].zfill(size))
            except KeyError:
                group[bin(minterm).count('1')] = [bin(minterm)[2:].zfill(size)]
            # print(group)
    
    while True:  # further grouping/exansion of terms is possible 
        tmp = group.copy()
        # initializatoin of variables.
        group = {}
        m= 0 
        common =set()
        terminate = True
        l = sorted(list(tmp.keys())) # sort the elements of tmp w.r.t its keys ,i.e w.r.t number of ones contained in it.
        for i in range(len(l)-1):
            for j in tmp[l[i]]: #iterates through current group's elements
                for k in tmp[l[i+1]]: #iterates through next group elements
                    res = compare(j,k) # Compares the minterms from the two groups
                    # rere =[]
                    if res[0]: # If the minterms differ by 1 bit only
                        try:  # try assigning them into correct groups with 0 ones, 1 ones , 2 ones...
                            # rere.append(j[:res[1]]+'*'+j[res[1]+1:])
                            group[m].append(j[:res[1]]+'*'+j[res[1]+1:]) if j[:res[1]]+'*'+j[res[1]+1:] not in group[m] else None # Put a '*' in place of the changing bit and add it to corresponding group
                        except KeyError:# if group does not exist and the res is true then create a new group
                            # rere.append(j[:res[1]]+'*'+j[res[1]+1:])
                            group[m] = [j[:res[1]]+'*'+j[res[1]+1:]] # put a '*' in place of the changing bit and add it to the newly created group
                        terminate = False
                        common.add(j) # Mark element j
                        common.add(k) # Mark element k

                    # used in demo
                    # if rere !=[]:
                    #     print("current region/term considered:",convert_to_alpha(j))
                    #     print("next region/term considered:",convert_to_alpha (k))
                    #     print("common region between: ",convert_to_alpha(rere[0]))
                    #     print("-"*50)
                    
            m += 1
        notcommon = set(extender(tmp)).difference(common) # Uncommon elements of each table/group for which no grouping was possible 
        mini_term = mini_term.union(notcommon)  # the groups which can't be further expanded end up forming our new mini_term set 
        
        if terminate:  # if further grouping is possible then terminate is true . hence this block will run and return the desired output
            t = list(mini_term) # converting minterm back to list from set
            t = sorter(t) # sorts the list within the specificatons of sorter function
            k = len(t[0]) 
            for i in range(0,len(t)):
                ne= convert_to_alpha(t[i]) # convert the 0,1,"*" string into alphabetical string 
                t[i] = ne # update the t list
            if not(None in t): # if None is not in T
                t.sort(key = len) # sort t with length of the common region
            final_list=[]
            for i in func_True: # iterates over func_True
                # finds the region in the list t in which this term is contained, appends that region into final_list once found and then moves ahead
                found = False 
                m=0
                while not found and m in range(0,len(t)):
                    if t[m] != None:
                        if is_inside(t[m],i) != None:
                            found = True
                            final_list.append(t[m])
                    elif t[m] == None: # entire K-map consists of only 1,so None will be appended in the final list.
                        final_list.append(t[m])

                    m+=1
            return final_list
