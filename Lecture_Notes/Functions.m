%% Functions
% In the last class we wrote the following code to calculate
% the zeros of a sin(x).  
a = 2; 
b = 5; 
tolerance = 1e-8; 

for k = 1:1000
    x = (a + b) / 2; 
    fx = sin(x); 
    if abs(fx) < tolerance
        break
    end
    if sign(fx) == sign(sin(a))
        a = x; 
    else
        b = x; 
    end
end
% This function works perfectly well for what we wanted: It
% finds a zero of sin(x) between a and b.  Moreover, it is
% very easy to adjust a and b.  We were careful to set up
% our code so that we can just change the values for a and
% b at the top of our code (i.e., lines 4 and 5) and the
% rest of our code will just take these changes into
% account.  
% 
% Of course, a function that finds the zeros of sin(x) is
% not particularly useful, because we already know all of
% the zeros of sin(x).  What we really want is to be able to
% give Matlab an arbitrary function f(x) and have it find
% the zeros of that function.  In particular, it would be
% nice if we could change the function as easily as we
% changed a or b.  We would like to have a line at the top
% that says something like "f = sin(x)" that we could change
% however we wanted.  Unfortunately, this exact syntax would
% not do what we want.  The line
f = sin(x); 
% will either cause an error (because x is not defined) or
% set f equal to a number (because Matlab will plug the
% value of x into sin).  You might also think we could type
% "f = sin", but this also causes an error.  
% 
% Our idea, however, is sound; we just need to use somewhat
% akward syntax.  We define a function with the form 
% 
% function_name = @(variable_names)(function_body)
% 
% For example, to define the function f(x) = sin(x), we
% would write 
f = @(x)(sin(x)); 
% The @ symbol tells Matlab that this is a function
% definition.  The variable_names (in our case just x) tell
% Matlab that, for this line only, x is just a variable name
% and doesn't need to have a definition.  It allows us to
% use x in our formula without Matlab just plugging in a
% number.  Finally, the function body (in the second set of
% parentheses) is our formula.  If we want to plug a number
% into this function, we use the syntax
% "function_name(input)".  For instance, 
f(2)
f(pi)
x = 4; 
f(x) 
y = -2; 
f(y)
f(x - 2*y)
% Notice that we can use constants, variables, or even other
% expressions as input.  In particular, the name of our
% input does not have to be x.  The name x only mattered in
% line 51, but Matlab forgets it after that.  We could have
% defined f with the line 
f = @(y)(sin(y)); 
% or 
f = @(my_silly_variable_name)(sin(my_silly_variable_name)); 
% and we would have achieved exactly the same result.  
% 
% With this syntax, we can improve our bisection code as
% follows: 
f = @(x)(sin(x));
a = 2; 
b = 5; 
tolerance = 1e-8; 

for k = 1:1000
    x = (a + b) / 2; 
    fx = f(x); 
    if abs(fx) < tolerance
        break
    end
    if sign(fx) == sign(f(a))
        a = x; 
    else
        b = x; 
    end
end
% Notice that we replaced every instance of sin() in our
% code with f().  Now if we want to find the zero of a
% different function, we can just replace f on line 80 
% (and possibly adjust a and b as appropriate).  For
% instance, to find a zero of f(x) = x^2 + 2, we could write
f = @(x)(x^2 + 2);
a = 0; 
b = 2; 
tolerance = 1e-8; 

for k = 1:1000
    x = (a + b) / 2; 
    fx = f(x); 
    if abs(fx) < tolerance
        break
    end
    if sign(fx) == sign(f(a))
        a = x; 
    else
        b = x; 
    end
