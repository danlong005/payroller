PGM=PAYRL00001
FLAGS=-x -locesql -lpq

out: 
	ocesql $(PGM).cob $(PGM).cbl
	cobc $(FLAGS) $(PGM).cbl

	rm -f $(PGM).cbl

clean:
	rm -f $(PGM)
	rm -f $(PGM).cbl