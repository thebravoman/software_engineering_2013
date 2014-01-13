#Basic allocator sample
#This should work with python 3.0 or higher.(Tested with 3.3.0)

#plane
class Pool():
    blocks = {}
    def __init__(self, rows, columns, bigcolumns):
        self.blocks[columns] = rows * bigcolumns;
        self.max = columns
        self.bigcolumns = bigcolumns
        self.rows = rows
        
        for i in range(0, columns):
            self.blocks[i] = 0
    def alloc(self, size):
        for i in range(size, self.max+1):
            if self.blocks[i] > 0:
                self.blocks[i] -= 1
                if i - size != 0:
                    self.blocks[i-size] += 1
                return 1
        return 0
    def __str__(self):
        r = ""
        for i in range(0, self.max+1):
            r += "Blocks with size %i: %i\n" % (i, self.blocks[i])
        return r
    def get_max(self, data):
        for i in range(1, self.max+1):
            if data[i] > 0:
                data[i] -= 1
                return self.max - i
        return self.max
    def print_grid(self):
        #make a copy of the blocks data
        #so we can change it
        data = {}
        for i in range(1, self.max+1):
            data[i] = self.blocks[i]
    
        for row in range(0, self.rows):
            for bc in range(0, self.bigcolumns):
                n = self.get_max( data)
                for i in range(0, n):
                    print("X", end="")
                for i in range(0, self.max - n):
                    print("O", end="")
                print(" ", end="")
            print("")
    
import random
def run():
    pool = Pool(20, 3, 3)
    print(pool)
    for i in range(0, 20):
        seats_requested = random.randint(1,3)
        if(pool.alloc(seats_requested) == 0):
            break
    print(pool)
    pool.print_grid()
    
if __name__ == "__main__":
    run()
