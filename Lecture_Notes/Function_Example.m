% The first line of code (comments don't count) of any
% function file *MUST* be of the form 
% 
% function output_names = function_name(variable_names)
% 
function P_out = logistic_rhs(p, r, K)
% The word "function" has to come first.  
% 
% We decided to call our output P_out.  This name is usually
% not particularly important, but you should choose
% something that reminds you what you are calculating.
% Since this calculates a population density, I wanted to
% use P, but the letter p is already being used as an input,
% so I added _out to make it more clear.  
% 
% The name of this function is logistic_rhs.  The name of
% the file therefore *MUST* be logistic_rhs.m.  
% 
% The function has three inputs: p, r and K.  

% In between the first line (the one with "function") and
% the final "end", we put our function body.  In this case
% we only need one line, but you can put as much code as you
% want here. 
% 
% If this were a normal script, then we would have to define
% r, p and K before we used them, but in a function we are
% allowed to use input variables without defining them
% beforehand.  
% 
% Because of this, you cannot run a function file with any
% input variables.  If you click "run" you will get an
% error, because Matlab doesn't know what r, p or K are yet.
P_out = r * p * (1 - p / K); 

% The last line of every function must be "end".  (Actually,
% if you skip it everything will work fine, but it is a good
% habit to get into and will matter when we write more
% complicated functions.)
end
% WARNING: Most scripts are automatically saved when you run
% them, but you cannot run a function file.  This makes it
% very easy to forget to save your function, which will lead
% to bugs that are very difficult to catch.  