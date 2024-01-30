/* 
Write a Prolog code to solve the problem below.  



Exercise 4. Cake Theft

 

During a recent police investigation, Chief Inspector Stone was interviewing five local villains to try and identify who stole Mrs. Archer's cake from the mid-summers fayre. Below is a summary of their statements:



Arnold:  it wasn't Edward

         it was Brian



Brian:   it wasn't Charles

         it wasn't Edward



Charles: it was Edward

         it wasn't Arnold



Derek:   it was Charles

         it was Brian



Edward:  it was Derek

         it wasn't Arnold



It was well known that each suspect told exactly one lie. Can you determine who stole the cake?
 */
main:-
    Persons = [
        arnold-Arnold,
        brian-Brian,
        charles-Charles,
        derek-Derek,
        edward-Edward
    ],
    Vars = [Arnold,Brian,Charles,Derek,Edward],
    maplist(trueOrFalse,Vars),
    % only one theft
    sum_list(Vars, 1),
    exactlyOneLie(not(Edward),Brian),
    exactlyOneLie(not(Charles),not(Edward)),
    exactlyOneLie(Edward,not(Arnold)),
    exactlyOneLie(Charles,Brian),
    exactlyOneLie(Derek,not(Arnold)),
    member(Person-1,Persons),
    writeln(Person).

trueOrFalse(0).
trueOrFalse(1).

exactlyOneLie(A,B):-
    simp(A,A1),simp(B,B1),
    ([A1,B1] = [0,1];[A1,B1]=[1,0]).

simp(not(0),1):-!.
simp(not(1),0):-!.
simp(X,X).