end
% 
%% Anonymous functions
% The functions we just made (like f = @(x)(x^2 + 2)) are
% called anonymous functions.  The syntax is fairly compact
% and often a good choice if we need to use a short function
% in a few places (like in our bisection code).  There are
% some important details that you should be familiar with.  
% 
% Your function can have any name that any other variable
% could have.  (Matlab variable names can only include
% letters, numbers and underscores and they have to start
% with a letter.)  For instance, we could define 
f = @(x)(sin(x)); 
cubed = @(x)(x^3); 
my_function3 = @(x)(x + 5); 
% To call a function (i.e., to plug a number into that
% function) you need to refer to it by name.  For example
f(3)
cubed(3)
my_function3(3)
% You can also assign your output to a new variable, just as
% you could with any other value you typed in.  For
% instance, 
x = f(3); 
output_variable = cubed(-2); 
z = my_function3(x);
% As we saw before, you can also give any name you want to
% the variable.  Whichever name you put after the @ symbol
% needs to match the name you use in the function body, but
% after that the name is irrelevant.  For instance, 
f = @(variable)(variable^2 + 2); 
% and 
f = @(x)(x^2 + 2); 
% create the same function, but 
% 
% f = @(variable)(x^2 + 2); 
% 
% would cause an error.  
% 
% You can also have any number of variables in your
% function.  For example, 
f = @(x)(x^2); 
f(2)
g = @(x, y)(x^2 + y^2);
g(1, 2)
h = @(x, y, z, u, v, w)(x^2 + y^2 + z^2 + u^2 + v^2 + w^2);
h(1, 2, 3, 4, 5, 6)
% You can even have a function with no variables, like 
c = @()(10);
c()
% 
% The function body can have any Matlab expression that you
% could fit in *one line*.  This is a pretty serious
% restriction.  For instance, you cannot put a loop or an if
% statement in an anonymous function because it takes more
% than one line.  You also can't put an assignment like "y =
% 2" in an anonymous function because that isn't an
% expression.  Similarly, you can't have an empty function 
% body because a blank line is not an expression.  
% (We won't worry about the definition of an
% expression in this class.  For our purposes, anything that
% you can put on the right of an equals sign is an
% expression.)  
% 
% Finally, a function can only have one output.  We never
% explicitly define the output; it is just the result of the
% one expression in our function body.  You can sort of
% cheat to get more than one output by making a vector in
% your function body.  For instance, 
f = @(x, y)([x + y; x - y])
f(1, 2)
% This is occasionally useful, but not a good general
% strategy.  

%% Function files
% The restrictions on the body in an anonymous function are
% quite severe, and they make anonymous functions too
% limited for general use.  Fortunately, there is a way to
% write larger functions by putting them in their own file.
% 
% To make a function file, you have to open up a new script
% and fill it out in the following format: 
% 
% function output_names = function_name(variable_names)
% 
% function_body
% 
% end
% 
% The words "function" and "end" must be written exactly as
% shown (just like "for" and "end" in a for loop or "if" and
% "end" in an if statement) and they must be the first and 
% last line of the script, respectively.  The function_name,
% variable_names and function_body work just like in an
% anonymous function.  The function_name can be anything
% that you could call a Matlab variable, the variable_names
% are a comma separated list of variable names and the
% function_body is the "formula" for your function.  There
% are two key differences: First, the function_body can have 
% as many lines as you want (and can include any code that 
% you could normally write in a script).  Second, you have
% to tell Matlab the name(s) of your output in output_names.
% This is because you will usually define many variables in
% your function body and you need to tell Matlab which one
% is the final answer.  
% 
% As an example, consider the righthand side of the logistic
% map from the homework: F(p) = r*p*(1 - p/K), where r and K
% are constants.  We can write this as an anonymous function
% by writing 
F = @(p, r, K)(r * p * (1 - p/K)); 
% I have made r and K variables because we might want to try
% different values later.  We can now plug values into this
% function easily.  For instance, if we want r = 3, K = 20
% and p = 14, we type 
F(14, 3, 20)
% or perhaps
r = 3; K = 20; p1 = 14; 
p2 = F(p1, r, K)
% (Notice that the order of inputs matters.  When we defined
% F we put p first, then r, then K, so when we call F we
% have to use the same order.)
% 
% I have also defined the same function in the file
% logistic_rhs.m.  We can call this function using exactly
% the same syntax as with an anonymous function.  
logistic_rhs(14, 3, 20)
% or 
r = 3; K = 20; p1 = 14; 
p2 = logistic_rhs(p1, r, K)
% Another advantage of function files is that they can have
% more than one output.  For example, the file example_1.m
% has a function with three outputs: x, y and z.  If we want
% to calculate all three outputs (using 1, 2 and 3 as our 
% inputs), we write 
[ans1, ans2, ans3] = example_1(1, 2, 3); 
% Notice that the names of our output variables do not have
% to match the names used in the function file.  
% 
% If we only want the variable x (the first output), we can
% write 
ans1 = example_1(1, 2, 3); 
% or 
[ans1] = example_1(1, 2, 3); 
% or even 
example_1(1, 2, 3)
% If we want the first two outputs (x and y), we can write 
[ans1, ans2] = example_1(1, 2, 3); 
% That is, if we ask for fewer outputs than the function
% defines, Matlab gives us the first outputs.  If we really
% only wanted later outputs, we could replace any that we
% didn't want with a ~.  For instance, 
[~, ans2, ans3] = example_1(1, 2, 3); 
[~, ans2] = example_1(1, 2, 3); 
[ans1, ~, ans3] = example_1(1, 2, 3); 
[~, ~, ans3] = example_1(1, 2, 3); 

