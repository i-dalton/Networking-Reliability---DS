function result = runTwoSeriesLinkSim(K, p, N)
    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            r1 = rand; % generate random number for the first condition
            r2 = rand; % generate random number for the second condition
            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmission is not successful (either r1 < p or r2 < p)
            while r1 < p || r2 < p
                r1 = rand; % transmit again, generate new success check value r1
                r2 = rand; % transmit again, generate new success check value r2
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (both r1 > p and r2 > p)
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions before the entire application message (K successful packets) transmitted
    end

    result = mean(simResults);
end