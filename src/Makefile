PGM=PAYRL00001
FLAGS=-x -locesql -lpq

out: 
	ocesql $(PGM).cbl $(PGM).cob
	cobc $(FLAGS) $(PGM).cob

	rm -f $(PGM).cob

clean:
	rm -f $(PGM)
	rm -f $(PGM).cob