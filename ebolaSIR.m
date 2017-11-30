function [] = ebolaSIR()
    %models the spread of ebola in Sierra Leone
    N = 7396000; %population of SL
    q = 0.604*N; %herd immunity level
    b = 0.25; %contacts per day
    g = 0.0714; %1/g = mean infection period
    c = 0.005; %vaccination rate
    S = zeros(1, 365); %population not yet infected
    I = zeros(1, 365); %population infected and capable of spreading
    R = zeros(1, 365); %population considered dead
    V = zeros(1, 365); %vaccinated and immune population
    S(1, 1) = 7395999;
    I(1, 1) = 1; %Start outbreak with 1 infected individual
    R(1, 1) = 0; 
    V(1, 1) =0;
    
    for i = 2:365
       S(1, i) = S(1, i-1)-((b*S(1, i-1)*I(1, i-1))/N) - c*S(1, i-1); 
       I(1, i) = I(1, i-1)+((b*S(1, i-1)*I(1, i-1))/N) - g*I(1, i-1);
       R(1, i) = R(1, i-1)+g*I(1, i-1);
       V(1, i) = V(1, i-1) + c*S(1, i-1);
    end
    Q = zeros(1, 365);
    Q(1, 1:365) = q;
    
    figure;
    hold on;
    plot(S);
    plot(I);
    plot(V);
    plot(R);
    plot(Q)
    legend('show');
    legend('Susceptible', 'Infected', 'Vaccinated', 'Dead', 'Herd Immunity'); 
    title('Spread of Ebola in Sierra Leone');
    xlabel('Days Since First Infection');
    ylabel('Population');
    
end
    