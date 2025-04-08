emptyExpNeg(I) :- expNeg(I), #false: universe(A), input(I, A).
fact(H) :- lastRule(I,H),  #false: universe(A), rulePos(I,H,A).
isSM(I) :- emptyExpNeg(I), #false: universe(A), fact(H).
lastRule(I,H) :- bgHead(I,H).
rulePos(I,H,A) :- bgHead(I,H), bgBodyPos(I,A).
ruleNeg(I,H,A) :- bgHead(I,H), bgBodyNeg(I,A).
{bound(I, J, A) : lastRule(J,A)} 1 :- expNeg(I), input(I, A).
boundNumber(I,A,N) :- expNeg(I), input(I, A), #count{J: bound(I, J, A)} == N.
sufficientRulesOK(I) :- expNeg(I), #false: input(I, A), boundNumber(I,A,N), N != 1.
bodyOK(I) :- expNeg(I), bound(I, J, H), #false: ruleNeg(J,H,A), input(I, A); #false: rulePos(J,H,A), not input(I, A).
expNegRely(I, H, A) :- expNeg(I), bound(I, J, H), rulePos(J,H,A).
expNegRely(I, A, C) :- expNegRely(I, A, B), expNegRely(I, B, C).
positiveBodyRelyOK(I) :- expNeg(I), bound(I, _, H), not expNegRely(I, H, H).
isSM(I) :- expNeg(I), sufficientRulesOK(I), bodyOK(I), positiveBodyRelyOK(I).
expNegCovered :- expNeg(I), isSM(I).
:- not expNegCovered.
#show expNegCovered/0.
