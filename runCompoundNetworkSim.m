function result = runCompoundNetworkSim(K, p, N)
    simResults = ones(1, N); % a place to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
        
        % Parallel link simulation from a to b
        while pktSuccessCount < K
            % Simulate transmission on the parallel links
            r1 = rand; % generate random number for link 1
            r2 = rand; % generate random number for link 2
            r3 = rand; % generate random number for link 3

            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmission is not successful on both links
            while r1 < p && r2 < p
                r1 = rand; % generate new success check value for link 1
                r2 = rand; % generate new success check value for link 2
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

            while r3 < p %compare for series link
                r3 = rand;
                txAttemptCount = txAttemptCount + 1;
            end
            
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success on both links
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end

    result = mean(simResults);
end