%% Scope
% Most variables in Matlab have what is called "global
% scope".  This means that they can be accessed (and
% changed) from anywhere.  I could define a variable here,
% like 
x = 3;
% then use another script (or the command window) to read
% the value of x or even change the value of x.  Functions,
% however, do not follow this rule.  Any variables used in a
% function (including input and output variables, as well as
% any other variables you define in the function body) have
% what is called "local scope".  They cannot be read by
% other scripts/functions and they cannot change variables
% from other scripts/functions.  For instance, notice that
% the function logistic_rhs uses the variables p, r, K and
% P_out.  If we define these variables in our script: 
p = 0; 
r = 0; 
K = 0; 
P_out = 0; 
% and then call the function logistic_rhs:
P = logistic_rhs(14, 3, 20)
% We will see that we got the correct output for P (i.e.,
% the function did not use 0 for any of its input variables)
% and that our variables p, r, K and P_out are still 0
% (i.e., the function did not overwrite our variables).  
p
r
K
P_out
% This means that you do not have to care (or even know) the
% names of variables in a function file.  All you need to
% know is the name of the file, the order of inputs and the
% order of the outputs.  

%% Path
% How does Matlab find a function when you call it?  More
% importantly, what happens if we have two functions with
% the same name?  For example, if we define 
logistic_rhs = @(x, y, z)(x + y + z); 
% What will happen if we call logistic_rhs(14, 3, 20)?  Will
% Matlab use the new logistic_rhs or will it use our
% function file?  
logistic_rhs(14, 3, 20)
% It uses the anonymous function, not the function file!
% 
% Similarly, what happens if we define an anonymous function
% named sin or write a function file named sin?  Will we be
% able to use the builtin sin function?  
sin = @(x)(x^2); 
sin(2)
% Matlab always looks for functions in the following order: 
% First: It looks for an anonymous function with the correct
% name in your workspace.  
% Second: It looks for a function file with the correct name
% in your current working directory (usually the folder your
% script is saved in, but you can always check by looking at
% the file path above the command window).  
% Third: It looks for function files in folders in Matlab's
% "path", which is a list of directories.  The builtin
% functions are usually close to the top of that list, but
% it is certainly possible for other functions/folders to
% come first.  
% 
% If you define functions in two different ways, Matlab will
% only ever use the first one it finds.  We say that the
% first function "shadows" the later function.  This is
% almost always a bad thing, so you want to avoid repeating
% names when possible.  
% 
% One nice thing about shadowing is that you don't have to
% know the names of all the builtin functions.  If it turned
% out that logistic_rhs was a builtin Matlab function, it
% wouldn't affect our code in any way because our function
% would shadow the builtin.  This only becomes a problem if
% you shadow a function and then want to use the shadowed
% function later.  