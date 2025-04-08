{rawRuleHead(I,A) : universe(A), not input(I, A)} 1 :- expNeg(I).
{rawRulePos(I,H,A)} :- expNeg(I), rawRuleHead(I,H), input(I, A).
{rawRuleNeg(I,H,A)} :- expNeg(I), rawRuleHead(I,H), universe(A), not input(I, A).
appNeg(I,H,K) :- rawRuleHead(I,H), expNeg(K), #false: rawRulePos(I,H,A), not input(K, A); #false: rawRuleNeg(I,H,A), input(K, A).
output(I, H) :- expNeg(I), appNeg(_,H,I). 
expNegMatch(I, t) :- expNeg(I), #false: input(I, A), not output(I, A); #false: output(I, A), not input(I, A).
expNegMatch(I, f) :- expNeg(I), not expNegMatch(I, t).
output(I, A) :- expPos(I), input(I, A).
rawRuleHead(I,H) :- bgHead(I,H).
rawRulePos(I,H,A) :- bgHead(I,H), bgBodyPos(I,A).
rawRuleNeg(I,H,A) :- bgHead(I,H), bgBodyNeg(I,A).
rawRuleHead(I,A) :- expPos(I), output(I, A).
{rawRulePos(I,H,A)} :- expPos(I), rawRuleHead(I,H), output(I, H), input(I, A).
{rawRuleNeg(I,H,A)} :- expPos(I), rawRuleHead(I,H), universe(A), not input(I, A).
rely(I,H,A) :- expPos(I), rawRuleHead(I,H), rawRulePos(I,H,A).
rely(I,A,C) :- rely(I,A,B), rely(I,B,C).
:- rely(I,H,H).
app(I,H,K) :- rawRuleHead(I,H), expPos(K), #false: rawRulePos(I,H,A), not input(K, A); #false: rawRuleNeg(I,H,A), input(K, A).
beyond(I,H,J) :- app(I,H,J), not output(J, H). 
:- rawRuleHead(I,H), expPos(J), beyond(I,H,J).
coincideHead(I1,H,I2) :- rawRuleHead(I1,H), rawRuleHead(I2,H), I1 < I2. %reduce redundancy via I1 < I2
coincideRule(I1,H,I2) :- coincideHead(I1,H,I2), #false: rawRulePos(I1,H,A), not rawRulePos(I2, H, A); #false: rawRulePos(I2,H,A), not rawRulePos(I1, H, A); #false: rawRuleNeg(I1,H,A), not rawRuleNeg(I2, H, A); #false: rawRuleNeg(I2,H,A), not rawRuleNeg(I1, H, A). 
leave(I,H) :- rawRuleHead(I,H), not bgHead(I,H), not coincideRule(_,H,I), #false: coincideRule(I,H,J), bgHead(J,H).
lastRule(I,H) :- leave(I,H), rawRuleHead(I,H).
rulePos(I,H,A) :- lastRule(I,H), rawRulePos(I,H,A).
ruleNeg(I,H,A) :- lastRule(I,H), rawRuleNeg(I,H,A).
:- #count{I,H: lastRule(I,H)} != n.
#show universe/1.
#show lastRule/2.
#show rulePos/3.
#show ruleNeg/3.
#show bgHead/2.
#show bgBodyPos/2.
#show bgBodyNeg/2.
#show expNegMatch/2.
#show expNeg/1.
#show input/2.