/*Katelyn Peterson Wages Lab*/

/*Filter the largest file*/

A = load 'oe.series.txt'; /*Load the big file*/

B = foreach A generate $0, $4, $5, $6, $7; /*Reduce the number of columns to deal with: id, occupation_code, datatype_code, state_code, and area_code*/

/*Filter the second file*/
C = load 'oe.data.1.AllData';

D = foreach C generate $0, $3; /*columns: id and value*/

/*Join files together by the id*/
G = join B by $0, D by $0;

/*-----------------------------------------------------------------------------------------*/
/*Average wage for each state*/
/*H = FILTER G by ($1 == 0 and $2 == 4);
I = GROUP H BY $3;
J = foreach I generate group, AVG(H.$6);
STORE J into 'question1output.txt';*/

/*-----------------------------------------------------------------------------------------*/
/*City with highest avg salary for 90% percentile across the different industries*/
/*datatype_code($2) == 15 for 90% for annual salary, occ_code($1) == 0, group by area_code($4)*/
/*H = FILTER G by ($1 == 0 and $2 == 15);
I = group H by $4;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question2Output.txt';*/


/*------------------------------------------------------------------------------------------*/
/*Avg wage for cities west of mississippi*/
H = FILTER G by (($3 == 2 or $3 == 4 or $3 == 5 or $3 == 6 or $3 == 8 or $3 == 15 or $3 == 16 or $3 == 19 or $3 == 20 or $3 == 22 or $3 == 27 or $3 == 29 or $3 == 30 or $3 == 31 or $3 == 32 or $3 == 35 or $3 == 38 or $3 == 40 or $3 == 41 or $3 == 46 or $3 == 48 or $3 == 49 or $3 == 53 or $3 == 56) and ($1 == 0));
I = GROUP H by $4;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC; 
STORE K into 'question3west.txt';


H = FILTER G by (($3 == 1 or $3 == 9 or $3 == 10 or $3 == 12 or $3 == 13 or $3 == 17 or $3 == 18 or $3 == 21 or $3 == 23 or $3 == 24 or $3 == 25 or $3 == 26 or $3 == 28 or $3 == 33 or $3 == 34 or $3 == 36 or $3 == 37 or $3 == 39 or $3 == 42 or $3 == 44 or $3 == 45 or $3 == 47 or $3 == 50 or $3 == 51 or $3 == 54 or $3 == 55) and ($1 == 0));
I = GROUP H by $4;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question3east.txt';





/*------------------------------------------------------------------------------------------*/
/*For each percentile reported (10%, 25%, 50%, 75%, 90%). Determine the industry with the highest *average wage.*/

/*H = FILTER G by ($2 == 11);
I = GROUP H by $1;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question4tenthpercentile';

H = FILTER G by ($2 == 12);
I = GROUP H by $1;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question4twentyfivepercentile';

H = FILTER G by ($2 == 13);
I = GROUP H by $1;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question4fiftypercentile';

H = FILTER G by ($2 == 14);
I = GROUP H by $1;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question4seventyfivepercentile';

H = FILTER G by ($2 == 15);
I = GROUP H by $1;
J = foreach I generate group, AVG(H.$6);
K = order J by $1 DESC;
STORE K into 'question4nintypercentile';
*/
/*store Result into 'output.txt';*/
