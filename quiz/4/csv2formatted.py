import sys
outfile = open(sys.argv[2], 'w')
with open(sys.argv[1], 'r') as infile:
    for row in infile:
        for column in row.split(','):
            outfile.write( '{:44.3f}'.format(float(column)) )
        outfile.write('\n')
    outfile.close()