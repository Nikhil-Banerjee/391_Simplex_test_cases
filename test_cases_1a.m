classdef test_cases_1a < matlab.unittest.TestCase
    methods(Test)
        function cocktail(testCase)
            % As seen in tutorial.
            m = 3;
            n = 5;
            
            A = [0.08 0.06 1 0 0;
                 1 0 0 1 0;
                 0 1 0 0 1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';
            
            indices = [3 4 5]';

            for j = 1:m
                for i = 1:m
                    Bmatrix(i,j) = A(i, indices(j));
                end
            end
            
            [z,x,pi,ind,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices);

            testCase.verifyEqual(z,-290, RelTol = 1e-5);
            testCase.verifyEqual(x,[40,120,80].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-125/6, -1/3, 0].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[2,1,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function cocktail_unbounded(testCase)
            % Unbounded cocktail problem as seem in tutorial
            m = 3;
            n = 5;
            
            A = [0.08 0.06 -1 0 0;
                 1 0 0 -1 0;
                 0 1 0 0 -1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';
            
            indices = [3 4 5]';
            
            for j = 1:m
                for i = 1:m
                    Bmatrix(i,j) = A(i, indices(j));
                end
            end

            [z,x,pi,ind,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices);
            
            % Don't think we need all return values to be exact here as
            % long as exitflag = -1. But why not...
            testCase.verifyEqual(z,0, RelTol = 1e-5);
            testCase.verifyEqual(x,[-12,-120,-120].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[0, 0, 0].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[3,4,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,-1, RelTol = 1e-5);
        end

        function Assignment_1_Q3(testCase)
            m = 3;
            n = 6;
            
            A = [1 1 1 1 0 0;
                 1 2 2 -1 1 0;
                 1 2 1 0 -1 1];
            
            c = [15 10 -10 1 2 3]';
            
            b = [4 4 4]';
            
            indices = [4 5 6].';
            
            for j = 1:m
                for i = 1:m
                    Bmatrix(i,j) = A(i, indices(j));
                end
            end

            [z,x,pi,ind,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices);
            
            testCase.verifyEqual(z,-64/3, RelTol = 1e-5);
            testCase.verifyEqual(x,[4/3,8/3,4/3].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-11/3, -14/3, 3].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[4,3,6].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Cocktail_degenerate(testCase)
            % From slides
            % Unsure if this is right...
            % I haven't got it to work on my 1a yet plz check for mistakes.

            m = 3;
            n = 5;

            A = [0.08 0.06 1 0 0;
                 1 0 0 1 0;
                 0 1 0 0 1];

            b = [10 125 120].';

            c = [-7 -6 0 0 0].';

            indices = [3 4 5].';

            for j = 1:m
                for i = 1:m
                    Bmatrix(i,j) = A(i, indices(j));
                end
            end

            [z,x,pi,ind,exitflag] = simplex(A,b,c,m,n,Bmatrix,indices);

            testCase.verifyEqual(z,-875, RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end
    end
end
