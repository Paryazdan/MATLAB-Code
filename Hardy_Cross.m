%Initialize given data
K1 = [4,5,6]; %AD,DC,AC
K2 = [1,2,4]; %AB,BD,DA
Q1 = [35,-30,70]; %Loop 1 initial
Q2 = [15,-15,-35]; %Loop 2 initial
%Loop 1, i = 1
A1 = K1.*Q1.*abs(Q1); %KQ|Q|
A2 = 2*K1.*abs(Q1); %2KQ
h1 = sum(A1);
dQ1 = -h1/sum(A2);
Q1 = Q1 + dQ1;
Q2(3) = -Q1(1);
%Loop 2, i = 2
A1 = K2.*Q2.*abs(Q2); %KQ|Q|
A2 = 2*K2.*abs(Q2); %2KQ
h2 = sum(A1);
dQ2 = -h2/sum(A2);
Q2 = Q2 + dQ2;
Q1(1) = -Q2(3);
%Iterate until h < 0.01 and dQ < 0.001
while abs(dQ1)>0.001 || abs(dQ2)>0.001 || abs(h1)>0.01 || abs(h2)>0.01
    %Loop 1
    A1 = K1.*Q1.*abs(Q1); %KQ|Q|
    A2 = 2*K1.*abs(Q1); %2KQ
    h1 = sum(A1);
    dQ1 = -h1/sum(A2);
    Q1 = Q1 + dQ1;
    Q2(3) = -Q1(1);
    %Loop 2
    A1 = K2.*Q2.*abs(Q2); %KQ|Q|
    A2 = 2*K2.*abs(Q2); %2KQ
    h2 = sum(A1);
    dQ2 = -h2/sum(A2);
    Q2 = Q2 + dQ2;
    Q1(1) = -Q2(3);
end
fprintf("QAD is %f, QDC is %f,\nQCA is %f, QAB is %f\nand QBD is %f\n",Q1(1),Q1(2),Q1(3),Q2(1),Q2(2));