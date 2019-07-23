rng(131313);
nstudents = 99;
StudentData = readtable('../../5-problems/students.csv');

% create triples of student IDs
Triple = randperm(nstudents);

% triple the student names
StudentTriple = cell(3,nstudents/3);
for i = 1:nstudents/3
    StudentTriple(:,i) = [ StudentData.Student(Triple(i)) ...
                         , StudentData.Student(Triple(nstudents/3+i)) ...
                         , StudentData.Student(Triple(2*nstudents/3+i)) ...
                         ];
end

xlswrite('nameTriples.xlsx',StudentTriple');
